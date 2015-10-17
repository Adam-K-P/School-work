%{
// $Id: parser.y,v 1.15 2013-09-03 20:11:51-07 - - $

// Convert infix notation to RPN.  */

#define YYDEBUG 1
#define YYERROR_VERBOSE 1

#include "extern.h"

%}

%token IDENT
%start program

%%

program : program expr ';'      { printchar ('\n'); }
        | program error ';'     { }
        |                       { }
        ;

expr    : expr '+' term         { printchar ($2); }
        | expr '-' term         { printchar ($2); }
        | term                  { }
        ;

term    : term '*' factor       { printchar ($2); }
        | term '/' factor       { printchar ($2); }
        | factor                { }
        ;

factor  : '(' expr ')'          { }
        | IDENT                 { printchar ($1); }
        ;

%%

