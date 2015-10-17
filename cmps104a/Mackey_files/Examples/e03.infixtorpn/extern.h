// $Id: extern.h,v 1.2 2013-09-03 20:17:41-07 - - $

#ifndef __EXTERN_H__
#define __EXTERN_H__

extern int yy_flex_debug;
extern int yydebug;
extern char *yytext;

void yyerror (const char *);
int yylex (void);
int yyparse (void);

void printchar (char);
void scanerror (void);

#endif

