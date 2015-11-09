// $Id: parser.y,v 1.12 2015-07-09 14:52:13-07 - - $

%{

#include <assert.h>
#include <stdlib.h>
#include <string.h>

#include "astree.h"
#include "utils.h"
#include "yylex.h"

%}

%debug
%defines
%error-verbose
%token-table
%verbose

%destructor { destroy ($$); } <>
%printer { astree::dump (yyoutput, $$); } <>

%initial-action {
   parser::root = new astree (ROOT, {0, 0, 0}, "<<ROOT>>");
}

%token  ROOT TOK_IDENT NUMBER DIRECTIVE RESERVED TOK_KW_VOID
        TOK_KW_BOOL TOK_KW_CHAR TOK_KW_INT   TOK_KW_STRING TOK_KW_STRUCT
        TOK_KW_IF   TOK_KW_ELSE TOK_KW_WHILE TOK_KW_RETURN TOK_KW_FALSE
        TOK_KW_TRUE TOK_KW_NULL TOK_KW_ORD   TOK_KW_CHR    TOK_KW_NEW
        STRING_LIT  CHAR_LIT '}' '{' '[' ']' BOOL_EQ       BOOL_LESS_EQ
        BOOL_GRT_EQ BOOL_NOT_EQ FIELD TYPEID

%right  '='
%left   '+' '-'
%left   '*' '/'
%right  '^'
%right  POS NEG
%left   '<' '>' 
%left BOOL_EQ BOOL_LESS_EQ BOOL_GRT_EQ BOOL_NOT_EQ
%right '!' TOK_KW_NEW TOK_KW_ORD TOK_KW_CHR
%left '[' '.'

%start  start

%%

start   : program               { $$ = parser::root = $1; 
                                  astree::print (stdout, parser::root); 
                                }
        ;

program : program structd       { $$ = $$->adopt ($2); }
        | program statmnt       { $$ = $$->adopt ($2); }
        | program fnction       { $$ = $$->adopt ($2); 
                                  astree::print (stdout, parser::root); }
        | program DIRECTIVE     { destroy ($2); }
        |                       { $$ = parser::root; }
        ;

structd : TOK_KW_STRUCT TOK_IDENT '{' fieldsq '}'
                                { destroy ($3, $5);
                                  $$ = $1->adopt ($2, $4); 
                                }
        | TOK_KW_STRUCT TOK_IDENT '{' '}'
                                { destroy ($3, $4);
                                  $$ = $1->adopt ($2); 
                                }
        ;

fieldsq : fieldsq fieldec       { $$ = $$->adopt ($2); }
        | fieldec               { $$ = $1; }
        ;

fieldec : basetype TOK_IDENT ';'
                                { $$ = $1->adopt ($2); }
        | basetype '[' ']' TOK_IDENT ';'
                                { destroy ($2, $3); 
                                  $$ = $1->adopt ($4); 
                                }
        ;

fnction : identdc '(' identsq ')' block     
                                { destroy ($2, $4); 
                                  $$ = $1->adopt ($3, $5); 
                                }
        | identdc '(' ')' block { destroy ($2, $3); 
                                  $$ = $1->adopt ($4); 
                                }
        ;

block   : '{' stmtseq '}'       { destroy ($1, $3); $$ = $2;  }
        | '{' '}'               { destroy ($1, $2); $$ = nullptr; }
        | ';'                   { destroy ($1); $$ = nullptr; } 
        ;

stmtseq : stmtseq statmnt       { $$ = $$->adopt ($2); }
        | statmnt               { $$ = $1;             }
        ;

statmnt : expr ';'              { destroy ($2); $$ = $1; }
        | error ';'             { destroy ($2); $$ = $1; 
                                  parser::syntax_error ("statmnt");
                                }
        | vardecl               { $$ = $1; }
        | ifelse                { $$ = $1; }
        | while                 { $$ = $1; }
        | return                { $$ = $1; }
        | block                 { $$ = $1; }
        ;

while   : TOK_KW_WHILE '(' expr ')' statmnt
                                { destroy ($2, $4); 
                                  $$ = $1->adopt ($3, $5); 
                                }
        ;

ifelse  : TOK_KW_IF '(' expr ')' statmnt TOK_KW_ELSE statmnt
                                { destroy ($2, $4); 
                                  $1->adopt ($3, $5);
                                  $6->adopt ($7);
                                  $1->adopt ($6);
                                  $$ = $1;
                                }
        | TOK_KW_IF '(' expr ')' statmnt
                                { destroy ($2, $4);
                                  $$ = $1->adopt ($3, $5); 
                                }
        ;

