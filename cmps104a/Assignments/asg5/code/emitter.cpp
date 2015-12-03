// $Id: emitter.cpp,v 1.2 2015-07-09 18:25:23-07 - - $

#include <assert.h>
#include <stdio.h>

#include <string>
#include <iostream>

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

void emit (astree* root);

void emit_insn (const char* opcode, const char* operand, astree* tree) {
   //printf ("%s\n", opcode);
   /*printf ("%-10s%-10s%-20s; %s %zd.%zd\n", "",
            opcode, operand,
            lexer::filename (tree->lloc.filenr)->c_str(),
            tree->lloc.linenr, tree->lloc.offset);*/
}

void postorder (astree* tree) {
   assert (tree != NULL);
   for (size_t child = 0; child < tree->children.size(); ++child) {
      emit (tree->children.at(child));
   }
}

void postorder_emit_stmts (astree* tree) {
   postorder (tree);
}

void postorder_emit_oper (astree* tree, const char* opcode) {
   postorder (tree);
   emit_insn (opcode, "", tree);
}

void postorder_emit_semi (astree* tree) {
   postorder (tree);
   emit_insn ("", "", tree);
}

void emit_push (astree* tree, const char* opcode) {
   emit_insn (opcode, tree->lexinfo->c_str(), tree);
}

void emit_assign (astree* tree) {
   assert (tree->children.size() == 2);
   astree* left = tree->children.at(0);
   emit (tree->children.at(1));
   if (left->symbol != TOK_IDENT) {
      errllocprintf (left->lloc, "%s\n",
                    "left operand of '=' not an identifier");
   }else{
      emit_insn ("popvar", left->lexinfo->c_str(), left);
   }
}

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
   postorder_emit_stmts (tree->children.at(2));
}

void emit_fcns (astree* tree) {
   for (size_t i = 0; i < tree->children.size(); ++i) 
      if (tree->children.at(i)->symbol == TOK_FUNCTION) 
         emit_func (tree->children.at(i));
}


void emit (astree* tree) {
   emit_fcns (tree);
   switch (tree->symbol) {
      case ';'   : postorder_emit_semi (tree);         break;
      case '='   : emit_assign (tree);                 break;
      case '+'   : postorder_emit_oper (tree, "add");  break;
      case '-'   : postorder_emit_oper (tree, "sub");  break;
      case '*'   : postorder_emit_oper (tree, "mul");  break;
      case '/'   : postorder_emit_oper (tree, "div");  break;
      case '^'   : postorder_emit_oper (tree, "pow");  break;
      case '<'   : postorder_emit_oper (tree, "les");  break;
      case '>'   : postorder_emit_oper (tree, "grt");  break;
      case POS   : postorder_emit_oper (tree, "pos");  break;
      case NEG   : postorder_emit_oper (tree, "neg");  break;

      //case VARDECL : emit_vardecl (tree); break;

      /*case NUMBER: emit_push (tree, "pushnum");      break;
      case DIRECTIVE : emit_push (tree, "pushdir");    break;
      case TOK_IDENT : emit_push (tree, "pushvar");    break;
      case BOOL_EQ   : emit_push (tree, "pushbeq");    break;
      case BOOL_LESS_EQ : emit_push (tree, "pushleq"); break;
      case BOOL_NOT_EQ  : emit_push (tree, "pushbne"); break;
      case RESERVED  : emit_push (tree, "pushres");    break;*/
      default    : assert (true);                      break;
   }
}

void emit_sm_code (astree* tree) {
   printf ("\n");
   if (tree) emit (tree);
}

