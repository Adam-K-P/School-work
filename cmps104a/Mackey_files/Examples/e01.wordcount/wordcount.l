%{
// $Id: wordcount.l,v 1.10 2014-10-09 18:24:48-07 - - $

//
// NAME
//    wordcount - count words in files or stdin
//
// SYNOPSIS
//    wordcount
//
// DESCRIPTION
//    Counts words found in stdin.  Also see wc(1).
//

#include <stdio.h>
#include <stdlib.h>

size_t lines = 0;
size_t words = 0;
size_t chars = 0;

%}

%option 8bit
%option debug
%option nodefault
%option nounput
%option noyywrap
%option warn

%%

\n		{ ++chars; ++lines; }
[ \t]+		{ chars += yyleng; }
[^ \t\n]+	{ chars += yyleng; ++words; }

%%

int main() {
   yy_flex_debug = 1;
   yylex ();
   printf ("%8ld lines\n%8ld words\n%8ld chars\n",
                 lines,      words,      chars);
   return EXIT_SUCCESS;
}

