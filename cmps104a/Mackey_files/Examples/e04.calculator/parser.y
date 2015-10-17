%{
// $Id: parser.y,v 1.3 2014-10-24 16:32:04-07 - - $

#include "extern.h"

#define YYDEBUG 1
#define YYERROR_VERBOSE 1

%}

%debug
%defines
%token-table
%verbose

%token  IDENT NUMBER
%right  '='
%left   '+' '-'
%left   '*' '/'
%right  UNARY

%start  stmts

%%

stmts : stmts stmt           { }
      |                      { }
      ;

stmt  : expr '\n'            { printf ("****EXPR==%.10g\n", $1.val); }
      | error '\n'           { printf ("****ERROR #%d\n", yynerrs); }
      | '\n'                 { printf ("\n"); }
      ;

expr  : IDENT '=' expr       { $$.val = sym_put ($1.sym, $3.val); }
      | expr '+' expr        { $$.val = $1.val + $3.val; }
      | expr '-' expr        { $$.val = $1.val - $3.val; }
      | expr '*' expr        { $$.val = $1.val * $3.val; }
      | expr '/' expr        { $$.val = $1.val / $3.val; }
      | '+' expr %prec UNARY { $$.val = + $2.val; }
      | '-' expr %prec UNARY { $$.val = - $2.val; }
      | '(' expr ')'         { $$.val = $2.val; }
      | NUMBER               { $$.val = $1.val; }
      | IDENT                { $$.val = sym_get ($1.sym); }
      ; 

%%

