%{
// $Id: scanner.l,v 1.12 2014-10-10 14:40:19-07 - - $

#define YY_USER_ACTION { yylval = *yytext; }

#include "extern.h"
#include "parser.h"

%}

%option 8bit
%option debug
%option nodefault
%option nounput
%option noyywrap
%option verbose
%option warn

%%

[a-zA-Z]        { return IDENT ; }
"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
"("             { return '('; }
")"             { return ')'; }
";"             { return ';'; }
[ \n\t]         { /* skip white space */ }
"#".*           { /* skip comments */ }
.               { scanerror (); }

%%

