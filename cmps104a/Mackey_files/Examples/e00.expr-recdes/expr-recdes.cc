// $Id: expr-recdes.cc,v 1.29 2014-10-09 18:04:35-07 - - $

//
// A trivial hand-coded top-down recursive descent compiler for
// a simple language.  No leak checking.  Just crash on any
// syntax error.
//
// Context-free syntax.
// ->, {, }, |, ... are metasymbols
//
// program -> { expr ; }...
// expr    -> term { { + | - } term }...
// term    -> factor { { * | / } factor }...
// factor  -> ( expr ) | IDENT | NUMBER
//
// Lexical syntax.
// Using flex notation.
//
// IDENT   -> [A-Za-z][A-Za-z0-9]*
// NUMBER  -> [0-9]+
// COMMENT -> #.*
// WHITE   -> [ \n]+
//

#include <string>
#include <unordered_map>
#include <vector>
using namespace std;

#include <assert.h>
#include <ctype.h>
#include <libgen.h>
#include <stdarg.h>
#include <stdio.h> 
#include <stdlib.h>
#include <string.h>

enum { ENDFILE = 256, IDENT = 257, NUMBER = 258, ROOT = 259,
       NOSYMBOL = 260, };

unordered_map<unsigned,string> symbol_names {
   {ENDFILE,  "ENDFILE"},
   {IDENT,    "IDENT"},
   {NUMBER,   "NUMBER"},
   {ROOT,     "ROOT"},
   {NOSYMBOL, "NOSYMBOL"},
};


void print_symbol (unsigned symbol) {
   printf ("%d", symbol);
   const auto& isymbol = symbol_names.find (symbol);
   if (isymbol != symbol_names.cend()) {
      printf ("(%s)", isymbol->second.c_str());
   }else if (isgraph (symbol)) {
      printf ("('%c')", symbol);
   }
}

struct astree {
   unsigned symbol;
   string lexeme;
   vector<astree*> children;
   void adopt (astree* child) { children.push_back (child); }
};

astree* new_astree (int symbol, const string& lexeme) {
   astree* tree = new astree();
   tree->symbol = symbol;
   tree->lexeme = lexeme;
   return tree;
}

void preorder_astree (size_t depth, astree* tree) {
   for (size_t count = 0; count < depth; ++count) printf ("|  ");
   printf ("\"%s\" ", tree->lexeme.c_str());
   print_symbol (tree->symbol);
   printf ("\n");
   for (size_t child = 0; child < tree->children.size(); ++child) {
      preorder_astree (depth + 1, tree->children[child]);
   }
}

void print_astree (const char* func, int line, astree* tree) {
   printf ("%s[%d]:\n", func, line);
   preorder_astree (1, tree);
}
#define PRINT_ASTREE(TREE) print_astree (__func__, __LINE__, TREE)


int peekchar = 0;
astree* lookahead_token = NULL;

int isnt_nl (int achar) { return achar != '\n' && achar != EOF; }

string scan_chars (int (*ischar) (int)) {
   string lexeme;
   do {
      assert (peekchar != EOF);
      lexeme += peekchar;
      peekchar = getchar();
   }while (ischar && ischar (peekchar));
   return lexeme;
}

void scan_new_token (int symbol, int (*ischar) (int)) {
   string lexeme = symbol != ENDFILE ? scan_chars (ischar) : "<<EOF>>";
   lookahead_token = new_astree (symbol, lexeme);
   PRINT_ASTREE (lookahead_token);
}

void scan_lookahead_token (void) {
   for (;;) {
      if (isalpha (peekchar)) {
         scan_new_token (IDENT, isalnum);
         return;
      }else if (isdigit (peekchar)) {
         scan_new_token (NUMBER, isdigit);
         return;
      }else {
         switch (peekchar) {
            case ' ':
            case '\n':
               scan_chars (isspace);
               continue;
            case '#':
               scan_chars (isnt_nl);
               continue;
            case '+':
            case '-':
            case '*':
            case '/':
            case '(':
            case ')':
            case ';':
               scan_new_token (peekchar, NULL);
               return;
            case EOF:
               scan_new_token (ENDFILE, NULL);
               return;
         }
      }
      assert (false);
   }
}


astree* parse_expr (void);

astree* parse_factor (void) {
   astree* tree = NULL;
   switch (lookahead_token->symbol) {
      case '(':
         scan_lookahead_token();
         tree = parse_expr();
         assert (lookahead_token->symbol == ')');
         scan_lookahead_token();
         break;
      case IDENT:
      case NUMBER:
         tree = lookahead_token;
         scan_lookahead_token();
         break;
      default:
         assert (lookahead_token->symbol == NOSYMBOL);
   }
   PRINT_ASTREE (tree);
   return tree;
}

astree* parse_term (void) {
   astree* root = parse_factor();
   for (;;) {
      switch (lookahead_token->symbol) {
         case '*':
         case '/': {
            astree* oper = lookahead_token;
            scan_lookahead_token();
            oper->adopt (root);
            oper->adopt (parse_factor());
            root = oper;
            break;
         }
         default:
            PRINT_ASTREE (root);
            return root;
      }
   }
}


astree* parse_expr (void) {
   astree* root = parse_term();
   for (;;) {
      switch (lookahead_token->symbol) {
         case '+':
         case '-': {
            astree* oper = lookahead_token;
            scan_lookahead_token();
            oper->adopt (root);
            oper->adopt (parse_term());
            root = oper;
            break;
         }
         default:
            PRINT_ASTREE (root);
            return root;
      }
   }
}

void parse_program (void) {
   astree* root = new_astree (ROOT, "<<ROOT>>");
   while (lookahead_token->symbol != ENDFILE) {
      astree* tree = parse_expr();
      printf ("\f\n");
      assert (lookahead_token->symbol == ';');
      scan_lookahead_token();
      root->adopt (tree);
   }
   PRINT_ASTREE (root);
}

int main (void) {
   peekchar = getchar();
   scan_lookahead_token();
   parse_program();
   assert (lookahead_token->symbol == ENDFILE);
   return EXIT_SUCCESS;
}

