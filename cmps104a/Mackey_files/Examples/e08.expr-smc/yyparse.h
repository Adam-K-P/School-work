# 37 "<stdin>"
#ifndef YYTOKENTYPE
#define YYTOKENTYPE 


   enum yytokentype {
     ROOT = 258,
     IDENT = 259,
     NUMBER = 260,
     NEG = 261,
     POS = 262
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
#define YYSTYPE_IS_TRIVIAL 1
#define yystype YYSTYPE
#define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;
