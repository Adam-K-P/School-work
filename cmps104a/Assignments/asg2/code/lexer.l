/* $Id: lexer.l,v 1.3 2015-07-09 14:08:58-07 - - $ */

%{

#include "utils.h"

#define YY_USER_ACTION  { lexer::advance(); }

#define RETURN(SYMBOL) { \
   yylval = new astree (SYMBOL, lexer::lloc, yytext); \
   return SYMBOL; \
}

#define RETDIR(SYMBOL) { \
   lexer::newfilename(yytext); \
   RETURN (SYMBOL); \
}

%}

%option 8bit
%option debug
%option nodefault
%option noinput
%option nounput
%option noyywrap
%option verbose
%option warn

LETTER          [A-Za-z_]
DIGIT           [0-9]
MANTISSA        ({DIGIT}+\.?{DIGIT}*|\.{DIGIT}+)
EXPONENT        ([Ee][+-]?{DIGIT}+)
NUMBER          ({MANTISSA}{EXPONENT}?)
NOTNUMBER       ({MANTISSA}[Ee][+-]?)
TOK_IDENT       ({LETTER}({LETTER}|{DIGIT})*)
DIRECTIVE       ("# "{NUMBER}" "\".*\")
RESERVED_1      (["void""bool""char""int""string""struct""if""else""while"])
RESERVED_2      (["return""false""true""null""ord""chr""new"])
RESERVED        ({RESERVED_1}|{RESERVED_2})

%%

{DIRECTIVE}     { RETDIR (DIRECTIVE); }

"#".*           { lexer::include(); }
[ \t]+          { }
\n              { lexer::newline(); }

{NUMBER}        { RETURN (NUMBER); }
{RESERVED}      { printf("reserved yo\n"); }
{TOK_IDENT}     { RETURN (TOK_IDENT); }
"="             { RETURN ('='); }
"+"             { RETURN ('+'); }
"-"             { RETURN ('-'); }
"*"             { RETURN ('*'); }
"/"             { RETURN ('/'); }
"^"             { RETURN ('^'); }
"("             { RETURN ('('); }
")"             { RETURN (')'); }
";"             { RETURN (';'); }
"["             { RETURN ('['); }
"]"             { RETURN (']'); }
"{"             { RETURN ('{'); }
"}"             { RETURN ('}'); }
"<"             { RETURN ('<'); }
">"             { RETURN ('>'); }

{NOTNUMBER}     { lexer::badtoken (yytext); RETURN (NUMBER); }
.               { lexer::badchar (*yytext); }

%%

