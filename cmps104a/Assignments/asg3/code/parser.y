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
%left   '<' '>'  /* need to change */
%left   '!' ','  /* both of these  */

%start  program

%%

program : stmtseq               { $$ = $1 = nullptr; }
        ;

stmtseq : stmtseq expr ';'      { destroy ($3); $$ = $1->adopt ($2); }
        | stmtseq error ';'     { destroy ($3); $$ = $1; }
        | stmtseq ';'           { destroy ($2); $$ = $1; }
        | stmtseq DIRECTIVE     { printf ("reached DIRECTIVE\n"); $$ = $1; }
        |                       { printf ("ugh\n"); $$ = parser::root; }
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
        | TOK_KW_VOID expr      { printf ("reached TOK_VOID\n"); $$ = $1; }
        | TOK_IDENT             { printf ("reached TOK_IDENT\n"); $$ = $1; }
        | NUMBER                { printf ("reached NUMBER\n"); $$ = $1; }
        ;

%%

const char* parser::get_tname (int symbol) {
   return yytname [YYTRANSLATE (symbol)];
}

