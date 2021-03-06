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
#define YYFINAL  62
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   594

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  46
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  22
/* YYNRULES -- Number of rules.  */
#define YYNRULES  83
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  157

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
       0,    47,    47,    50,    51,    52,    53,    54,    55,    56,
      57,    58,    61,    62,    66,    67,    68,    69,    72,    73,
      76,    77,    80,    81,    84,    85,    88,    89,    90,    91,
      92,    93,    94,    97,   102,   103,   106,   109,   110,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,   121,
     122,   123,   124,   125,   126,   127,   128,   129,   130,   133,
     134,   135,   136,   137,   138,   141,   142,   143,   146,   148,
     150,   155,   156,   160,   161,   164,   166,   169,   170,   171,
     172,   173,   176,   178
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
  "';'", "'('", "')'", "'.'", "$accept", "start", "program", "structd",
  "fields", "function", "identseq", "block", "stmtseq", "statmnt", "while",
  "return", "vardecl", "expr", "constant", "variable", "allocatr",
  "ifelse", "exprseq", "call", "basetype", "identdec", YY_NULLPTR
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

#define YYPACT_NINF -95

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-95)))

#define YYTABLE_NINF -12

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     134,   -18,   -13,   -95,   -95,   -95,   -95,   -95,   -95,   -95,
      21,    -9,     6,   391,   -95,   -95,   -95,   391,   391,   113,
     -95,   -95,   246,   391,   391,   -95,   391,    27,   174,   -95,
     -95,   -95,   -95,   -95,   -95,   -95,   397,   -95,   -95,   -95,
     -95,   -95,     5,   -12,   -95,   275,    16,   391,   391,   549,
     -95,   549,   549,    10,    11,     4,   210,   -95,    18,   379,
     379,   413,   -95,   -95,   -95,   -95,   -95,   391,   304,   391,
     391,   391,   391,   391,   333,   362,    25,   -95,    59,   -95,
      44,   391,    -6,   -95,   431,    33,    50,   447,   465,    39,
     391,   391,   -95,   -95,   -95,   483,   391,   549,    46,    46,
      12,    12,    12,   391,     1,   391,     1,   391,   -95,    85,
     499,   -16,   -25,   -95,   391,   -95,   -95,   104,     8,   246,
     246,   -95,   515,   533,   -95,   549,   549,   549,   549,   -95,
     -95,   -95,   159,   -16,   -95,   -95,     9,    48,    63,    79,
     -95,   -95,   -95,   -95,   -95,    53,    67,   -95,    93,   246,
     -95,    97,    61,   -95,    65,   -95,   -95
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,    65,    59,     6,    77,    78,    79,    80,    81,
       0,     0,     0,    34,    63,    62,    64,     0,     0,     0,
      60,    61,     0,     0,     0,    23,     0,     0,     0,     3,
       5,    30,     4,    32,    31,    27,     0,    57,    56,    58,
      26,    54,     0,    55,    29,     0,     0,     0,     0,    35,
      55,    52,    51,     0,    81,     0,     0,    24,    55,    49,
      50,     0,     1,    10,     9,     8,     7,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    28,     0,    83,
       0,     0,     0,    75,    74,     0,     0,     0,     0,     0,
       0,     0,    22,    25,    53,     0,     0,    37,    38,    39,
      40,    41,    42,     0,    43,     0,    44,     0,    67,     0,
       0,     0,     0,    20,     0,    76,    12,     0,     0,     0,
       0,    68,     0,     0,    66,    45,    47,    48,    46,    82,
      36,    18,     0,     0,    73,    13,     0,     0,     0,    71,
      33,    69,    70,    21,    19,     0,     0,    17,     0,     0,
      15,     0,     0,    72,     0,    16,    14
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -95,   -95,   -95,    77,   -95,    80,   -23,   -94,   -95,   -21,
     -95,   -95,   -95,    -3,   -95,   -95,   -95,   -95,    -4,   -95,
     -11,     0
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,    27,    28,    29,   117,    30,   112,    31,    56,    32,
      33,    34,    35,    36,    37,    38,    39,    40,    85,    41,
      42,    50
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      43,    57,     5,     6,     7,     8,     9,    66,    55,    79,
      49,    22,   137,   145,    51,    52,   132,   131,    81,   133,
      59,    60,    58,    61,    44,    46,    25,    62,    43,    67,
      45,    82,    91,    80,    47,    93,   138,   146,   111,   144,
      67,    76,    84,    86,    87,    88,    78,    73,    81,    48,
      74,    75,    76,    89,    90,   107,    58,    78,     5,     6,
       7,     8,     9,   108,    95,    97,    98,    99,   100,   101,
     102,   104,   106,   109,    67,   118,   116,   115,   110,    71,
      72,    73,   113,   121,    74,    75,    76,   122,   123,   129,
     147,    78,   148,   125,   149,   150,   151,   152,   139,   140,
     126,   154,   127,   155,   128,    64,   136,   156,    65,   143,
     134,    84,     5,     6,     7,     8,     9,    53,     0,    58,
      58,     5,     6,     7,     8,    54,     0,     0,   153,     0,
     135,     0,   113,     0,   -11,     1,     0,     0,     2,     3,
       4,     0,     5,     6,     7,     8,     9,    10,    11,    58,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
       0,    22,     0,     0,     0,    23,    24,     5,     6,     7,
       8,     9,     0,     0,    -2,     1,    25,    26,     2,     3,
      63,     0,     5,     6,     7,     8,     9,    10,    11,     0,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
       0,    22,     0,     0,     0,    23,    24,     0,     0,     0,
       0,     1,     0,     0,     2,     3,    25,    26,     5,     6,
       7,     8,     9,     0,    11,     0,    12,    13,    14,    15,
      16,    17,    18,    19,    20,    21,    92,    22,     0,     0,
       0,    23,    24,     0,     0,     0,     0,     1,     0,     0,
       2,     3,    25,    26,     5,     6,     7,     8,     9,     0,
      11,     0,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    21,     0,    22,     0,     0,     0,    23,    24,     2,
       3,     0,     0,     5,     6,     7,     8,     9,    25,    26,
       0,     0,     0,    14,    15,    16,    17,    18,    19,    20,
      21,     0,     0,     0,     0,     0,    23,    24,     2,     3,
       0,     0,     5,     6,     7,     8,     9,     0,    26,    83,
       0,     0,    14,    15,    16,    17,    18,    19,    20,    21,
       0,     0,     0,     0,    96,    23,    24,     2,     3,     0,
       0,     5,     6,     7,     8,     9,     0,    26,     0,     0,
       0,    14,    15,    16,    17,    18,    19,    20,    21,     0,
       0,     0,     0,   103,    23,    24,     2,     3,     0,     0,
       5,     6,     7,     8,     9,     0,    26,     0,     0,     0,
      14,    15,    16,    17,    18,    19,    20,    21,     0,     0,
       0,     0,   105,    23,    24,     2,     3,     0,     0,     5,
       6,     7,     8,     9,     0,    26,     0,    67,     0,    14,
      15,    16,    17,    18,    19,    20,    21,    74,    75,    76,
       0,     0,    23,    24,    78,    67,     0,    68,    69,    70,
      71,    72,    73,     0,    26,    74,    75,    76,     0,    77,
       0,    67,    78,    68,    69,    70,    71,    72,    73,     0,
       0,    74,    75,    76,     0,     0,     0,    94,    78,    67,
       0,    68,    69,    70,    71,    72,    73,     0,     0,    74,
      75,    76,   114,     0,     0,    67,    78,    68,    69,    70,
      71,    72,    73,     0,     0,    74,    75,    76,     0,     0,
       0,   119,    78,    67,     0,    68,    69,    70,    71,    72,
      73,     0,     0,    74,    75,    76,     0,     0,     0,   120,
      78,    67,   124,    68,    69,    70,    71,    72,    73,     0,
       0,    74,    75,    76,     0,     0,     0,    67,    78,    68,
      69,    70,    71,    72,    73,     0,     0,    74,    75,    76,
       0,   130,     0,    67,    78,    68,    69,    70,    71,    72,
      73,     0,     0,    74,    75,    76,     0,     0,     0,   141,
      78,    67,   142,    68,    69,    70,    71,    72,    73,     0,
       0,    74,    75,    76,     0,     0,     0,    67,    78,    68,
      69,    70,    71,    72,    73,     0,     0,    74,    75,    76,
       0,     0,     0,     0,    78
};

