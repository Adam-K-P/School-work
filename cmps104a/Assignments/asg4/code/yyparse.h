/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_YYPARSE_H_INCLUDED
# define YY_YY_YYPARSE_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ROOT = 258,
    TOK_IDENT = 259,
    NUMBER = 260,
    DIRECTIVE = 261,
    RESERVED = 262,
    TOK_KW_VOID = 263,
    TOK_KW_BOOL = 264,
    TOK_KW_CHAR = 265,
    TOK_KW_INT = 266,
    TOK_KW_STRING = 267,
    TOK_KW_STRUCT = 268,
    TOK_KW_IF = 269,
    TOK_KW_ELSE = 270,
    TOK_KW_WHILE = 271,
    TOK_KW_RETURN = 272,
    TOK_KW_FALSE = 273,
    TOK_KW_TRUE = 274,
    TOK_KW_NULL = 275,
    TOK_KW_ORD = 276,
    TOK_KW_CHR = 277,
    TOK_KW_NEW = 278,
    STRING_LIT = 279,
    CHAR_LIT = 280,
    BOOL_EQ = 281,
    BOOL_LESS_EQ = 282,
    BOOL_GRT_EQ = 283,
    BOOL_NOT_EQ = 284,
    FIELD = 285,
    TYPEID = 286,
    DECLID = 287,
    TOK_FUNCTION = 288,
    TOK_RETURNVOID = 289,
    TOK_PROTOTYPE = 290,
    TOK_VARDECL = 291,
    TOK_ARRAY = 292,
    TOK_CALL = 293,
    TOK_NEWARRAY = 294,
    TOK_NEWSTRING = 295,
    TOK_BLOCK = 296,
    TOK_PARAM = 297,
    POS = 298,
    NEG = 299
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_YYPARSE_H_INCLUDED  */
