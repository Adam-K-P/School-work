/* Adam Pinarbasi
 * akpinarb
 * main.cpp
 * asg1 */

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
STRING_LIT      (\"(\\.|[^"])*\")
CHAR_LIT        ('(\\.|[^'])*')

%%

"void"          { RETURN (TOK_KW_VOID);   }
"bool"          { RETURN (TOK_KW_BOOL);   }
"char"          { RETURN (TOK_KW_CHAR);   }
"int"           { RETURN (TOK_KW_INT);    }
"string"        { RETURN (TOK_KW_STRING); }
"struct"        { RETURN (TOK_KW_STRUCT); }
"if"            { RETURN (TOK_KW_IF);     }
"else"          { RETURN (TOK_KW_ELSE);   }
"while"         { RETURN (TOK_KW_WHILE);  }
"return"        { RETURN (TOK_KW_RETURN); }
"false"         { RETURN (TOK_KW_FALSE);  }
"true"          { RETURN (TOK_KW_TRUE);   }
"null"          { RETURN (TOK_KW_NULL);   }
"ord"           { RETURN (TOK_KW_ORD);    }
"chr"           { RETURN (TOK_KW_CHR);    }
"new"           { RETURN (TOK_KW_NEW);    }

{DIRECTIVE}     { RETDIR (DIRECTIVE); }

"#".*           { lexer::include(); }
[ \t]+          { }
\n              { lexer::newline(); }

{NUMBER}        { RETURN (NUMBER); }
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
"!"             { RETURN ('!'); }

{CHAR_LIT}      { RETURN (CHAR_LIT);   }
{STRING_LIT}    { RETURN (STRING_LIT); }
","             { RETURN (','); } 
"."             { RETURN ('.'); }
{NOTNUMBER}     { lexer::badtoken (yytext); RETURN (NUMBER); }
.               { lexer::badchar (*yytext); }

%%

