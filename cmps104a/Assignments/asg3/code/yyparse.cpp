/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 3 "parser.y" /* yacc.c:339  */


#include <assert.h>
#include <stdlib.h>
#include <string.h>

#include "astree.h"
#include "utils.h"
#include "yylex.h"


#line 78 "yyparse.cpp" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 1
#endif

/* In a future release of Bison, this section will be replaced
   by #include "yyparse.h".  */
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
    POS = 281,
    NEG = 282
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

/* Copy the second part of user declarations.  */

#line 157 "yyparse.cpp" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  61
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   593

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  46
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  21
/* YYNRULES -- Number of rules.  */
#define YYNRULES  82
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  156

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   282

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    40,     2,     2,     2,     2,     2,     2,
      43,    44,    33,    31,    41,    32,    45,    34,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    42,
      38,    30,    39,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    28,     2,    29,    35,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    27,     2,    26,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    36,    37
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    47,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    58,    59,    63,    64,    65,    66,    69,    70,    73,
      74,    77,    78,    81,    82,    85,    86,    87,    88,    89,
      90,    91,    94,    99,   100,   103,   106,   107,   108,   109,
     110,   111,   112,   113,   114,   115,   116,   117,   118,   119,
     120,   121,   122,   123,   124,   125,   126,   127,   130,   131,
     132,   133,   134,   135,   138,   139,   140,   143,   145,   147,
     152,   153,   157,   158,   161,   163,   166,   167,   168,   169,
     170,   173,   175
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 1
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "ROOT", "TOK_IDENT", "NUMBER",
  "DIRECTIVE", "RESERVED", "TOK_KW_VOID", "TOK_KW_BOOL", "TOK_KW_CHAR",
  "TOK_KW_INT", "TOK_KW_STRING", "TOK_KW_STRUCT", "TOK_KW_IF",
  "TOK_KW_ELSE", "TOK_KW_WHILE", "TOK_KW_RETURN", "TOK_KW_FALSE",
  "TOK_KW_TRUE", "TOK_KW_NULL", "TOK_KW_ORD", "TOK_KW_CHR", "TOK_KW_NEW",
  "STRING_LIT", "CHAR_LIT", "'}'", "'{'", "'['", "']'", "'='", "'+'",
  "'-'", "'*'", "'/'", "'^'", "POS", "NEG", "'<'", "'>'", "'!'", "','",
  "';'", "'('", "')'", "'.'", "$accept", "program", "structd", "fields",
  "function", "identseq", "block", "stmtseq", "statmnt", "while", "return",
  "vardecl", "expr", "constant", "variable", "allocatr", "ifelse",
  "exprseq", "call", "basetype", "identdec", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   125,   123,    91,    93,
      61,    43,    45,    42,    47,    94,   281,   282,    60,    62,
      33,    44,    59,    40,    41,    46
};
# endif

#define YYPACT_NINF -108

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-108)))

