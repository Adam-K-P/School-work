// $Id: extern.h,v 1.4 2014-10-24 16:32:04-07 - - $

#ifndef __EXTERN_H__
#define __EXTERN_H__

//
// Include some things from STL.
//
#include <map>
#include <string>
using namespace std;

//
// A more compact representation should be used for efficiency.
// No token ever has both a symbol and a value.
//
struct yystype {
   string sym;
   double val;
};
extern map<string,double> symtab;

//
// External symbols.
//
extern int yy_flex_debug;
extern int yydebug;
void error (const string& message, const string& data);
void yyerror (const string& message);
int yylex (void);
int yyparse (void);
double sym_get (const string& symbol);
double sym_put (const string& symbol, double value);

//
// Include parser-generated symbols.
//
#define YYSTYPE yystype
#include "parser.h"

#endif

