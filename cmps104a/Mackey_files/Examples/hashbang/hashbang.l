%{
const char *rcsid =
"$Id: hashbang.l,v 354.12 2005-07-01 12:22:13-07 - - $";

#include <assert.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>

#define IDENT           0x102
#define NUMBER          0x103
#define BAD_NUMBER      0x104
#define JUNK            0x105

#define eprintf(...) fprintf (stderr, __VA_ARGS__)
#define YY_USER_INIT { BEGIN (HASHBANG); }

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

LETTER          [a-zA-Z]
DIGIT           [0-9]
IDENT           ({LETTER}({LETTER}|{DIGIT})*)
FRACTION        ({DIGIT}+\.{DIGIT}*|\.{DIGIT}+)
EXPONENT        ([Ee][+-]?{DIGIT}+)
BAD_EXPONENT    ([Ee][+-]?)
INTEGER         ({DIGIT}+)
NUMBER          ({FRACTION}{EXPONENT}?|{INTEGER}{EXPONENT})
BAD_NUMBER      ({FRACTION}{BAD_EXPONENT}?|{INTEGER}{BAD_EXPONENT})

%x HASHBANG

%%

<HASHBANG>"#!".* { BEGIN (INITIAL); eprintf ("HASHBANG: %s\n", yytext);}
<HASHBANG>.|\n   { BEGIN (INITIAL); yyless(0); }

[ \t\n]+         { }
"//".*           { eprintf ("Comment: %s\n", yytext); }
{IDENT}          { return IDENT; }
{NUMBER}         { return NUMBER; }
{BAD_NUMBER}     { return BAD_NUMBER; }
{INTEGER}        { return BAD_NUMBER; }
[-+*/]           { return *yytext; }
.                { return JUNK; }

%%

/*
* This program shows how to make flex recognize a shell script that
* begins with a hashbang.  We scan the first line using a special
* mode then switch to INITIAL mode.
*/

int main (int argc, char **argv){
   int argi = 1;
   yy_flex_debug = 1;
   /* All output to stderr, because yy_flex_debug does. */
   if (argc > 1 && argv[1][0] == '-') ++argi;
   if (argi < argc){
      yyin = fopen (argv[argi], "r");
      if (yyin) {
         eprintf ("yyin = %s: OK\n", argv[argi]);
      }else{
         eprintf ("%s: %s\n", argv[argi], strerror(errno));
         exit (EXIT_FAILURE);
      };
   };
   for (argi = 0; argi < argc; ++argi) {
      eprintf ("argv[%d]=\"%s\"\n", argi, argv[argi]);
   };
   eprintf ("%s\n", rcsid);
   for (;;) {
      int token = yylex();
      if (token == 0) break;
      eprintf ("TOKEN %d = \"%s\"\n", token, yytext);
   };
   if (yyin != stdin) fclose (yyin);
   return EXIT_SUCCESS;
}