#define YYTABLE_NINF -11

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     133,   -29,   -27,  -108,  -108,  -108,  -108,  -108,  -108,  -108,
      13,   -25,   -15,   390,  -108,  -108,  -108,   390,   390,   158,
    -108,  -108,   245,   390,   390,  -108,   390,   173,  -108,  -108,
    -108,  -108,  -108,  -108,  -108,   396,  -108,  -108,  -108,  -108,
    -108,    -2,   -19,  -108,   274,     3,   390,   390,   548,  -108,
     548,   548,   -10,     5,    21,   209,  -108,    20,   378,   378,
     412,  -108,  -108,  -108,  -108,  -108,   390,   303,   390,   390,
     390,   390,   390,   332,   361,    23,  -108,    27,  -108,    22,
     390,    28,  -108,   430,    10,    48,   446,   464,    17,   390,
     390,  -108,  -108,  -108,   482,   390,   548,    50,    50,     7,
       7,     7,   390,    51,   390,    51,   390,  -108,    58,   498,
     -23,   -32,  -108,   390,  -108,  -108,    97,     1,   245,   245,
    -108,   514,   532,  -108,   548,   548,   548,   548,  -108,  -108,
    -108,   103,   -23,  -108,  -108,     4,    33,    47,    65,  -108,
    -108,  -108,  -108,  -108,    40,    64,  -108,    90,   245,  -108,
      96,    60,  -108,    74,  -108,  -108
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,    64,    58,     5,    76,    77,    78,    79,    80,
       0,     0,     0,    33,    62,    61,    63,     0,     0,     0,
      59,    60,     0,     0,     0,    22,     0,     0,     2,     4,
      29,     3,    31,    30,    26,     0,    56,    55,    57,    25,
      53,     0,    54,    28,     0,     0,     0,     0,    34,    54,
      51,    50,     0,    80,     0,     0,    23,    54,    48,    49,
       0,     1,     9,     8,     7,     6,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,    82,     0,
       0,     0,    74,    73,     0,     0,     0,     0,     0,     0,
       0,    21,    24,    52,     0,     0,    36,    37,    38,    39,
      40,    41,     0,    42,     0,    43,     0,    66,     0,     0,
       0,     0,    19,     0,    75,    11,     0,     0,     0,     0,
      67,     0,     0,    65,    44,    46,    47,    45,    81,    35,
      17,     0,     0,    72,    12,     0,     0,     0,    70,    32,
      68,    69,    20,    18,     0,     0,    16,     0,     0,    14,
       0,     0,    71,     0,    15,    13
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
    -108,  -108,    93,  -108,    94,   -14,  -107,  -108,   -21,  -108,
    -108,  -108,    -3,  -108,  -108,  -108,  -108,     9,  -108,   -12,
       0
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,    27,    28,   116,    29,   111,    30,    55,    31,    32,
      33,    34,    35,    36,    37,    38,    39,    84,    40,    41,
      49
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      42,    56,    78,   130,    22,   136,    65,    54,   144,   131,
      48,    80,   132,    43,    50,    51,    44,    45,    46,    25,
      58,    59,    57,    60,    81,   143,    79,    42,    47,   137,
      85,   107,   145,    88,    92,    66,     5,     6,     7,     8,
       9,    83,    72,    86,    87,    73,    74,    75,    89,    90,
      80,   108,    77,   106,   114,    57,     5,     6,     7,     8,
       9,   120,   128,    94,    96,    97,    98,    99,   100,   101,
     103,   105,   110,   117,   115,   146,   147,   109,    66,    66,
     148,   112,   149,    70,    71,    72,   121,   122,    73,    74,
      75,    75,   124,   150,   151,    77,    77,   138,   139,   125,
     153,   126,   154,   127,   135,     5,     6,     7,     8,     9,
      83,     5,     6,     7,     8,     9,   155,   142,    57,    57,
      63,    64,   133,   134,     0,     0,     0,   152,     0,     0,
       0,   112,     0,   -10,     1,     0,     0,     2,     3,     4,
       0,     5,     6,     7,     8,     9,    10,    11,    57,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,     0,
      22,     0,    52,     0,    23,    24,     5,     6,     7,     8,
      53,     0,     0,    61,     1,    25,    26,     2,     3,    62,
       0,     5,     6,     7,     8,     9,    10,    11,     0,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,     0,
      22,     0,     0,     0,    23,    24,     0,     0,     0,     0,
       1,     0,     0,     2,     3,    25,    26,     5,     6,     7,
       8,     9,     0,    11,     0,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    21,    91,    22,     0,     0,     0,
      23,    24,     0,     0,     0,     0,     1,     0,     0,     2,
       3,    25,    26,     5,     6,     7,     8,     9,     0,    11,
       0,    12,    13,    14,    15,    16,    17,    18,    19,    20,
      21,     0,    22,     0,     0,     0,    23,    24,     2,     3,
       0,     0,     5,     6,     7,     8,     9,    25,    26,     0,
       0,     0,    14,    15,    16,    17,    18,    19,    20,    21,
       0,     0,     0,     0,     0,    23,    24,     2,     3,     0,
       0,     5,     6,     7,     8,     9,     0,    26,    82,     0,
       0,    14,    15,    16,    17,    18,    19,    20,    21,     0,
       0,     0,     0,    95,    23,    24,     2,     3,     0,     0,
       5,     6,     7,     8,     9,     0,    26,     0,     0,     0,
      14,    15,    16,    17,    18,    19,    20,    21,     0,     0,
       0,     0,   102,    23,    24,     2,     3,     0,     0,     5,
       6,     7,     8,     9,     0,    26,     0,     0,     0,    14,
      15,    16,    17,    18,    19,    20,    21,     0,     0,     0,
       0,   104,    23,    24,     2,     3,     0,     0,     5,     6,
       7,     8,     9,     0,    26,     0,    66,     0,    14,    15,
      16,    17,    18,    19,    20,    21,    73,    74,    75,     0,
       0,    23,    24,    77,    66,     0,    67,    68,    69,    70,
      71,    72,     0,    26,    73,    74,    75,     0,    76,     0,
      66,    77,    67,    68,    69,    70,    71,    72,     0,     0,
      73,    74,    75,     0,     0,     0,    93,    77,    66,     0,
      67,    68,    69,    70,    71,    72,     0,     0,    73,    74,
      75,   113,     0,     0,    66,    77,    67,    68,    69,    70,
      71,    72,     0,     0,    73,    74,    75,     0,     0,     0,
     118,    77,    66,     0,    67,    68,    69,    70,    71,    72,
       0,     0,    73,    74,    75,     0,     0,     0,   119,    77,
      66,   123,    67,    68,    69,    70,    71,    72,     0,     0,
      73,    74,    75,     0,     0,     0,    66,    77,    67,    68,
      69,    70,    71,    72,     0,     0,    73,    74,    75,     0,
     129,     0,    66,    77,    67,    68,    69,    70,    71,    72,
       0,     0,    73,    74,    75,     0,     0,     0,   140,    77,
      66,   141,    67,    68,    69,    70,    71,    72,     0,     0,
      73,    74,    75,     0,     0,     0,    66,    77,    67,    68,
      69,    70,    71,    72,     0,     0,    73,    74,    75,     0,
       0,     0,     0,    77
};