expr    : expr BOOL_EQ expr     { $$ = $2->adopt ($1, $3); }
        | expr BOOL_LESS_EQ expr
                                { $$ = $2->adopt ($1, $3); }
        | expr BOOL_GRT_EQ expr { $$ = $2->adopt ($1, $3); }
        | expr BOOL_NOT_EQ expr { $$ = $2->adopt ($1, $3); }
        | TOK_KW_CHR expr       { $$ = $1->adopt ($2);     }
        | TOK_KW_ORD expr       { $$ = $1->adopt ($2);     }
        | '!' expr              { $$ = $1->adopt ($2);     }
        | expr '=' expr         { $$ = $2->adopt ($1, $3); }
        | expr '+' expr         { $$ = $2->adopt ($1, $3); }
        | expr '-' expr         { $$ = $2->adopt ($1, $3); }
        | expr '*' expr         { $$ = $2->adopt ($1, $3); }
        | expr '/' expr         { $$ = $2->adopt ($1, $3); }
        | expr '^' expr         { $$ = $2->adopt ($1, $3); }
        | expr '<' expr         { $$ = $2->adopt ($1, $3); }
        | expr '>' expr         { $$ = $2->adopt ($1, $3); }
        | '+' expr %prec POS    { $$ = $1->adopt_sym ($2, POS); }
        | '-' expr %prec NEG    { $$ = $1->adopt_sym ($2, NEG); }
        | '(' expr ')'          { destroy ($1, $3); $$ = $2; }
        | '{' expr '}'          { destroy ($1, $3); $$ = $2; }
        | call                  { $$ = $1; }
        | const                 { $$ = $1; }
        | variabl               { $$ = $1; }
        | alloc                 { $$ = $1; }
        ;

return  : TOK_KW_RETURN ';'     { destroy ($2); $$ = $1; }
        | TOK_KW_RETURN expr ';' 
                                { destroy ($3); $$ = $1->adopt ($2); }
        ;
                               

alloc   : TOK_KW_NEW TOK_IDENT '(' ')'
                                { destroy ($3, $4);
                                  $$ = $1->adopt ($2); 
                                }
        | TOK_KW_NEW TOK_KW_STRING '(' expr ')'
                                { destroy ($3, $5);
                                  $$ = $1->adopt ($2, $4); 
                                }
        | TOK_KW_NEW basetype '[' expr ']'
                                { destroy ($3, $5);
                                  $$ = $1->adopt ($2, $4);
                                }
        ;

const   : NUMBER                { $$ = $1; }
        | CHAR_LIT              { $$ = $1; }
        | STRING_LIT            { $$ = $1; }
        | TOK_KW_FALSE          { $$ = $1; }
        | TOK_KW_TRUE           { $$ = $1; }
        | TOK_KW_NULL           { $$ = $1; }
        ;

call    : TOK_IDENT '(' ')'     { destroy ($2, $3);
                                  $$ = $1; }
        | TOK_IDENT '(' exprseq ')'
                                { destroy ($2, $4);
                                  $$ = $1->adopt ($3);
                                }
        ;

variabl : TOK_IDENT             { $$ = $1; }
        | expr '[' expr ']'     { $$ = $1->adopt ($3); }
        | expr '.' TOK_IDENT    { $$ = $1->adopt ($3); }
        ;

exprseq : exprhlp               { $$ = $1; }
        | expr exprhlp          { $$ = $$->adopt ($2); }
        | expr                  { $$ = $1; }
        ;

exprhlp : ',' exprseq           { destroy ($1); $$ = $2; }
        ;

identsq : isqhelp               { $$ = $1; }
        | identdc isqhelp       { $$ = $1->adopt ($2); }
        | identdc               { $$ = $1; }
        ;

isqhelp : ',' identsq           { destroy ($1); $$ = $2; }
        ;

vardecl : identdc '=' expr ';'  { destroy ($4); 
                                  $$ = $2->adopt ($1, $3); 
                                }
        ;

identdc : basetype '[' ']' TOK_IDENT   
                                { $$ = $1; }
        | basetype TOK_IDENT    { $$ = $1; }
        ;

basetype: TOK_KW_VOID           { $$ = $1; }
        | TOK_KW_BOOL           { $$ = $1; }
        | TOK_KW_CHAR           { $$ = $1; }
        | TOK_KW_INT            { $$ = $1; }
        | TOK_KW_STRING         { $$ = $1; }
        ;

%%

const char* parser::get_tname (int symbol) {
   return yytname [YYTRANSLATE (symbol)];
}

void parser::syntax_error (const char* symbol) {
   fprintf (stderr, "syntax error at %s\n", symbol);
   exit (EXIT_FAILURE);
}
