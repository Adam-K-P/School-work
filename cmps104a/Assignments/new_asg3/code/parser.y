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
        BOOL_GRT_EQ BOOL_NOT_EQ FIELD        TYPEID        DECLID
        TOK_FUNCTION TOK_RETURNVOID TOK_PROTOTYPE TOK_VARDECL
        TOK_ARRAY TOK_CALL TOK_NEWARRAY TOK_NEWSTRING TOK_BLOCK 
        TOK_PARAM
        

%right TOK_KW_IF TOK_KW_ELSE
%right  '='
%left BOOL_EQ BOOL_LESS_EQ BOOL_GRT_EQ BOOL_NOT_EQ
%left   '+' '-'
%left   '*' '/'
%right  '^'
%right  POS NEG
%left   '<' '>' 
%right '!' TOK_KW_NEW TOK_KW_ORD TOK_KW_CHR
%left '[' '.'
%nonassoc '('

%start  start

%%

start   : program               { $$ = parser::root = $1; 
                                  astree::print (astfile, parser::root); 
                                }
        ;

program : program structd       { $$ = $$->adopt ($2); (void) $1; }
        | program statmnt       { $$ = $$->adopt ($2); (void) $1; }
        | program fnction       { $$ = $$->adopt ($2); (void) $1; }
        | program DIRECTIVE     { destroy ($2); (void) $1; $$ = $$; }
        | program error '}'     { destroy ($3); (void) $1; (void) $2; 
                                  $$ = $$; 
                                }
        | program error ';'     { destroy ($3); (void) $1; (void) $2; 
                                  $$ = $$; 
                                }
        |                       { $$ = parser::root; }
        ;

structd : TOK_KW_STRUCT TOK_IDENT '{' fieldsq '}'
                                { destroy ($3, $5);
                                  $2->change_sym (TYPEID);
                                  $$ = $1->adopt ($2, $4); 
                                }
        | TOK_KW_STRUCT TOK_IDENT '{' '}'
                                { destroy ($3, $4);
                                  $2->change_sym (TYPEID); 
                                  $$ = $1->adopt ($2); 
                                }
        ;

fieldsq : fieldsq fieldec       { $$ = $$->adopt ($2); (void) $1; }
        | fieldec               { $$ = $1; }
        ;

fieldec : basetype TOK_IDENT ';'
                                { $$ = $1->adopt_sym ($2, FIELD); 
                                 destroy ($3);
                                }
        | basetype '[' ']' TOK_IDENT ';'
                                { $$ = $1->adopt_sym ($4, FIELD); 
                                  destroy ($2, $3); 
                                  destroy ($5);
                                }
        ;

fnction : identdc '(' identsq ')' block     
                                { destroy ($4);
                                  $$ = new astree (TOK_FUNCTION, lexer::lloc,
                                                   "");
                                  $2->change_sym (TOK_PARAM);
                                  $2->adopt ($3);
                                  $$->adopt ($1, $2);
                                  $$->adopt ($5);
                                }
        | identdc '(' ')' block { destroy ($2, $3); 
                                  $$ = new astree (TOK_FUNCTION, lexer::lloc, 
                                                   "");
                                  $$->adopt ($1, $4);
                                }
        ;

block   : '{' stmtseq '}'       { destroy ($1, $3); 
                                  $$ = $2;
                                }
        | '{' '}'               { destroy ($2); 
                                  $1->change_sym (TOK_BLOCK);
                                  $$ = $1;
                                }
        | ';'                   { destroy ($1); $$ = nullptr; } 
        ;

stmtseq : stmtseq statmnt       { $$ = $$->adopt ($2); (void) $1; }
        | statmnt               { $$ = new astree (TOK_BLOCK, 
                                                   lexer::lloc, "{"); 
                                  $$->adopt ($1);
                                }
        ;

statmnt : expr ';'              { destroy ($2); $$ = $1; }
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
        | TOK_KW_IF '(' expr ')' statmnt %prec TOK_KW_IF
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

return  : TOK_KW_RETURN ';'     { destroy ($2); 
                                  $$->adopt_sym ($1, TOK_RETURNVOID); 
                                }
        | TOK_KW_RETURN expr ';' 
                                { destroy ($3); $$ = $1->adopt ($2); }
        ;
                               

alloc   : TOK_KW_NEW TOK_IDENT '(' ')'
                                { destroy ($3, $4);
                                  $$ = $1->adopt_sym ($2, TYPEID); 
                                }
        | TOK_KW_NEW TOK_KW_STRING '(' expr ')'
                                { destroy ($3, $5);
                                  $2->change_sym (TOK_NEWSTRING);
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

call    : TOK_IDENT '(' ')'     { destroy ($3);
                                  $$ = $2->change_sym (TOK_CALL); 
                                  $$->adopt ($1);
                                }
        | TOK_IDENT '(' exprseq ')'
                                { destroy ($4);
                                  $$ = $2->change_sym (TOK_CALL);
                                  $$->adopt ($1, $3);
                                }
        ;

variabl : TOK_IDENT             { $$ = $1; }
        | expr '[' expr ']'     { destroy ($2, $4);
                                  $$ = $1->adopt_sym ($3, TOK_ARRAY); 
                                }
        | expr '.' TOK_IDENT    { destroy ($2);
                                  $$ = $1->adopt_sym ($3, FIELD); 
                                }
        ;

exprseq : exprhlp               { $$ = $1; }
        | expr exprhlp          { $$ = $$->adopt ($2); (void) $1; }
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
                                  $2->change_sym (TOK_VARDECL);
                                  $$ = $2->adopt ($1, $3); 
                                }
        ;

identdc : basetype '[' ']' TOK_IDENT   
                                { destroy ($2, $3);
                                  $4->change_sym (DECLID);
                                  $$ = $1->adopt ($4);
                                }
        | basetype TOK_IDENT    { $2->change_sym (DECLID);
                                  $$ = $1->adopt ($2);
                                }
        ;

basetype: TOK_KW_VOID           { $$ = $1; }
        | TOK_KW_BOOL           { $$ = $1; }
        | TOK_KW_CHAR           { $$ = $1; }
        | TOK_KW_INT            { $$ = $1; }
        | TOK_KW_STRING         { $$ = $1; }
        | TOK_IDENT             { $$ = $1->change_sym (TYPEID); }
        ;

%%

const char* parser::get_tname (int symbol) {
   return yytname [YYTRANSLATE (symbol)];
}
