//Adam Pinarbasi
//akpinarb

#include <bitset>
#include <iostream>
#include <string>
#include <unordered_map>
#include <cstdlib>
#include <cstring>

#include "astree.h"
#include "utils.h"
#include "symbol_table.h"
#include "stringset.h"

using namespace std;

vector<symbol_table*> symbol_stack;
symbol_table type_table;

size_t blocknr = 0;

symbol* node_symbol (astree* node) {
   symbol* this_node = new symbol();
   this_node->attributes  = node->attributes;
   this_node->filenr      = node->lloc.filenr;
   this_node->linenr      = node->lloc.linenr;
   this_node->offset      = node->lloc.offset;
   this_node->blocknr     = node->blocknr;
   this_node->struct_name = node->struct_name;
   return this_node;
}


void print_coords (astree* node, FILE* outfile) {
   if (symbol_stack.back() == nullptr) {
      fprintf (outfile, "\n");
      return;
   }
   auto it_symbol = (symbol_stack.back())->find (node->lexinfo);
   if (it_symbol == (symbol_stack.back())->end()) {
      fprintf (outfile, "\n");
      return;
   }
   symbol* this_symbol = (*it_symbol).second;
   fprintf (outfile, "(%lu.%lu.%lu)\n", this_symbol->filenr,
                                      this_symbol->linenr,
                                      this_symbol->offset);
}

const char* get_attributes (attr_bitset attributes) {
   string out = "";

   if (attributes[ATTR_void])     out += "void ";
   if (attributes[ATTR_int])      out += "int ";
   if (attributes[ATTR_bool])     out += "bool ";
   if (attributes[ATTR_char])     out += "char ";
   if (attributes[ATTR_string])   out += "string ";
   if (attributes[ATTR_struct])   out += "struct ";
   if (attributes[ATTR_typeid])   out += "typeid ";
   if (attributes[ATTR_null])     out += "null ";
   if (attributes[ATTR_array])    out += "array ";
   if (attributes[ATTR_function]) out += "function ";
   if (attributes[ATTR_variable]) out += "variable ";
   if (attributes[ATTR_field])    out += "field ";
   if (attributes[ATTR_lval])     out += "lval ";
   if (attributes[ATTR_param])    out += "param ";
   if (attributes[ATTR_const])    out += "const ";
   if (attributes[ATTR_vreg])     out += "vreg ";
   if (attributes[ATTR_vaddr])    out += "vaddr ";

   return out.c_str();
}

void set_params (astree* node) {
   for (size_t i = 0; i < node->children.size(); ++i) 
      set_params (node->children.at(i));
   if (node->symbol == DECLID) 
      node->attributes[ATTR_param] = true;
}

void insert_var_fn (astree* node) {
   if (symbol_stack.back() == nullptr) {
      symbol_stack.pop_back();
      symbol_table* var_fn_table = new symbol_table ();
      symbol_stack.push_back (var_fn_table);
   }
   symbol* this_symbol = node_symbol (node);
   symbol_table* this_table = symbol_stack.back();
   this_table->emplace (node->lexinfo, this_symbol);
}

