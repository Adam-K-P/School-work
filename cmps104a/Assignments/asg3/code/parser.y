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

program : function              { printf ("func decl\n"); $$ = $1; }
        | stmtseq               { $$ = $1 = nullptr; }
        ;

function: identdec '(' identseq ')' block { printf ("full fcn\n");  $$ = $1;}
        | identdec '(' ')' block          { printf ("empty fcn\n"); $$ = $1;}
        ;

identseq: identseq ',' identseq  { printf ("reaching identseq\n"); $$ = $1; }
        | identdec               { printf ("identseq test\n"); $$ = $1; }
        ;

block   : '{' stmtseq '}'       { destroy ($1, $3); $$ = $2; }
        | ';'                   { $$ = $1; }
        ;

stmtseq : stmtseq expr ';'      { destroy ($3); $$ = $1->adopt ($2); }
        | stmtseq error ';'     { destroy ($3); $$ = $1; }
        | stmtseq ';'           { destroy ($2); $$ = $1; }
        | stmtseq DIRECTIVE     { printf ("reached DIRECTIVE\n"); $$ = $1; }
        | stmtseq vardecl       { printf ("reached vardecl\n"); 
                                 $$ = $1->adopt ($2); }
        | stmtseq function      { printf ("function found\n"); $$ = $1; }
        |                       { printf ("ugh\n"); $$ = parser::root; }
        ;

vardecl : identdec '=' expr ';' { printf ("reached vardecl\n"); $$ = $1; }
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
        | call                  { printf ("making fcn call\n"); $$ = $1; }
        | identdec              { printf ("reached identdec\n"); $$ = $1; }
        | TOK_IDENT             { printf ("reached TOK_IDENT\n");  $$ = $1; }
        | NUMBER                { printf ("reached NUMBER\n");     $$ = $1; }
        | STRING_LIT            { printf ("reached STRING_LIT\n"); $$ = $1; }
        | CHAR_LIT              { printf ("reached CHAR_LIT\n");   $$ = $1; }
        ;

exprseq : exprseq ',' exprseq
        | expr
        ;

call    : TOK_IDENT '(' ')'         { printf ("calling empty fcn\n"); }
        | TOK_IDENT '(' exprseq ')' { printf ("calling fcn\n"); }
        ;

basetype: TOK_KW_VOID      { printf ("reached TOK_VOID\n"); $$ = $1; }
        | TOK_KW_BOOL      { printf ("reached TOK_BOOL\n"); $$ = $1; }
        | TOK_KW_CHAR      { printf ("reached TOK_CHAR\n"); $$ = $1; }
        | TOK_KW_INT       { printf ("reached TOK_INT\n");  $$ = $1; }
        | TOK_KW_STRING    { printf ("reached TOK_STRING\n"); $$ = $1; }
        | TOK_KW_STRUCT    { printf ("reached TOK_STRUCT\n"); $$ = $1; }
        | TOK_KW_IF        { printf ("reached TOK_IF\n");     $$ = $1; }
        | TOK_KW_ELSE      { printf ("reached TOK_ELSE\n");   $$ = $1; }
        | TOK_KW_WHILE     { printf ("reached TOK_WHILE\n");  $$ = $1; }
        | TOK_KW_RETURN    { printf ("reached TOK_RETURN\n"); $$ = $1; }
        | TOK_KW_FALSE     { printf ("reached TOK_FALSE\n");  $$ = $1; }
        | TOK_KW_TRUE      { printf ("reached TOK_TRUE\n");   $$ = $1; }
        | TOK_KW_NULL      { printf ("reached TOK_NULL\n");   $$ = $1; }
        | TOK_KW_ORD       { printf ("reached TOK_ORD\n");    $$ = $1; }
        | TOK_KW_CHR       { printf ("reached TOK_CHR\n");    $$ = $1; }
        | TOK_KW_NEW       { printf ("reached TOK_NEW\n");    $$ = $1; }
        ;

identdec: basetype '[' ']' TOK_IDENT   { printf ("reached array dec\n");
                                         $$ = $1; }
        | basetype TOK_IDENT           { printf ("reached identdec\n"); 
                                         $$ = $1; }
        ;

%%

const char* parser::get_tname (int symbol) {
   return yytname [YYTRANSLATE (symbol)];
}

