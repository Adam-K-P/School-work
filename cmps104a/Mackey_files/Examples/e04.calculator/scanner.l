
%{
// $Id: scanner.l,v 1.5 2014-10-24 16:37:47-07 - - $

#include <ctype.h>
#include <stdlib.h>

#include "extern.h"

%}

%option 8bit
%option debug
%option ecs
%option nodefault
%option noinput
%option nounput
%option noyywrap
%option warn

DIGIT     [0-9]
FRACTION  ({DIGIT}+\.?{DIGIT}*|\.{DIGIT}+)
EXPONENT  ([Ee][+-]?{DIGIT}+)
NUMBER    {FRACTION}({EXPONENT})?
ERRORNUM  {FRACTION}[Ee][+-]?
LETTER    [a-zA-Z_]
IDENT     {LETTER}({LETTER}|{DIGIT})*

%% 

{IDENT}     { ECHO; yylval.sym = yytext; return IDENT; }
{NUMBER}    { ECHO; yylval.val = atof (yytext); return NUMBER; }
"("         { ECHO; return '('; }
")"         { ECHO; return ')'; }
"+"         { ECHO; return '+'; }
"-"         { ECHO; return '-'; }
"/"         { ECHO; return '/'; }
"*"         { ECHO; return '*'; }
"="         { ECHO; return '='; }
\n          { ECHO; return '\n'; }
[\t ]+      { ECHO; }
"#".*       { ECHO; }
{ERRORNUM}  { ECHO; error ("invalid numeric value", yytext); }
.           { ECHO; error ("invalid input character", yytext); }

%%

