//Adam Pinarbasi
//akpinarb

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
int i_num = 1;
int c_num = 1;
int p_num = 1;
int s_num = 1;
int b_num = 1;

/* register stacks */
vector<int> i_reg_stack;
vector<int> c_reg_stack;
vector<int> p_reg_stack;
vector<int> s_reg_stack;
vector<int> b_reg_stack;

deque<string> string_cons;

/* Necessary forward declarations */
void emit_expr (astree*);
void emit_exprs (astree*);
void emit_assign (astree*);
void emit_stmts (astree*);

void emit_assign (astree* tree) {
   astree* left = tree->children.at(0);
   astree* right = tree->children.at(1);
   if (right->attributes[ATTR_const]) {
      if (not tree->blocknr) {
         fprintf (oilfile, "        __%s = %s;\n",
                     left->children.at(0)->lexinfo->c_str(),
                     right->lexinfo->c_str());
      }
      else {
         fprintf (oilfile, "        _%lu_%s = %s;\n",
                     tree->blocknr,
                     left->children.at(0)->lexinfo->c_str(),
                     right->lexinfo->c_str());
      }
   }
   else {
      emit_exprs (right);
      if (not tree->blocknr) {
         if (left->attributes[ATTR_int]) {
            fprintf (oilfile, "        __%s = i%d;\n",
                     left->lexinfo->c_str(),
                     i_num++);
         }
         if (left->attributes[ATTR_bool] or
             left->attributes[ATTR_char]) {
            fprintf (oilfile, "        __%s = c%d;\n",
                     left->lexinfo->c_str(),
                     c_num++);
         }
         if (left->attributes[ATTR_string]) {
            fprintf (oilfile, "        __%s = p%d;\n",
                     left->lexinfo->c_str(),
                     p_num++);
         }
      }
      else {
         if (left->attributes[ATTR_int]) {
            fprintf (oilfile, "        _%lu_%s = i%d;\n",
                     left->blocknr,
                     left->lexinfo->c_str(),
                     i_num++);
         }
         if (left->attributes[ATTR_bool] or
             left->attributes[ATTR_char]) {
            fprintf (oilfile, "        _%lu_%s = c%d;\n",
                     left->blocknr,
                     left->lexinfo->c_str(),
                     c_num++);
         }
         if (left->attributes[ATTR_string]) {
            fprintf (oilfile, "        _%lu_%s = p%d;\n",
                     left->blocknr,
                     left->lexinfo->c_str(),
                     p_num++);
         }
      }
   }
}

void emit_vardec (astree* tree) {
   astree* left = tree->children.at(0);
   astree* right = tree->children.at(1);
   if (right->attributes[ATTR_const]) {
      if (not tree->blocknr) {
         fprintf (oilfile, "        __%s = %s;\n", 
                        left->children.at(0)->lexinfo->c_str(),
                        right->lexinfo->c_str());
      }
      else {
         fprintf (oilfile, "        %s _%lu_%s = %s;\n",
                        left->lexinfo->c_str(),
                        tree->blocknr,
                        left->children.at(0)->lexinfo->c_str(),
                        right->lexinfo->c_str());
      }
   }
   else {
      emit_exprs (right);
      if (not tree->blocknr) {
         if (left->attributes[ATTR_int]) {
            fprintf (oilfile, "        __%s = i%d;\n",
                        left->children.at(0)->lexinfo->c_str(),
                        i_num++);
         }
         if (left->attributes[ATTR_bool] or
             left->attributes[ATTR_string] or
             left->attributes[ATTR_char]) {
            fprintf (oilfile, "        __%s = c%d;\n",
                        left->children.at(0)->lexinfo->c_str(),
                        c_num++);
         }
      }
      else {
         if (left->attributes[ATTR_int]) {
            fprintf (oilfile, "        %s _%lu_%s = i%d;\n",
                        left->lexinfo->c_str(),
                        left->blocknr,
                        left->children.at(0)->lexinfo->c_str(),
                        i_num++);
         }
         if (left->attributes[ATTR_bool]) {
            fprintf (oilfile, "        char _%lu_%s = b%d;\n",
                        left->blocknr,
                        left->children.at(0)->lexinfo->c_str(),
                        b_num++);
         }
         if (left->attributes[ATTR_char]) {
            fprintf (oilfile, "        char _%lu_%s = c%d;\n",
                        left->blocknr,
                        left->children.at(0)->lexinfo->c_str(),
                        c_num++);
         }
         if (left->attributes[ATTR_string]) {
            fprintf (oilfile, "        char* _%lu_%s = p%d;\n",
                        left->blocknr,
                        left->children.at(0)->lexinfo->c_str(),
                        p_num++);
         }
      }
   }
}

void emit_bin (astree* tree, char const* op, char reg, int r_num) {
   astree* left = tree->children.at(0);
   astree* right = tree->children.at(1);
   if ((left->symbol == TOK_IDENT or
        left->symbol == NUMBER) and 
       (right->symbol == TOK_IDENT or
        right->symbol == NUMBER)) {
      fprintf (oilfile, "        %c%d = %s %s %s;\n",
                  reg,
                  r_num,
                  left->lexinfo->c_str(),
                  op,
                  right->lexinfo->c_str());
   }
}