static const yytype_int16 yycheck[] =
{
       0,    22,     4,   110,    27,     4,    27,    19,     4,    41,
      13,    30,    44,    42,    17,    18,    43,     4,    43,    42,
      23,    24,    22,    26,    43,   132,    28,    27,    43,    28,
      27,     4,    28,    43,    55,    28,     8,     9,    10,    11,
      12,    44,    35,    46,    47,    38,    39,    40,    43,    28,
      30,    29,    45,    30,    44,    55,     8,     9,    10,    11,
      12,    44,     4,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    44,    85,    26,    42,    29,    80,    28,    28,
      15,    81,    42,    33,    34,    35,    89,    90,    38,    39,
      40,    40,    95,    29,     4,    45,    45,   118,   119,   102,
       4,   104,    42,   106,   116,     8,     9,    10,    11,    12,
     113,     8,     9,    10,    11,    12,    42,   131,   118,   119,
      27,    27,   113,    26,    -1,    -1,    -1,   148,    -1,    -1,
      -1,   131,    -1,     0,     1,    -1,    -1,     4,     5,     6,
      -1,     8,     9,    10,    11,    12,    13,    14,   148,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    -1,
      27,    -1,     4,    -1,    31,    32,     8,     9,    10,    11,
      12,    -1,    -1,     0,     1,    42,    43,     4,     5,     6,
      -1,     8,     9,    10,    11,    12,    13,    14,    -1,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    -1,
      27,    -1,    -1,    -1,    31,    32,    -1,    -1,    -1,    -1,
       1,    -1,    -1,     4,     5,    42,    43,     8,     9,    10,
      11,    12,    -1,    14,    -1,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    26,    27,    -1,    -1,    -1,
      31,    32,    -1,    -1,    -1,    -1,     1,    -1,    -1,     4,
       5,    42,    43,     8,     9,    10,    11,    12,    -1,    14,
      -1,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    -1,    27,    -1,    -1,    -1,    31,    32,     4,     5,
      -1,    -1,     8,     9,    10,    11,    12,    42,    43,    -1,
      -1,    -1,    18,    19,    20,    21,    22,    23,    24,    25,
      -1,    -1,    -1,    -1,    -1,    31,    32,     4,     5,    -1,
      -1,     8,     9,    10,    11,    12,    -1,    43,    44,    -1,
      -1,    18,    19,    20,    21,    22,    23,    24,    25,    -1,
      -1,    -1,    -1,    30,    31,    32,     4,     5,    -1,    -1,
       8,     9,    10,    11,    12,    -1,    43,    -1,    -1,    -1,
      18,    19,    20,    21,    22,    23,    24,    25,    -1,    -1,
      -1,    -1,    30,    31,    32,     4,     5,    -1,    -1,     8,
       9,    10,    11,    12,    -1,    43,    -1,    -1,    -1,    18,
      19,    20,    21,    22,    23,    24,    25,    -1,    -1,    -1,
      -1,    30,    31,    32,     4,     5,    -1,    -1,     8,     9,
      10,    11,    12,    -1,    43,    -1,    28,    -1,    18,    19,
      20,    21,    22,    23,    24,    25,    38,    39,    40,    -1,
      -1,    31,    32,    45,    28,    -1,    30,    31,    32,    33,
      34,    35,    -1,    43,    38,    39,    40,    -1,    42,    -1,
      28,    45,    30,    31,    32,    33,    34,    35,    -1,    -1,
      38,    39,    40,    -1,    -1,    -1,    44,    45,    28,    -1,
      30,    31,    32,    33,    34,    35,    -1,    -1,    38,    39,
      40,    41,    -1,    -1,    28,    45,    30,    31,    32,    33,
      34,    35,    -1,    -1,    38,    39,    40,    -1,    -1,    -1,
      44,    45,    28,    -1,    30,    31,    32,    33,    34,    35,
      -1,    -1,    38,    39,    40,    -1,    -1,    -1,    44,    45,
      28,    29,    30,    31,    32,    33,    34,    35,    -1,    -1,
      38,    39,    40,    -1,    -1,    -1,    28,    45,    30,    31,
      32,    33,    34,    35,    -1,    -1,    38,    39,    40,    -1,
      42,    -1,    28,    45,    30,    31,    32,    33,    34,    35,
      -1,    -1,    38,    39,    40,    -1,    -1,    -1,    44,    45,
      28,    29,    30,    31,    32,    33,    34,    35,    -1,    -1,
      38,    39,    40,    -1,    -1,    -1,    28,    45,    30,    31,
      32,    33,    34,    35,    -1,    -1,    38,    39,    40,    -1,
      -1,    -1,    -1,    45
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     4,     5,     6,     8,     9,    10,    11,    12,
      13,    14,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    27,    31,    32,    42,    43,    47,    48,    50,
      52,    54,    55,    56,    57,    58,    59,    60,    61,    62,
      64,    65,    66,    42,    43,     4,    43,    43,    58,    66,
      58,    58,     4,    12,    65,    53,    54,    66,    58,    58,
      58,     0,     6,    48,    50,    54,    28,    30,    31,    32,
      33,    34,    35,    38,    39,    40,    42,    45,     4,    28,
      30,    43,    44,    58,    63,    27,    58,    58,    43,    43,
      28,    26,    54,    44,    58,    30,    58,    58,    58,    58,
      58,    58,    30,    58,    30,    58,    30,     4,    29,    58,
      44,    51,    66,    41,    44,    26,    49,    65,    44,    44,
      44,    58,    58,    29,    58,    58,    58,    58,     4,    42,
      52,    41,    44,    63,    26,    65,     4,    28,    54,    54,
      44,    29,    51,    52,     4,    28,    42,    29,    15,    42,
      29,     4,    54,     4,    42,    42
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    46,    47,    47,    47,    47,    47,    47,    47,    47,
      47,    48,    48,    49,    49,    49,    49,    50,    50,    51,
      51,    52,    52,    53,    53,    54,    54,    54,    54,    54,
      54,    54,    55,    56,    56,    57,    58,    58,    58,    58,
      58,    58,    58,    58,    58,    58,    58,    58,    58,    58,
      58,    58,    58,    58,    58,    58,    58,    58,    59,    59,
      59,    59,    59,    59,    60,    60,    60,    61,    61,    61,
      62,    62,    63,    63,    64,    64,    65,    65,    65,    65,
      65,    66,    66
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     1,     1,     2,     2,     2,     2,
       0,     4,     5,     6,     4,     5,     3,     4,     5,     1,
       3,     3,     1,     1,     2,     1,     1,     2,     2,     1,
       1,     1,     5,     1,     2,     4,     3,     3,     3,     3,
       3,     3,     3,     3,     4,     4,     4,     4,     2,     2,
       2,     2,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     4,     3,     4,     5,     5,
       5,     7,     3,     1,     3,     4,     1,     1,     1,     1,
       1,     4,     2
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  switch (yytype)
    {
          case 3: /* ROOT  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 841 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 4: /* TOK_IDENT  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 847 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 5: /* NUMBER  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 853 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 6: /* DIRECTIVE  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 859 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 7: /* RESERVED  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 865 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 8: /* TOK_KW_VOID  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 871 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 9: /* TOK_KW_BOOL  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 877 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 10: /* TOK_KW_CHAR  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 883 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 11: /* TOK_KW_INT  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 889 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 12: /* TOK_KW_STRING  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 895 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 13: /* TOK_KW_STRUCT  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 901 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 14: /* TOK_KW_IF  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 907 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 15: /* TOK_KW_ELSE  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 913 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 16: /* TOK_KW_WHILE  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 919 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 17: /* TOK_KW_RETURN  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 925 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 18: /* TOK_KW_FALSE  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 931 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 19: /* TOK_KW_TRUE  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 937 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 20: /* TOK_KW_NULL  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 943 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 21: /* TOK_KW_ORD  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 949 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 22: /* TOK_KW_CHR  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 955 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 23: /* TOK_KW_NEW  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 961 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 24: /* STRING_LIT  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 967 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 25: /* CHAR_LIT  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 973 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 26: /* '}'  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 979 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 27: /* '{'  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 985 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 28: /* '['  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 991 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 29: /* ']'  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 997 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 30: /* '='  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1003 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 31: /* '+'  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1009 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 32: /* '-'  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1015 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 33: /* '*'  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1021 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 34: /* '/'  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1027 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 35: /* '^'  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1033 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 36: /* POS  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1039 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 37: /* NEG  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1045 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 38: /* '<'  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1051 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 39: /* '>'  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1057 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 40: /* '!'  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1063 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 41: /* ','  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1069 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 42: /* ';'  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1075 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 43: /* '('  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1081 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 44: /* ')'  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1087 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 45: /* '.'  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1093 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 47: /* program  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1099 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 48: /* structd  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1105 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 49: /* fields  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1111 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 50: /* function  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1117 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 51: /* identseq  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1123 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 52: /* block  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1129 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 53: /* stmtseq  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1135 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 54: /* statmnt  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1141 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 55: /* while  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1147 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 56: /* return  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1153 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 57: /* vardecl  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1159 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 58: /* expr  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1165 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 59: /* constant  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1171 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 60: /* variable  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1177 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 61: /* allocatr  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1183 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 62: /* ifelse  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1189 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 63: /* exprseq  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1195 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 64: /* call  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1201 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 65: /* basetype  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1207 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 66: /* identdec  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1213 "yyparse.cpp" /* yacc.c:684  */
        break;


      default:
        break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  switch (yytype)
    {
          case 3: /* ROOT  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1559 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 4: /* TOK_IDENT  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1565 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 5: /* NUMBER  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1571 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 6: /* DIRECTIVE  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1577 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 7: /* RESERVED  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1583 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 8: /* TOK_KW_VOID  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1589 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 9: /* TOK_KW_BOOL  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1595 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 10: /* TOK_KW_CHAR  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1601 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 11: /* TOK_KW_INT  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1607 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 12: /* TOK_KW_STRING  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1613 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 13: /* TOK_KW_STRUCT  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1619 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 14: /* TOK_KW_IF  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1625 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 15: /* TOK_KW_ELSE  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1631 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 16: /* TOK_KW_WHILE  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1637 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 17: /* TOK_KW_RETURN  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1643 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 18: /* TOK_KW_FALSE  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1649 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 19: /* TOK_KW_TRUE  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1655 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 20: /* TOK_KW_NULL  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1661 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 21: /* TOK_KW_ORD  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1667 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 22: /* TOK_KW_CHR  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1673 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 23: /* TOK_KW_NEW  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1679 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 24: /* STRING_LIT  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1685 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 25: /* CHAR_LIT  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1691 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 26: /* '}'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1697 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 27: /* '{'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1703 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 28: /* '['  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1709 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 29: /* ']'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1715 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 30: /* '='  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1721 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 31: /* '+'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1727 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 32: /* '-'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1733 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 33: /* '*'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1739 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 34: /* '/'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1745 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 35: /* '^'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1751 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 36: /* POS  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1757 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 37: /* NEG  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1763 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 38: /* '<'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1769 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 39: /* '>'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1775 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 40: /* '!'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1781 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 41: /* ','  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1787 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 42: /* ';'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1793 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 43: /* '('  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1799 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 44: /* ')'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1805 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 45: /* '.'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1811 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 47: /* program  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1817 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 48: /* structd  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1823 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 49: /* fields  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1829 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 50: /* function  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1835 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 51: /* identseq  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1841 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 52: /* block  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1847 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 53: /* stmtseq  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1853 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 54: /* statmnt  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1859 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 55: /* while  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1865 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 56: /* return  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1871 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 57: /* vardecl  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1877 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 58: /* expr  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1883 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 59: /* constant  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1889 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 60: /* variable  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1895 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 61: /* allocatr  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1901 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 62: /* ifelse  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1907 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 63: /* exprseq  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1913 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 64: /* call  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1919 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 65: /* basetype  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1925 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 66: /* identdec  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1931 "yyparse.cpp" /* yacc.c:1257  */
        break;


      default:
        break;
    }
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

/* User initialization code.  */
#line 24 "parser.y" /* yacc.c:1429  */
{
   parser::root = new astree (ROOT, {0, 0, 0}, "<<ROOT>>");
}

#line 2021 "yyparse.cpp" /* yacc.c:1429  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 47 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2203 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 3:
#line 48 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2209 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 4:
#line 49 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2215 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 5:
#line 50 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2221 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 6:
#line 51 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[0])); }
#line 2227 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 7:
#line 52 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[0])); }
#line 2233 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 8:
#line 53 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[0])); }
#line 2239 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 9:
#line 54 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2245 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 10:
#line 55 "parser.y" /* yacc.c:1646  */
    { (yyval) = parser::root; }
#line 2251 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 12:
#line 60 "parser.y" /* yacc.c:1646  */
    { printf ("reaching struct\n"); }
#line 2257 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 17:
#line 69 "parser.y" /* yacc.c:1646  */
    { printf ("empty fcn\n"); (yyval) = (yyvsp[-3]);}
#line 2263 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 18:
#line 70 "parser.y" /* yacc.c:1646  */
    { printf ("full fcn\n");  (yyval) = (yyvsp[-4]);}
#line 2269 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 19:
#line 73 "parser.y" /* yacc.c:1646  */
    { printf ("identseq test\n"); (yyval) = (yyvsp[0]); }
#line 2275 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 20:
#line 74 "parser.y" /* yacc.c:1646  */
    { printf ("reaching identseq\n"); (yyval) = (yyvsp[-2]); }
#line 2281 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 21:
#line 77 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[0])); (yyval) = (yyvsp[-1]); }
#line 2287 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 22:
#line 78 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0])); }
#line 2293 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 23:
#line 81 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]);            }
#line 2299 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 24:
#line 82 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt((yyvsp[0])); }
#line 2305 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 25:
#line 85 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2311 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 26:
#line 86 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2317 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 27:
#line 87 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0])); (yyval) = (yyvsp[-1]); }
#line 2323 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 28:
#line 88 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0])); (yyval) = (yyvsp[-1]); }
#line 2329 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 29:
#line 89 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2335 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 30:
#line 90 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2341 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 31:
#line 91 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2347 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 32:
#line 94 "parser.y" /* yacc.c:1646  */
    { printf ("reached WHILE\n");
                                              (yyval) = (yyvsp[-4])->adopt ((yyvsp[-2]), (yyvsp[0]));
                                              destroy ((yyvsp[-3]), (yyvsp[-1])); }
#line 2355 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 33:
#line 99 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]);            }
#line 2361 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 34:
#line 100 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt((yyvsp[0])); }
#line 2367 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 35:
#line 103 "parser.y" /* yacc.c:1646  */
    { printf ("reached vardecl\n"); (yyval) = (yyvsp[-3]); }
#line 2373 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 36:
#line 106 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2379 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 37:
#line 107 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2385 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 38:
#line 108 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2391 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 39:
#line 109 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2397 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 40:
#line 110 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2403 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 41:
#line 111 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2409 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 42:
#line 112 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2415 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 43:
#line 113 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2421 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 44:
#line 114 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-2])->adopt ((yyvsp[-3]), (yyvsp[0])); }
#line 2427 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 45:
#line 115 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-2])->adopt ((yyvsp[-3]), (yyvsp[0])); }
#line 2433 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 46:
#line 116 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-2])->adopt ((yyvsp[-3]), (yyvsp[0])); }
#line 2439 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 47:
#line 117 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-2])->adopt ((yyvsp[-3]), (yyvsp[0])); }
#line 2445 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 48:
#line 118 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt_sym ((yyvsp[0]), POS); }
#line 2451 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 49:
#line 119 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt_sym ((yyvsp[0]), NEG); }
#line 2457 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 50:
#line 120 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[0])); }
#line 2463 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 51:
#line 121 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[0])); }
#line 2469 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 52:
#line 122 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[0])); (yyval) = (yyvsp[-1]); }
#line 2475 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 53:
#line 123 "parser.y" /* yacc.c:1646  */
    { printf ("making fcn call\n"); (yyval) = (yyvsp[0]); }
#line 2481 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 54:
#line 124 "parser.y" /* yacc.c:1646  */
    { printf ("reached identdec\n"); (yyval) = (yyvsp[0]); }
#line 2487 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 55:
#line 125 "parser.y" /* yacc.c:1646  */
    { printf ("reached variable\n"); (yyval) = (yyvsp[0]); }
#line 2493 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 56:
#line 126 "parser.y" /* yacc.c:1646  */
    { printf ("reached constant\n"); (yyval) = (yyvsp[0]); }
#line 2499 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 57:
#line 127 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2505 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 58:
#line 130 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2511 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 59:
#line 131 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2517 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 60:
#line 132 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2523 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 61:
#line 133 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2529 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 62:
#line 134 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2535 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 63:
#line 135 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); printf ("reached null\n"); }
#line 2541 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 64:
#line 138 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2547 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 65:
#line 139 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[0])); (yyval) = (yyvsp[-3]); }
#line 2553 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 66:
#line 140 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-1])); (yyval) = (yyvsp[-2]); }
#line 2559 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 67:
#line 143 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-1]), (yyvsp[0])); 
                                         (yyval) = (yyvsp[-3])->adopt ((yyvsp[-2])); }
#line 2566 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 68:
#line 146 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[0])); (yyval) = (yyvsp[-4])->adopt ((yyvsp[-3]), (yyvsp[-1])); }
#line 2572 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 69:
#line 148 "parser.y" /* yacc.c:1646  */
    { printf ("calling array allocator\n"); 
              destroy ((yyvsp[-2]), (yyvsp[0])); (yyval) = (yyvsp[-4])->adopt ((yyvsp[-3]), (yyvsp[-1])); }
#line 2579 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 70:
#line 152 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-4]); printf ("reached if\n"); }
#line 2585 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 71:
#line 154 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-6]); printf ("reached ifelse\n"); }
#line 2591 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 72:
#line 157 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2597 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 73:
#line 158 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2603 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 74:
#line 161 "parser.y" /* yacc.c:1646  */
    { printf ("calling empty fcn\n"); 
                                      (yyval) = (yyvsp[-2]); }
#line 2610 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 75:
#line 163 "parser.y" /* yacc.c:1646  */
    { printf ("calling fcn\n"); (yyval) = (yyvsp[-3]); }
#line 2616 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 76:
#line 166 "parser.y" /* yacc.c:1646  */
    { printf ("reached TOK_VOID\n");   (yyval) = (yyvsp[0]); }
#line 2622 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 77:
#line 167 "parser.y" /* yacc.c:1646  */
    { printf ("reached TOK_BOOL\n");   (yyval) = (yyvsp[0]); }
#line 2628 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 78:
#line 168 "parser.y" /* yacc.c:1646  */
    { printf ("reached TOK_CHAR\n");   (yyval) = (yyvsp[0]); }
#line 2634 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 79:
#line 169 "parser.y" /* yacc.c:1646  */
    { printf ("reached TOK_INT\n");    (yyval) = (yyvsp[0]); }
#line 2640 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 80:
#line 170 "parser.y" /* yacc.c:1646  */
    { printf ("reached TOK_STRING\n"); (yyval) = (yyvsp[0]); }
#line 2646 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 81:
#line 173 "parser.y" /* yacc.c:1646  */
    { printf ("reached array dec\n");
                                         (yyval) = (yyvsp[-3]); }
#line 2653 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 82:
#line 175 "parser.y" /* yacc.c:1646  */
    { printf ("reached identdec: %s\n", 
                                                  yytext); 
                                         (yyval) = (yyvsp[-1]); }
#line 2661 "yyparse.cpp" /* yacc.c:1646  */
    break;


#line 2665 "yyparse.cpp" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 180 "parser.y" /* yacc.c:1906  */


const char* parser::get_tname (int symbol) {
   return yytname [YYTRANSLATE (symbol)];
}