void traversal (astree *node) {
   node->blocknr = blocknr;

   switch (node->symbol) {

      case TOK_KW_VOID:
         node->attributes[ATTR_void] = true;
         if (node->children.size() > 0)
            node->children.at(0)->attributes[ATTR_void] = true;
         break;

      case TOK_KW_INT: 
         node->attributes[ATTR_int] = true;
         if (node->children.size() > 0)
            node->children.at(0)->attributes[ATTR_int] = true;
         break;

      case TOK_KW_BOOL:
         node->attributes[ATTR_bool] = true;
         if (node->children.size() > 0)
            node->children.at(0)->attributes[ATTR_bool] = true;
         break;

      case TOK_KW_CHAR:
         node->attributes[ATTR_char] = true;
         if (node->children.size() > 0)
            node->children.at(0)->attributes[ATTR_char] = true;
         break;

      case TOK_KW_STRING:
         node->attributes[ATTR_string] = true;
         if (node->children.size() > 0)
            node->children.at(0)->attributes[ATTR_string] = true;
         break;

      case TOK_KW_STRUCT:
         node->attributes[ATTR_struct] = true;
         if (node->children.size() > 0) 
            node->children.at(0)->attributes[ATTR_struct] = true;
         break;

      case FIELD:
         node->attributes[ATTR_field] = true;
         node->children.at(0)->attributes[ATTR_field] = true;
         break;

      case TOK_FUNCTION:
         node->attributes[ATTR_function] = true;

         ++blocknr;
         for (auto it = node->children.begin(); 
                   it != node->children.end(); ++it) 
            perform_traversal (*it);
         --blocknr;

         if (node->children.size() > 0) {

            node->children.at(0)->children.at(0)
                ->attributes[ATTR_function] = true;

            node->children.at(0)->children.at(0)
                ->blocknr = 0;

            node->children.at(0)->blocknr = 0;

            node->children.at(0)->children.at(0)
                ->attributes[ATTR_variable] = false;

            node->children.at(0)->children.at(0)
                ->attributes[ATTR_lval] = false;
         }

         break;

      case TOK_KW_NULL:
         node->attributes[ATTR_null]  = true;
         node->attributes[ATTR_const] = true;
         break;

      case TOK_ARRAY:
         node->attributes[ATTR_array] = true;
         break;

      case TOK_PARAM:
         node->attributes[ATTR_param] = true;
         set_params (node);
         break;

      case NUMBER:
         node->attributes[ATTR_int]   = true;
         node->attributes[ATTR_const] = true;
         break;

      case CHAR_LIT:
         node->attributes[ATTR_char]  = true;
         node->attributes[ATTR_const] = true;
         break;

      case STRING_LIT:
         node->attributes[ATTR_string] = true;
         node->attributes[ATTR_const]  = true;
         break;

      case TYPEID: 
         node->attributes[ATTR_typeid] = true;
         if (node->children.size() > 0) {
            node->children.at(0)->attributes[ATTR_struct] = true;
            node->children.at(0)->struct_name = 
               (node->lexinfo)->c_str();
         }
         break;

      case DECLID: 
         node->attributes[ATTR_variable] = true;
         node->attributes[ATTR_lval]     = true;
         break;

      case ARRAY_DECL:
         node->attributes[ATTR_variable] = true;
         node->attributes[ATTR_lval]     = true;
         node->attributes[ATTR_array]    = true;

      case TOK_KW_IF: 
         ++blocknr;
         for (auto it = node->children.begin(); 
                   it != node->children.end(); ++it) 
            perform_traversal (*it);
         --blocknr;
         break;

      case TOK_KW_ELSE:
         ++blocknr;
         for (auto it = node->children.begin(); 
                   it != node->children.end(); ++it) 
            perform_traversal (*it);
         --blocknr;
         break;

      case TOK_KW_WHILE: 
         ++blocknr;
         for (auto it = node->children.begin();
                   it != node->children.end(); ++it)
            perform_traversal (*it);
         --blocknr;
         break;

      case TOK_KW_RETURN:
         break;

      case TOK_KW_FALSE:
         node->attributes[ATTR_bool] = true;
         node->attributes[ATTR_const] = true;
         break;

      case TOK_KW_TRUE:
         node->attributes[ATTR_bool] = true;
         node->attributes[ATTR_const] = true;
         break;

      case TOK_KW_ORD:
         break;

      case TOK_KW_CHR:
         break;

      case TOK_KW_NEW:
         break;

      case BOOL_EQ:
         node->attributes[ATTR_bool] = true;
         break;

      case BOOL_LESS_EQ:
         node->attributes[ATTR_bool] = true;
         break;

      case BOOL_GRT_EQ:
         node->attributes[ATTR_bool] = true;
         break;

      case BOOL_NOT_EQ:
         node->attributes[ATTR_bool] = true;
         break;

      case TOK_RETURNVOID:
         break;

      case TOK_PROTOTYPE:
         break;

      case TOK_VARDECL:
         break;

      case TOK_CALL:
         break;

      case TOK_NEWARRAY:
         break;

      case TOK_NEWSTRING:
         break;

      case TOK_BLOCK:
         break;

      default: break;
   }
}

void second_traversal (astree* node, FILE* outfile) {

   switch (node->symbol) {

      case ARRAY_DECL: case DECLID: 
         insert_var_fn (node);
         for (size_t i = 0; i < node->blocknr; ++i)
            fprintf(outfile, "   ");
         fprintf(outfile, "%s (%lu.%lu.%lu) {%lu} %s",
               (*(node->lexinfo)).c_str(),
               node->lloc.filenr,
               node->lloc.linenr,
               node->lloc.offset,
               node->blocknr,
               get_attributes (node->attributes));
         if (node->struct_name)
            fprintf(outfile, "\"%s\"", node->struct_name);
         fprintf(outfile, "\n");
         break;

      case TOK_KW_STRUCT:
         fprintf(outfile, "%s (%lu.%lu.%lu) {%lu} %s \"%s\"\n",
                 (node->children.at(0)->lexinfo)->c_str(),
                 node->lloc.filenr,
                 node->lloc.linenr,
                 node->lloc.offset,
                 node->blocknr,
                 get_attributes (node->attributes),
                 (node->children.at(0)->lexinfo)->c_str());
         emplace_new_type (node);
         break;

      case TOK_IDENT:
         if (symbol_stack.back() == nullptr) {
            return;
         }
         symbol_table* this_table = symbol_stack.back();
         auto it_symbol = this_table->find (node->lexinfo);
         if (it_symbol == this_table->end()) {
            return;
         }
         symbol* this_symbol = (*it_symbol).second;
         node->attributes = this_symbol->attributes;
         break;
   }
}

void add_type (astree* node) {
   symbol* this_symbol = node_symbol (node);
   type_table.emplace (node->lexinfo, this_symbol);
}

void add_field (astree* node, symbol_table* field_table) {
   symbol* this_symbol = node_symbol (node);
   field_table->emplace (node->lexinfo, this_symbol);
}

void add_fields (astree* node, symbol_table* field_table) {
   for (auto it = node->children.begin(); it != node->children.end(); 
           ++it) 
      add_fields (*it, field_table);
   if (node->symbol == TYPEID) add_type (node);
   if (node->symbol == FIELD) add_field (node, field_table);
}

void emplace_new_type (astree* node) {
   symbol_table* field_table = new symbol_table();
   add_fields (node, field_table);
}

void perform_traversal (astree* node) {
   vector<astree*> children = node->children;
   for (auto i = children.begin(); i != children.end(); ++i) 
      perform_traversal (*i);
   traversal (node);
}

void perform_scnd_trav (astree* node, FILE* outfile) {
   second_traversal (node, outfile);
   vector<astree*> children = node->children;
   for (auto i = children.begin(); i != children.end(); ++i)
      perform_scnd_trav (*i, outfile);
}

void maintain_symbol_tables (astree* node, FILE* outfile) {
   symbol_stack.push_back(nullptr);
   perform_traversal (node);
   perform_scnd_trav (node, outfile);
}