void emit_expr (astree* tree) {
   switch (tree->symbol) {
   
      case TOK_VARDECL: 
         emit_vardec (tree);
         break;

      case '=': 
         emit_assign (tree);
         break;

      case '+':
         emit_bin (tree, "+", 'i', i_num);
         break;

      case '-':
         emit_bin (tree, "-", 'i', i_num);
         break;

      case '*':
         emit_bin (tree, "*", 'i', i_num);
         break;

      case '/':
         emit_bin (tree, "/", 'i', i_num);
         break;

      case '<':
         emit_bin (tree, "<", 'b', b_num);
         break;

      case '>':
         emit_bin (tree, ">", 'b', b_num);
         break;

      case BOOL_EQ:
         emit_bin (tree, "==", 'b', b_num);
         break;

      case BOOL_LESS_EQ:
         emit_bin (tree, "<=", 'b', b_num);
         break;

      case BOOL_GRT_EQ:
         emit_bin (tree, ">=", 'b', b_num);
         break;

      case BOOL_NOT_EQ:
         emit_bin (tree, "!=", 'b', b_num);
         break;

      case TOK_CALL:
         break;

      case TOK_KW_RETURN:
         fprintf (oilfile, "        return %s;\n", 
                           tree->children.at(0)->lexinfo->c_str());
         break;

      case TOK_RETURNVOID:
         fprintf (oilfile, "        return;\n");
         break;

      default: break;
   }
}

void emit_exprs (astree* tree) {
   for (size_t i = 0; i < tree->children.size(); ++i) {
      if (tree->children.at(i)->symbol == TOK_FUNCTION) continue;
      emit_exprs (tree->children.at(i));
   }
   emit_expr (tree);
}

/* Various statement emission functions */

void emit_while (astree* tree) {
   fprintf (oilfile, "while_%lu_%lu_%lu:;\n", tree->lloc.filenr,
                                              tree->lloc.linenr,
                                              tree->lloc.offset);
   if (tree->children.at(0)->symbol == TOK_IDENT) 
      fprintf (oilfile, "if (!%s) goto break_%lu_%lu_%lu:;\n",
               tree->children.at(0)->lexinfo->c_str(),
               tree->lloc.filenr,
               tree->lloc.linenr,
               tree->lloc.offset);
   else {
      emit_exprs (tree->children.at(0));
      fprintf (oilfile, "if (!b%d) goto break_%lu_%lu_%lu;\n",
               c_num,
               tree->lloc.filenr,
               tree->lloc.linenr,
               tree->lloc.offset);
   }
   emit_stmts (tree->children.at(1));
   fprintf (oilfile, "goto while_%lu_%lu_%lu;\n"
                     "break_%lu_%lu_%lu:;\n",
               tree->lloc.filenr,
               tree->lloc.linenr,
               tree->lloc.offset,
               tree->lloc.filenr,
               tree->lloc.linenr,
               tree->lloc.offset);
}

void emit_if (astree* tree) {
   fprintf (oilfile, "if_%lu_%lu_%lu:;\n", tree->lloc.filenr,
                                           tree->lloc.linenr,
                                           tree->lloc.offset);
   if (tree->children.at(0)->symbol == TOK_IDENT) {
      if (tree->children.size() == 3) {
         fprintf (oilfile, "if (!b%d) goto else_%lu_%lu_%lu;\n",
                  b_num,
                  tree->lloc.filenr,
                  tree->lloc.linenr,
                  tree->lloc.offset);
         emit_exprs (tree->children.at(1));
         fprintf (oilfile, "else_%lu_%lu_%lu;\n",
                  tree->lloc.filenr,
                  tree->lloc.linenr,
                  tree->lloc.offset);
      }
      else {
         fprintf (oilfile, "if (!b%d) goto fi_%lu_%lu_%lu;\n",
                  b_num,
                  tree->lloc.filenr,
                  tree->lloc.linenr,
                  tree->lloc.offset);
         emit_stmts (tree->children.at(2)->children.at(0));
         fprintf (oilfile, "fi_%lu_%lu_%lu;\n",
                  tree->lloc.filenr,
                  tree->lloc.linenr,
                  tree->lloc.offset);
      }
   }
   else emit_exprs (tree->children.at(0));
}

void emit_stmts (astree* tree) {
   switch (tree->symbol) {

      case TOK_BLOCK: 
         for (size_t i = 0; i < tree->children.size(); ++i) 
             emit_stmts (tree->children.at(i));
         break;

      case TOK_KW_WHILE:
         emit_while (tree);
         break;

      case TOK_KW_IF:
         emit_if (tree);
         break;

      default: emit_exprs (tree);

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
   fprintf (oilfile, "}\n");
}

void emit_fcns (astree* tree) {
   for (size_t i = 0; i < tree->children.size(); ++i) 
      if (tree->children.at(i)->symbol == TOK_FUNCTION) 
         emit_func (tree->children.at(i));
   fprintf (oilfile, "void __ocmain (void)\n{\n");
   emit_stmts (tree);
   fprintf (oilfile, "}\n");
}

/* Program emission */
void emit (astree* tree) {
   fprintf (oilfile, "#define __OCLIB_C__\n#include \"oclib.h\"\n");
   emit_structs (tree);
   emit_string_cons (tree);
   emit_globals (tree);
   emit_fcns (tree);
}