static const yytype_int16 yycheck[] =
{
       0,    22,     8,     9,    10,    11,    12,    28,    19,     4,
      13,    27,     4,     4,    17,    18,    41,   111,    30,    44,
      23,    24,    22,    26,    42,     4,    42,     0,    28,    28,
      43,    43,    28,    28,    43,    56,    28,    28,    44,   133,
      28,    40,    45,    27,    47,    48,    45,    35,    30,    43,
      38,    39,    40,    43,    43,    30,    56,    45,     8,     9,
      10,    11,    12,     4,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    29,    28,    86,    26,    44,    81,    33,
      34,    35,    82,    44,    38,    39,    40,    90,    91,     4,
      42,    45,    29,    96,    15,    42,    29,     4,   119,   120,
     103,     4,   105,    42,   107,    28,   117,    42,    28,   132,
     114,   114,     8,     9,    10,    11,    12,     4,    -1,   119,
     120,     8,     9,    10,    11,    12,    -1,    -1,   149,    -1,
      26,    -1,   132,    -1,     0,     1,    -1,    -1,     4,     5,
       6,    -1,     8,     9,    10,    11,    12,    13,    14,   149,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      -1,    27,    -1,    -1,    -1,    31,    32,     8,     9,    10,
      11,    12,    -1,    -1,     0,     1,    42,    43,     4,     5,
       6,    -1,     8,     9,    10,    11,    12,    13,    14,    -1,
      16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
      -1,    27,    -1,    -1,    -1,    31,    32,    -1,    -1,    -1,
      -1,     1,    -1,    -1,     4,     5,    42,    43,     8,     9,
      10,    11,    12,    -1,    14,    -1,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    26,    27,    -1,    -1,
      -1,    31,    32,    -1,    -1,    -1,    -1,     1,    -1,    -1,
       4,     5,    42,    43,     8,     9,    10,    11,    12,    -1,
      14,    -1,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    -1,    27,    -1,    -1,    -1,    31,    32,     4,
       5,    -1,    -1,     8,     9,    10,    11,    12,    42,    43,
      -1,    -1,    -1,    18,    19,    20,    21,    22,    23,    24,
      25,    -1,    -1,    -1,    -1,    -1,    31,    32,     4,     5,
      -1,    -1,     8,     9,    10,    11,    12,    -1,    43,    44,
      -1,    -1,    18,    19,    20,    21,    22,    23,    24,    25,
      -1,    -1,    -1,    -1,    30,    31,    32,     4,     5,    -1,
      -1,     8,     9,    10,    11,    12,    -1,    43,    -1,    -1,
      -1,    18,    19,    20,    21,    22,    23,    24,    25,    -1,
      -1,    -1,    -1,    30,    31,    32,     4,     5,    -1,    -1,
       8,     9,    10,    11,    12,    -1,    43,    -1,    -1,    -1,
      18,    19,    20,    21,    22,    23,    24,    25,    -1,    -1,
      -1,    -1,    30,    31,    32,     4,     5,    -1,    -1,     8,
       9,    10,    11,    12,    -1,    43,    -1,    28,    -1,    18,
      19,    20,    21,    22,    23,    24,    25,    38,    39,    40,
      -1,    -1,    31,    32,    45,    28,    -1,    30,    31,    32,
      33,    34,    35,    -1,    43,    38,    39,    40,    -1,    42,
      -1,    28,    45,    30,    31,    32,    33,    34,    35,    -1,
      -1,    38,    39,    40,    -1,    -1,    -1,    44,    45,    28,
      -1,    30,    31,    32,    33,    34,    35,    -1,    -1,    38,
      39,    40,    41,    -1,    -1,    28,    45,    30,    31,    32,
      33,    34,    35,    -1,    -1,    38,    39,    40,    -1,    -1,
      -1,    44,    45,    28,    -1,    30,    31,    32,    33,    34,
      35,    -1,    -1,    38,    39,    40,    -1,    -1,    -1,    44,
      45,    28,    29,    30,    31,    32,    33,    34,    35,    -1,
      -1,    38,    39,    40,    -1,    -1,    -1,    28,    45,    30,
      31,    32,    33,    34,    35,    -1,    -1,    38,    39,    40,
      -1,    42,    -1,    28,    45,    30,    31,    32,    33,    34,
      35,    -1,    -1,    38,    39,    40,    -1,    -1,    -1,    44,
      45,    28,    29,    30,    31,    32,    33,    34,    35,    -1,
      -1,    38,    39,    40,    -1,    -1,    -1,    28,    45,    30,
      31,    32,    33,    34,    35,    -1,    -1,    38,    39,    40,
      -1,    -1,    -1,    -1,    45
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     4,     5,     6,     8,     9,    10,    11,    12,
      13,    14,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    27,    31,    32,    42,    43,    47,    48,    49,
      51,    53,    55,    56,    57,    58,    59,    60,    61,    62,
      63,    65,    66,    67,    42,    43,     4,    43,    43,    59,
      67,    59,    59,     4,    12,    66,    54,    55,    67,    59,
      59,    59,     0,     6,    49,    51,    55,    28,    30,    31,
      32,    33,    34,    35,    38,    39,    40,    42,    45,     4,
      28,    30,    43,    44,    59,    64,    27,    59,    59,    43,
      43,    28,    26,    55,    44,    59,    30,    59,    59,    59,
      59,    59,    59,    30,    59,    30,    59,    30,     4,    29,
      59,    44,    52,    67,    41,    44,    26,    50,    66,    44,
      44,    44,    59,    59,    29,    59,    59,    59,    59,     4,
      42,    53,    41,    44,    64,    26,    66,     4,    28,    55,
      55,    44,    29,    52,    53,     4,    28,    42,    29,    15,
      42,    29,     4,    55,     4,    42,    42
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    46,    47,    48,    48,    48,    48,    48,    48,    48,
      48,    48,    49,    49,    50,    50,    50,    50,    51,    51,
      52,    52,    53,    53,    54,    54,    55,    55,    55,    55,
      55,    55,    55,    56,    57,    57,    58,    59,    59,    59,
      59,    59,    59,    59,    59,    59,    59,    59,    59,    59,
      59,    59,    59,    59,    59,    59,    59,    59,    59,    60,
      60,    60,    60,    60,    60,    61,    61,    61,    62,    62,
      62,    63,    63,    64,    64,    65,    65,    66,    66,    66,
      66,    66,    67,    67
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     1,     1,     1,     2,     2,     2,
       2,     0,     4,     5,     6,     4,     5,     3,     4,     5,
       1,     3,     3,     1,     1,     2,     1,     1,     2,     2,
       1,     1,     1,     5,     1,     2,     4,     3,     3,     3,
       3,     3,     3,     3,     3,     4,     4,     4,     4,     2,
       2,     2,     2,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     4,     3,     4,     5,
       5,     5,     7,     3,     1,     3,     4,     1,     1,     1,
       1,     1,     4,     2
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

    case 47: /* start  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1099 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 48: /* program  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1105 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 49: /* structd  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1111 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 50: /* fields  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1117 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 51: /* function  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1123 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 52: /* identseq  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1129 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 53: /* block  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1135 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 54: /* stmtseq  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1141 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 55: /* statmnt  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1147 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 56: /* while  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1153 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 57: /* return  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1159 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 58: /* vardecl  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1165 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 59: /* expr  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1171 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 60: /* constant  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1177 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 61: /* variable  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1183 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 62: /* allocatr  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1189 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 63: /* ifelse  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1195 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 64: /* exprseq  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1201 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 65: /* call  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1207 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 66: /* basetype  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1213 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 67: /* identdec  */
#line 22 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1219 "yyparse.cpp" /* yacc.c:684  */
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
#line 1565 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 4: /* TOK_IDENT  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1571 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 5: /* NUMBER  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1577 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 6: /* DIRECTIVE  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1583 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 7: /* RESERVED  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1589 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 8: /* TOK_KW_VOID  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1595 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 9: /* TOK_KW_BOOL  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1601 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 10: /* TOK_KW_CHAR  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1607 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 11: /* TOK_KW_INT  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1613 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 12: /* TOK_KW_STRING  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1619 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 13: /* TOK_KW_STRUCT  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1625 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 14: /* TOK_KW_IF  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1631 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 15: /* TOK_KW_ELSE  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1637 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 16: /* TOK_KW_WHILE  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1643 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 17: /* TOK_KW_RETURN  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1649 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 18: /* TOK_KW_FALSE  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1655 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 19: /* TOK_KW_TRUE  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1661 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 20: /* TOK_KW_NULL  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1667 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 21: /* TOK_KW_ORD  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1673 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 22: /* TOK_KW_CHR  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1679 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 23: /* TOK_KW_NEW  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1685 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 24: /* STRING_LIT  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1691 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 25: /* CHAR_LIT  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1697 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 26: /* '}'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1703 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 27: /* '{'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1709 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 28: /* '['  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1715 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 29: /* ']'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1721 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 30: /* '='  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1727 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 31: /* '+'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1733 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 32: /* '-'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1739 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 33: /* '*'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1745 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 34: /* '/'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1751 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 35: /* '^'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1757 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 36: /* POS  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1763 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 37: /* NEG  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1769 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 38: /* '<'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1775 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 39: /* '>'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1781 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 40: /* '!'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1787 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 41: /* ','  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1793 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 42: /* ';'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1799 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 43: /* '('  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1805 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 44: /* ')'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1811 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 45: /* '.'  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1817 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 47: /* start  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1823 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 48: /* program  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1829 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 49: /* structd  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1835 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 50: /* fields  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1841 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 51: /* function  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1847 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 52: /* identseq  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1853 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 53: /* block  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1859 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 54: /* stmtseq  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1865 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 55: /* statmnt  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1871 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 56: /* while  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1877 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 57: /* return  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1883 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 58: /* vardecl  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1889 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 59: /* expr  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1895 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 60: /* constant  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1901 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 61: /* variable  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1907 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 62: /* allocatr  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1913 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 63: /* ifelse  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1919 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 64: /* exprseq  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1925 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 65: /* call  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1931 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 66: /* basetype  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1937 "yyparse.cpp" /* yacc.c:1257  */
        break;

    case 67: /* identdec  */
#line 21 "parser.y" /* yacc.c:1257  */
      { destroy (((*yyvaluep))); }
#line 1943 "yyparse.cpp" /* yacc.c:1257  */
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

#line 2033 "yyparse.cpp" /* yacc.c:1429  */
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
    { astree::print (stdout, parser::root);  
                                        (yyval) = (yyvsp[0]);}
#line 2216 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 3:
#line 50 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2222 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 4:
#line 51 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2228 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 5:
#line 52 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2234 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 6:
#line 53 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2240 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 7:
#line 54 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[0])); }
#line 2246 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 8:
#line 55 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[0])); }
#line 2252 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 9:
#line 56 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[0])); }
#line 2258 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 10:
#line 57 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2264 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 11:
#line 58 "parser.y" /* yacc.c:1646  */
    { (yyval) = parser::root; }
#line 2270 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 13:
#line 63 "parser.y" /* yacc.c:1646  */
    { printf ("reaching struct\n"); }
#line 2276 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 18:
#line 72 "parser.y" /* yacc.c:1646  */
    { printf ("empty fcn\n"); (yyval) = (yyvsp[-3]);}
#line 2282 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 19:
#line 73 "parser.y" /* yacc.c:1646  */
    { printf ("full fcn\n");  (yyval) = (yyvsp[-4]);}
#line 2288 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 20:
#line 76 "parser.y" /* yacc.c:1646  */
    { printf ("identseq test\n"); (yyval) = (yyvsp[0]); }
#line 2294 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 21:
#line 77 "parser.y" /* yacc.c:1646  */
    { printf ("reaching identseq\n"); (yyval) = (yyvsp[-2]); }
#line 2300 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 22:
#line 80 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[0])); (yyval) = (yyvsp[-1]); }
#line 2306 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 23:
#line 81 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0])); }
#line 2312 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 24:
#line 84 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]);            }
#line 2318 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 25:
#line 85 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt((yyvsp[0])); }
#line 2324 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 26:
#line 88 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2330 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 27:
#line 89 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2336 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 28:
#line 90 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0])); (yyval) = (yyvsp[-1]); }
#line 2342 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 29:
#line 91 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0])); (yyval) = (yyvsp[-1]); }
#line 2348 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 30:
#line 92 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2354 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 31:
#line 93 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2360 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 32:
#line 94 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2366 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 33:
#line 97 "parser.y" /* yacc.c:1646  */
    { printf ("reached WHILE\n");
                                              (yyval) = (yyvsp[-4])->adopt ((yyvsp[-2]), (yyvsp[0]));
                                              destroy ((yyvsp[-3]), (yyvsp[-1])); }
#line 2374 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 34:
#line 102 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]);            }
#line 2380 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 35:
#line 103 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt((yyvsp[0])); }
#line 2386 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 36:
#line 106 "parser.y" /* yacc.c:1646  */
    { printf ("reached vardecl\n"); (yyval) = (yyvsp[-3]); }
#line 2392 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 37:
#line 109 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2398 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 38:
#line 110 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2404 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 39:
#line 111 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2410 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 40:
#line 112 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2416 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 41:
#line 113 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2422 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 42:
#line 114 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2428 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 43:
#line 115 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2434 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 44:
#line 116 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2440 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 45:
#line 117 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-2])->adopt ((yyvsp[-3]), (yyvsp[0])); }
#line 2446 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 46:
#line 118 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-2])->adopt ((yyvsp[-3]), (yyvsp[0])); }
#line 2452 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 47:
#line 119 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-2])->adopt ((yyvsp[-3]), (yyvsp[0])); }
#line 2458 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 48:
#line 120 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-2])->adopt ((yyvsp[-3]), (yyvsp[0])); }
#line 2464 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 49:
#line 121 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt_sym ((yyvsp[0]), POS); }
#line 2470 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 50:
#line 122 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt_sym ((yyvsp[0]), NEG); }
#line 2476 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 51:
#line 123 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[0])); }
#line 2482 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 52:
#line 124 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[0])); }
#line 2488 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 53:
#line 125 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[0])); (yyval) = (yyvsp[-1]); }
#line 2494 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 54:
#line 126 "parser.y" /* yacc.c:1646  */
    { printf ("making fcn call\n"); (yyval) = (yyvsp[0]); }
#line 2500 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 55:
#line 127 "parser.y" /* yacc.c:1646  */
    { printf ("reached identdec\n"); (yyval) = (yyvsp[0]); }
#line 2506 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 56:
#line 128 "parser.y" /* yacc.c:1646  */
    { printf ("reached variable\n"); (yyval) = (yyvsp[0]); }
#line 2512 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 57:
#line 129 "parser.y" /* yacc.c:1646  */
    { printf ("reached constant\n"); (yyval) = (yyvsp[0]); }
#line 2518 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 58:
#line 130 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2524 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 59:
#line 133 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2530 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 60:
#line 134 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2536 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 61:
#line 135 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2542 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 62:
#line 136 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2548 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 63:
#line 137 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2554 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 64:
#line 138 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); printf ("reached null\n"); }
#line 2560 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 65:
#line 141 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2566 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 66:
#line 142 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[0])); (yyval) = (yyvsp[-3]); }
#line 2572 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 67:
#line 143 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-1])); (yyval) = (yyvsp[-2]); }
#line 2578 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 68:
#line 146 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-1]), (yyvsp[0])); 
                                         (yyval) = (yyvsp[-3])->adopt ((yyvsp[-2])); }
