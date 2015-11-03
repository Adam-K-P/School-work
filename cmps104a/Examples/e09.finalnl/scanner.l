%{
// $Id$

//
// Check for final nl at EOF
//

#include <stdio.h>

%}

%option 8bit
%option backup
%option debug
%option ecs
%option nodefault
%option nounput
%option noyywrap
%option perf-report
%option verbose
%option warn

%%

.            {return *yytext; }
\n           {printf ("nl before EOF\n"; }
<<EOF>>      {printf ("No nl at EOF\n"; }

%%

int main (void) {
   while (yylex () != 0) {};
   return 0;
}

