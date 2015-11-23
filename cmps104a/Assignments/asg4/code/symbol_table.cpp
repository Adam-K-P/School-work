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

const char* get_attributes (astree* node) {
   string out = "";
   attr_bitset attributes = node->attributes;

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
   if (attributes[ATTR_param])    out += "param ";
   if (attributes[ATTR_lval])     out += "lval ";
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
   symbol* this_symbol = new symbol ();
   this_symbol->attributes = node->attributes;
   this_symbol->blocknr = node->blocknr;
   this_symbol->filenr = node->lloc.filenr;
   this_symbol->linenr = node->lloc.linenr;
   this_symbol->offset = node->lloc.offset;
   symbol_table* this_table = symbol_stack.back();
   string* fn_str = new string();
   *fn_str = (*(node->lexinfo));
   this_table->emplace (fn_str, this_symbol);
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
         emplace_new_type (node);
         break;

      case FIELD:
         node->attributes[ATTR_field] = true;
         break;

      case TOK_FUNCTION:
         node->attributes[ATTR_function] = true;

         node->children.at(0)->children.at(0)
             ->attributes[ATTR_function] = true;

         node->children.at(0)->children.at(0)
             ->attributes[ATTR_variable] = false;

         node->children.at(0)->children.at(0)
             ->attributes[ATTR_lval] = false;

         break;

      case TOK_KW_NULL:
         node->attributes[ATTR_null] = true;
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

      case TYPEID: //remove in variable of new
         node->attributes[ATTR_typeid] = true;
         break;

      case DECLID: 
         node->attributes[ATTR_variable] = true;
         node->attributes[ATTR_lval]     = true;
         break;

      case TOK_IDENT: //remove in call
         break;

      case TOK_KW_IF: //needs type-checking
         ++blocknr;
         for (auto it = node->children.begin(); 
                   it != node->children.end(); ++it) 
            perform_traversal (*it);
         --blocknr;
         break;

      case TOK_KW_ELSE:
         --(node->blocknr);
         break;

      case TOK_KW_WHILE: //needs type-checking
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
         ++blocknr;
         for (auto it = node->children.begin(); 
                   it != node->children.end(); ++it)
            perform_traversal (*it);
         --blocknr;
         break;
   }
}

void second_traversal (astree* node) {

   switch (node->symbol) {

      case DECLID:
         insert_var_fn (node);
         break;
   }
}

symbol* node_symbol (astree* node) {
   symbol* this_node = new symbol();
   this_node->attributes = node->attributes;
   this_node->filenr     = node->lloc.filenr;
   this_node->linenr     = node->lloc.linenr;
   this_node->offset     = node->lloc.offset;
   this_node->blocknr    = node->blocknr;
   return this_node;
}

void add_type (astree* node) {
   symbol* this_symbol = node_symbol (node);
   string* this_str = new string();
   *this_str = *(node->lexinfo);
   type_table.emplace (this_str, this_symbol);
}

void add_field (astree* node, symbol_table* field_table) {
   symbol* this_symbol = node_symbol (node);
   string* this_str = new string();
   *this_str = *(node->lexinfo);
   field_table->emplace (this_str, this_symbol);
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

//emplaces a type to type_table
void emplace_type (string* str_type, int attr) {
   symbol* this_symbol = new symbol ();
   attr_bitset attributes;
   attributes[attr] = true;
   this_symbol->attributes = attributes;
   type_table.emplace (str_type, this_symbol);
}

void fill_type_table () {

   string* str_void = new string ();
   *str_void = "void";
   emplace_type (str_void, ATTR_void);
   
   string* str_int = new string ();
   *str_int = "int";
   emplace_type (str_int, ATTR_int);

   string* str_char = new string ();
   *str_char = "char";
   emplace_type (str_char, ATTR_char);

   string* str_string = new string ();
   *str_string = "string";
   emplace_type (str_string, ATTR_string);

   string* str_bool = new string ();
   *str_bool = "bool";
   emplace_type (str_bool, ATTR_bool);

}

void perform_traversal (astree* node) {
   vector<astree*> children = node->children;
   for (auto i = children.begin(); i != children.end(); ++i) 
      perform_traversal (*i);
   traversal (node);
}

void perform_scnd_trav (astree* node) {
   vector<astree*> children = node->children;
   for (auto i = children.begin(); i != children.end(); ++i)
      perform_scnd_trav (*i);
   second_traversal (node);
}

void maintain_symbol_tables (astree* node) {
   symbol_stack.push_back(nullptr);
   fill_type_table();
   perform_traversal (node);
   perform_scnd_trav (node);

   for (auto it = type_table.begin(); it != type_table.end(); ++it) 
      cout << *((*it).first) << endl;
   /*symbol_table* fcn_var_table = symbol_stack.back(); 
   for (auto it = fcn_var_table->begin(); it != fcn_var_table->end(); ++it) {
      cout << *((*it).first) << endl;
   }*/
}
   
