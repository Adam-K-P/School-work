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
        STRING_LIT CHAR_LIT '}' '{' '[' ']'

%right  '='
%left   '+' '-'
%left   '*' '/'
%right  '^'
%right  POS NEG
%left   '<' '>'

%start  program

%%

program : program statmnt       { $$ = $1->adopt ($2); }
        | program fnction       { $$ = $1->adopt ($2); }
        | program DIRECTIVE     { destroy ($2); $$ = $1;   }
        |                       { $$ = parser::root; }
        ;

fnction : identdc '(' identsq ')' block     
                                { destroy ($2, $4); $$ = $1->adopt ($3, $5); }
        | identdc '(' ')' block { destroy ($2, $3); $$ = $1->adopt ($4); }

block   : '{' stmtseq '}'       { destroy ($1, $3); $$ = $2;  }
        | ';'                   { destroy ($1); $$ = nullptr; } 
        ;

stmtseq : stmtseq statmnt       { $$ = $$->adopt ($1, $2); }
        | statmnt               { $$ = $1;                 }
        ;

statmnt : expr ';'              { destroy ($2); $$ = $1; }
        | error ';'             { destroy ($2); $$ = $1; }
        ;

expr    : expr '=' expr         { $$ = $2->adopt ($1, $3); }
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
        | '[' expr ']'          { destroy ($1, $3); $$ = $2; }
        | '{' expr '}'          { destroy ($1, $3); $$ = $2; }
        | TOK_IDENT             { $$ = $1; }
        | NUMBER                { $$ = $1; }
        ;

identsq : isqhelp               { $$ = $1; }
        | identdc isqhelp       { $$ = $1->adopt ($2); }
        | identdc               { $$ = $1; }
        ;

isqhelp : ',' identsq           { destroy ($1); $$ = $2; }

identdc : basetype '[' ']' TOK_IDENT   { printf ("reached array dec\n");
                                         $$ = $1; }
        | basetype TOK_IDENT           { printf ("reached identdec: %s\n", 
                                                  yytext); 
                                         $$ = $1; }
        ;

basetype: TOK_KW_VOID      { printf ("reached TOK_VOID\n");   $$ = $1; }
        | TOK_KW_BOOL      { printf ("reached TOK_BOOL\n");   $$ = $1; }
        | TOK_KW_CHAR      { printf ("reached TOK_CHAR\n");   $$ = $1; }
        | TOK_KW_INT       { printf ("reached TOK_INT\n");    $$ = $1; }
        | TOK_KW_STRING    { printf ("reached TOK_STRING\n"); $$ = $1; }
        ;

%%

const char* parser::get_tname (int symbol) {
   return yytname [YYTRANSLATE (symbol)];
}

