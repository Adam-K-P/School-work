// $Id: emitter.cpp,v 1.2 2015-07-09 18:25:23-07 - - $

#include <assert.h>
#include <stdio.h>

#include <sstream>
#include <string>
#include <iostream>
#include <vector>
#include <deque>

#include "astree.h"
#include "emitter.h"
#include "syslib.h"
#include "utils.h"

using namespace std;

/* register numbers */
int a_num = 1;
int c_num = 1;
int p_num = 1;
int s_num = 1;
int b_num = 1;

deque<string> string_cons;

void emit_assign (astree* tree) {}

void emit_stmts (astree* tree) {
   switch (tree->symbol) {

      case TOK_BLOCK: 
         for (size_t i = 0; i < tree->children.size(); ++i) 
             emit_stmts (tree->children.at(i));
         break;

      case TOK_KW_WHILE:
         fprintf (oilfile, "while_%lu_%lu_%lu:;\n", tree->lloc.filenr,
                                                    tree->lloc.linenr,
                                                    tree->lloc.offset);
         break;

      case TOK_KW_IF:
         fprintf (oilfile, "if_%lu_%lu_%lu:;\n", tree->lloc.filenr,
                                                 tree->lloc.linenr,
                                                 tree->lloc.offset);
         break;

      case TOK_VARDECL:
      case '=':
         emit_assign (tree);
         break;

      /* each of these needs to handle the left side and right side */

      case '!':
         break;

      case '+':
         break;

      case '-':
         break;

      case '*':
         break;

      case '/':
         break;

      case '<':
         break;

      case '>':
         break;

      case TOK_CALL:
         break;

      case TOK_KW_RETURN:
         break;

      case TOK_RETURNVOID:
         break;
      
   }
}

/* Structure emission */
void emit_struct (astree* tree) {
   const string* name = tree->children.at(0)->lexinfo;
   fprintf (oilfile, "struct s_%s {", name->c_str());
   if (tree->children.size() == 1) { 
      fprintf (oilfile, "};\n");
      return;
   }
   for (size_t i = 1; i < tree->children.size(); ++i) 
      fprintf (oilfile, "\n        %s s_%s_%s;", 
                           tree->children.at(i)->lexinfo->c_str(),
                                                    name->c_str(),
           tree->children.at(i)->children.at(0)->lexinfo->c_str());
   fprintf (oilfile, "\n};\n");
}

void emit_structs (astree* tree) {
   for (size_t i = 0; i < tree->children.size(); ++i) 
      if (tree->children.at(i)->symbol == TOK_KW_STRUCT)
         emit_struct (tree->children.at(i));
}

/* String constant emission */
void emit_string_con (astree* tree) {
   fprintf (oilfile, "char* s%d = %s\n", s_num, tree->lexinfo->c_str());
   string deq_str = "s";
   stringstream s_str;
   s_str << s_num;
   deq_str = deq_str + s_str.str();
   string_cons.push_back(deq_str);
}

void emit_string_cons (astree* tree) {
   for (size_t i = 0; i < tree->children.size(); ++i)
      if (tree->children.at(i)->symbol == STRING_LIT)
         emit_string_con (tree->children.at(i));
      else emit_string_cons (tree->children.at(i));
}

/* Global emission */
void emit_global (astree* the_tree, symbol* this_symbol) {
   if (this_symbol->attributes[ATTR_function]) return;
   if (this_symbol->attributes[ATTR_bool] or
       this_symbol->attributes[ATTR_char]) 
      fprintf (oilfile, "char");
   if (this_symbol->attributes[ATTR_int])
      fprintf (oilfile, "int");
   if (this_symbol->attributes[ATTR_string])
      fprintf (oilfile, "char*");
   if (this_symbol->attributes[ATTR_struct])
      fprintf (oilfile, "struct");
   if (this_symbol->attributes[ATTR_array])
      fprintf (oilfile, "[]");
   fprintf (oilfile, " __%s;\n", the_tree->lexinfo->c_str());
}

void emit_globals (astree* tree) {
   symbol_table* globals = get_globals();
   if (globals == nullptr) return;
   for (size_t i = 0; i < tree->children.size(); ++i) {
      if (tree->children.at(i)->symbol == TOK_VARDECL) {
         astree* the_tree = tree->children.at(i)->children.at(0)
                                                ->children.at(0);
         auto it_symbol = globals->find (the_tree->lexinfo);
         if (it_symbol == globals->end()) continue;
         symbol* this_symbol = (*it_symbol).second;
         emit_global (the_tree, this_symbol);
      }
   }
}

/* Function emission */
void emit_params (astree* tree) {
   if (tree == nullptr) return;
   if (tree->children.size() == 0) {
      fprintf (oilfile, ")\n");
      return;
   }
   fprintf (oilfile, "        %s _1_%s", tree->lexinfo->c_str(),
                tree->children.at(0)->lexinfo->c_str());
   if (tree->children.size() == 1) {
      fprintf (oilfile, ")\n");
      return;
   }
   else { 
      fprintf (oilfile, ",\n");
      emit_params (tree->children.at(1));
   }
}

void emit_func (astree* tree) {
   if (tree->children.size() != 3) return;
   const string* type = tree->children.at(0)->lexinfo;
   const string* name = tree->children.at(0)->children.at(0)->lexinfo;
   fprintf (oilfile, "%s __%s (\n", type->c_str(), name->c_str());
   emit_params (tree->children.at(1)->children.at(0));
   fprintf (oilfile, "{\n");
   emit_stmts (tree->children.at(2));
}

void emit_fcns (astree* tree) {
   for (size_t i = 0; i < tree->children.size(); ++i) 
      if (tree->children.at(i)->symbol == TOK_FUNCTION) 
         emit_func (tree->children.at(i));
   fprintf (oilfile, "void __ocmain (void)\n{\n");
   emit_stmts (tree);
}

/* Program emission */
void emit (astree* tree) {
   fprintf (oilfile, "#define __OCLIB_C__\n#include \"oclib.h\"\n");
   emit_structs (tree);
   emit_string_cons (tree);
   emit_globals (tree);
   emit_fcns (tree);
}
