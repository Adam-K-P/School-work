// $Id: emitter.cpp,v 1.2 2015-07-09 18:25:23-07 - - $

#include <assert.h>
#include <stdio.h>

#include "astree.h"
#include "emitter.h"
#include "syslib.h"
#include "utils.h"

void emit (astree* root);

void emit_insn (const char* opcode, const char* operand, astree* tree) {
   printf ("%-10s%-10s%-20s; %s %zd.%zd\n", "",
            opcode, operand,
            lexer::filename (tree->lloc.filenr)->c_str(),
            tree->lloc.linenr, tree->lloc.offset);
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

void emit (astree* tree) {
   switch (tree->symbol) {
      case ROOT  : postorder_emit_stmts (tree);        break;
      case ';'   : postorder_emit_semi (tree);         break;
      case '='   : emit_assign (tree);                 break;
      case '+'   : postorder_emit_oper (tree, "add");  break;
      case '-'   : postorder_emit_oper (tree, "sub");  break;
      case '*'   : postorder_emit_oper (tree, "mul");  break;
      case '/'   : postorder_emit_oper (tree, "div");  break;
      case '^'   : postorder_emit_oper (tree, "pow");  break;
      case '<'   : postorder_emit_oper (tree, "les");  break;
      case '>'   : postorder_emit_oper (tree, "grt");  break;
      case '!'   : postorder_emit_oper (tree, "exc");  break;
      case ','   : postorder_emit_oper (tree, "com");  break;
      case POS   : postorder_emit_oper (tree, "pos");  break;
      case NEG   : postorder_emit_oper (tree, "neg");  break;
      case NUMBER: emit_push (tree, "pushnum");        break;
      case DIRECTIVE : emit_push (tree, "pushdir");    break;
      case TOK_IDENT : emit_push (tree, "pushvar");    break;
      case STRING_LIT: emit_push (tree, "pushstrlit"); break;
      case CHAR_LIT  : emit_push (tree, "pushchrlit"); break;

      case TOK_KW_VOID   : emit_push (tree, "pushvoid");   break;
      case TOK_KW_BOOL   : emit_push (tree, "pushbool");   break;
      case TOK_KW_CHAR   : emit_push (tree, "pushchar");   break;
      case TOK_KW_INT    : emit_push (tree, "pushint");    break;
      case TOK_KW_STRING : emit_push (tree, "pushstring"); break;
      case TOK_KW_STRUCT : emit_push (tree, "pushstruct"); break;
      case TOK_KW_IF     : emit_push (tree, "pushif");     break;
      case TOK_KW_ELSE   : emit_push (tree, "pushelse");   break;
      case TOK_KW_WHILE  : emit_push (tree, "pushwhile");  break;
      case TOK_KW_RETURN : emit_push (tree, "pushreturn"); break;
      case TOK_KW_FALSE  : emit_push (tree, "pushfalse");  break;
      case TOK_KW_TRUE   : emit_push (tree, "pushtrue");   break;
      case TOK_KW_NULL   : emit_push (tree, "pushnull");   break;
      case TOK_KW_ORD    : emit_push (tree, "pushord");    break;
      case TOK_KW_CHR    : emit_push (tree, "pushchr");    break;
      case TOK_KW_NEW    : emit_push (tree, "pushnew");    break;

      default : assert (false); break;
   }
}

void emit_sm_code (astree* tree) {
   printf ("\n");
   if (tree) emit (tree);
}
