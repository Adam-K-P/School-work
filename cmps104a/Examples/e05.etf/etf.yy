%{
// $Id: etf.yy,v 1.5 2014-11-06 19:04:28-08 - - $

#include <assert.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define YYDEBUG 1
#define YYERROR_VERBOSE 1
#define YYPRINT(FILE,TYPE,TREE) yyprint (FILE, TYPE, TREE)
#define YYSTYPE tree*

struct tree {
   int nodenr;
   int Vt;
   char lexeme;
   tree* left;
   tree* right;
};

void yyprint (FILE* file, int type, tree* tree);
tree* trace (tree* tree);
tree* adopt2 (tree* root, tree* left, tree* right);
int yylex (void);
void yyerror (const char* message);

tree* root = nullptr;

%}

%token-table
%verbose

%token IDENT ADD MUL LPAR RPAR
%start start

%%

start  : expr                {root = $$ = trace ($1); }
       ;

expr   : expr ADD term       {$$ = trace (adopt2 ($2, $1, $3)); }
       | term                {$$ = trace ($1); }
       ;

term   : term MUL factor     {$$ = trace (adopt2 ($2, $1, $3)); }
       | factor              {$$ = trace ($1); }
       ;

factor : LPAR expr RPAR      {$$ = trace ($2); }
       | IDENT               {$$ = trace ($1); }
       ;

%%


tree* adopt2 (tree* root, tree* left, tree* right) {
   root->left = left;
   root->right = right;
   return root;
}

int setyylval (int Vt, char lexeme) {
   static int static_nodenr = 0;
   yylval = new tree();
   yylval->nodenr = ++static_nodenr;
   yylval->lexeme = lexeme;
   yylval->left = yylval->right = nullptr;
   yylval->Vt = Vt;
   return Vt;
}

void print_char (FILE* file, char ch) {
   fprintf (file, isgraph (ch) ? "'%c'" : "'\\x%02X'", ch);
}

char *input_string = nullptr;
char *nextchar = nullptr;
int yylex (void) {
   for (;;) {
      int ch = *nextchar++;
      if (ch == '\0') return setyylval (0, ch);
      if (isspace (ch)) continue;
      if (isalpha (ch)) return setyylval (IDENT, ch);
      switch (ch) {
         case '+': return setyylval (ADD, ch);
         case '*': return setyylval (MUL, ch);
         case '(': return setyylval (LPAR, ch);
         case ')': return setyylval (RPAR, ch);
      }
      fprintf (stderr, "Bad character ");
      print_char (stderr, ch);
      fprintf (stderr, "\n");
   }
}


void yyprint_child_nr (FILE* file, tree* node) {
   if (node == nullptr) fprintf (file, " nil");
                   else fprintf (file, " node%d", node->nodenr);
}
void yyprint (FILE* file, int type, tree* tree){
   fprintf (file, "node%d: %s ",
            tree->nodenr, yytname[YYTRANSLATE(type)]);
   print_char (file, tree->lexeme);
   yyprint_child_nr (file, tree->left);
   yyprint_child_nr (file, tree->right);
}

void preorder (tree* tree, int depth) {
   if (tree == nullptr) return;
   fprintf (stderr, "AST: %*s", depth * 3, "");
   yyprint (stderr, tree->Vt, tree);
   fprintf (stderr, "\n");
   preorder (tree->left, depth + 1);
   preorder (tree->right, depth + 1);
}

tree* trace (tree* tree) {
   preorder (tree, 0);
   return tree;
}

void yyerror (const char* message) {
   fprintf (stderr, "%s)\n", message);
}

int main (int argc, char** argv) {
   assert (argc == 2);
   nextchar = input_string = argv[1];
   fprintf (stderr, "Scanning input: \"%s\"\n", input_string);
   yydebug = 1;
   int status = yyparse ();
   fprintf (stderr, "Finished parse: status %d\n", status);
   fprintf (stderr, "Scanned input: \"%s\"\n", input_string);
   fprintf (stderr, "Root of AST:\n");
   trace (root);
   return 0;
}

