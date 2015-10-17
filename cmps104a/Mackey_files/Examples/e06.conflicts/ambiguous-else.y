// $Id: ambiguous-else.y,v 1.1 2011-10-28 18:07:07-07 - - $

// Example of solving the problem of the dangling else with an
// ambiguous grammar and precedence declarations.

%verbose

%token IF WHILE
%right ELSE
%start program

%%

program    : program statement
           |
           ;

statement  : ifhead statement ELSE statement
           | ifhead statement %prec ELSE
           | whilehead statement
           | otherstmt
           ;

ifhead     : IF '(' expr ')'
           ;

whilehead  : WHILE '(' expr ')'
           ;

otherstmt  : expr ';'
           ;

expr       : 'x'
           ;

%%

