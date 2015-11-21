//Adam Pinarbasi
//akpinarb

#include <bitset>
#include <iostream>
#include <string>
#include <unordered_map>

#include "astree.h"
#include "utils.h"
#include "symbol_table.h"
#include "stringset.h"

using namespace std;

vector<symbol_table*> symbol_stack;
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

void add_attributes (astree *node) {
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
         if (node->children.size() > 0) {
            node->children.at(0)->attributes[ATTR_struct] = true;
            node->children.at(0)->attributes[ATTR_typeid] = true;
         }
         break;

      case FIELD:
         node->attributes[ATTR_field] = true;
         break;

      case TOK_FUNCTION:
         node->attributes[ATTR_function] = true;
         break;

      case TOK_KW_NULL:
         node->attributes[ATTR_null] = true;
         break;

      case TOK_ARRAY:
         node->attributes[ATTR_array] = true;
         break;

      case TOK_PARAM:
         node->attributes[ATTR_param] = true;
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
   }
}

void set_attributes (astree* node) {
   vector<astree*> children = node->children;
   for (auto i = children.begin(); i != children.end(); ++i) 
      set_attributes (*i);
   add_attributes (node);
}
   