#line 2585 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 69:
#line 149 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[0])); (yyval) = (yyvsp[-4])->adopt ((yyvsp[-3]), (yyvsp[-1])); }
#line 2591 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 70:
#line 151 "parser.y" /* yacc.c:1646  */
    { printf ("calling array allocator\n"); 
              destroy ((yyvsp[-2]), (yyvsp[0])); (yyval) = (yyvsp[-4])->adopt ((yyvsp[-3]), (yyvsp[-1])); }
#line 2598 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 71:
#line 155 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-4]); printf ("reached if\n"); }
#line 2604 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 72:
#line 157 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-6]); printf ("reached ifelse\n"); }
#line 2610 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 73:
#line 160 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2616 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 74:
#line 161 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2622 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 75:
#line 164 "parser.y" /* yacc.c:1646  */
    { printf ("calling empty fcn\n"); 
                                      (yyval) = (yyvsp[-2]); }
#line 2629 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 76:
#line 166 "parser.y" /* yacc.c:1646  */
    { printf ("calling fcn\n"); (yyval) = (yyvsp[-3]); }
#line 2635 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 77:
#line 169 "parser.y" /* yacc.c:1646  */
    { printf ("reached TOK_VOID\n");   (yyval) = (yyvsp[0]); }
#line 2641 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 78:
#line 170 "parser.y" /* yacc.c:1646  */
    { printf ("reached TOK_BOOL\n");   (yyval) = (yyvsp[0]); }
#line 2647 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 79:
#line 171 "parser.y" /* yacc.c:1646  */
    { printf ("reached TOK_CHAR\n");   (yyval) = (yyvsp[0]); }
#line 2653 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 80:
#line 172 "parser.y" /* yacc.c:1646  */
    { printf ("reached TOK_INT\n");    (yyval) = (yyvsp[0]); }
#line 2659 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 81:
#line 173 "parser.y" /* yacc.c:1646  */
    { printf ("reached TOK_STRING\n"); (yyval) = (yyvsp[0]); }
#line 2665 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 82:
#line 176 "parser.y" /* yacc.c:1646  */
    { printf ("reached array dec\n");
                                         (yyval) = (yyvsp[-3]); }
#line 2672 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 83:
#line 178 "parser.y" /* yacc.c:1646  */
    { printf ("reached identdec: %s\n", 
                                                  yytext); 
                                         (yyval) = (yyvsp[-1]); }
#line 2680 "yyparse.cpp" /* yacc.c:1646  */
    break;


#line 2684 "yyparse.cpp" /* yacc.c:1646  */
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
#line 183 "parser.y" /* yacc.c:1906  */


const char* parser::get_tname (int symbol) {
   return yytname [YYTRANSLATE (symbol)];
}

