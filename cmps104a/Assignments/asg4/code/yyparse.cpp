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

/* Copy the second part of user declarations.  */

#line 174 "yyparse.cpp" /* yacc.c:358  */

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
#define YYFINAL  3
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   853

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  63
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  25
/* YYNRULES -- Number of rules.  */
#define YYNRULES  87
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  163

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   299

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    57,     2,     2,     2,     2,     2,     2,
      59,    61,    50,    48,    62,    49,    58,    51,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    60,
      55,    47,    56,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    28,     2,    29,    52,     2,     2,     2,     2,     2,
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
      25,    30,    31,    32,    33,    34,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    53,    54
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,    54,    54,    57,    58,    59,    60,    61,    64,    67,
      70,    75,    82,    83,    86,    90,    97,   106,   113,   116,
     120,   123,   124,   130,   131,   132,   133,   134,   135,   138,
     144,   151,   157,   158,   160,   161,   162,   163,   164,   165,
     166,   167,   168,   169,   170,   171,   172,   173,   174,   175,
     176,   177,   178,   179,   180,   183,   186,   191,   195,   200,
     206,   207,   208,   209,   210,   211,   214,   218,   225,   226,
     229,   234,   235,   236,   239,   242,   243,   244,   247,   250,
     256,   261,   266,   267,   268,   269,   270,   271
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
  "STRING_LIT", "CHAR_LIT", "'}'", "'{'", "'['", "']'", "BOOL_EQ",
  "BOOL_LESS_EQ", "BOOL_GRT_EQ", "BOOL_NOT_EQ", "FIELD", "TYPEID",
  "DECLID", "TOK_FUNCTION", "TOK_RETURNVOID", "TOK_PROTOTYPE",
  "TOK_VARDECL", "TOK_ARRAY", "TOK_CALL", "TOK_NEWARRAY", "TOK_NEWSTRING",
  "TOK_BLOCK", "TOK_PARAM", "'='", "'+'", "'-'", "'*'", "'/'", "'^'",
  "POS", "NEG", "'<'", "'>'", "'!'", "'.'", "'('", "';'", "')'", "','",
  "$accept", "start", "program", "structd", "fieldsq", "fieldec",
  "fnction", "block", "stmtseq", "statmnt", "while", "ifelse", "expr",
  "return", "alloc", "const", "call", "variabl", "exprseq", "exprhlp",
  "identsq", "isqhelp", "vardecl", "identdc", "basetype", YY_NULLPTR
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
     281,   282,   283,   284,   285,   286,   287,   288,   289,   290,
     291,   292,   293,   294,   295,   296,   297,    61,    43,    45,
      42,    47,    94,   298,   299,    60,    62,    33,    46,    40,
      59,    41,    44
};
# endif

#define YYPACT_NINF -99

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-99)))

#define YYTABLE_NINF -88

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     -99,     6,   131,   -99,   -23,     0,   -99,   -99,   -99,   -99,
     -99,   -99,   -99,     4,   -50,   -46,   396,   -99,   -99,   -99,
     442,   442,   220,   -99,   -99,   236,   442,   442,   442,   442,
     -99,   -99,   -99,   -99,   -99,   -99,   -99,   647,   -99,   -99,
     -99,   -99,   -99,   -99,   -33,    17,   -99,   -99,   177,   -12,
     442,   442,   -36,   442,   -99,   678,   -18,   -18,   -32,   -31,
      15,   -99,   293,   -99,   455,   -13,    72,    72,   -18,   519,
     442,   442,   442,   442,   442,   442,   442,   442,   442,   442,
     442,   442,   442,    44,   -99,   442,    21,   -99,    28,   -99,
      31,   486,    14,   -99,   201,   551,   583,   709,   -99,    16,
     442,   442,   -99,   -99,   -99,   -99,   754,    68,    68,    68,
      68,   795,   110,   110,   118,   118,   118,   -18,   -18,   -99,
     721,   -99,   -22,    97,    23,   -99,    24,    74,   -99,   -99,
     -99,   -99,   211,   -99,    18,   350,   350,   -99,   615,   766,
     -99,   -99,   236,   -99,   -99,   -22,   -99,   -99,   -99,   -99,
      27,    60,    79,   -99,   -99,   -99,   -99,   -99,    91,   350,
      37,   -99,   -99
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       9,     0,     0,     1,     0,    68,    60,     6,    82,    83,
      84,    85,    86,     0,     0,     0,     0,    63,    64,    65,
       0,     0,     0,    62,    61,     0,     0,     0,     0,     0,
      20,     3,     5,    28,     4,    26,    25,     0,    27,    54,
      52,    51,    53,    24,     0,     0,     7,     8,     0,     0,
       0,     0,    68,     0,    55,     0,    37,    36,    87,    86,
       0,    19,     0,    22,     0,     0,    47,    48,    38,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    23,     0,     0,    81,     0,    66,
       0,    73,     0,    71,     0,     0,     0,     0,    56,     0,
       0,     0,    18,    21,    50,    49,     0,    32,    33,    34,
      35,    39,    40,    41,    42,    43,    44,    45,    46,    70,
       0,    87,     0,     0,     0,    75,    77,     0,    74,    72,
      67,    11,     0,    13,     0,     0,     0,    57,     0,     0,
      69,    79,     0,    17,    78,     0,    76,    80,    10,    12,
       0,     0,    31,    29,    58,    59,    16,    14,     0,     0,
       0,    30,    15
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -99,   -99,   -99,   -99,   -99,   -34,   -99,   -98,   -99,    -2,
     -99,   -99,    -9,   -99,   -99,   -99,   -99,   -99,     9,    11,
     -19,   -16,   -99,    -1,   -20
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,     2,    31,   132,   133,    32,    33,    62,    63,
      35,    36,    37,    38,    39,    40,    41,    42,    92,    93,
     124,   125,    43,    65,    45
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      34,    44,    60,    46,   -87,   142,     3,    55,    49,    50,
      70,    56,    57,    51,    85,    94,    64,    66,    67,    68,
      69,    87,   150,    48,   143,   121,    86,    99,   100,     8,
       9,    10,    11,    12,    85,    52,     6,    47,    30,    91,
      83,    95,    96,   101,    97,    88,   151,   156,   119,    17,
      18,    19,    20,    21,    22,    23,    24,   127,    53,    48,
     103,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   134,   130,   120,   137,   147,    26,
      27,    91,   122,   123,   145,   126,   123,   157,    28,   158,
      29,   138,   139,    90,   159,   160,    70,   162,   149,   128,
      70,   121,   129,     0,   144,     8,     9,    10,    11,    12,
     146,     0,   134,     0,     0,     0,    76,    77,    78,    79,
      80,     0,   126,    81,    82,     0,    83,    81,    82,     0,
      83,    -2,     4,   152,   153,     5,     6,     7,    70,     8,
       9,    10,    11,    12,    13,    14,    70,    15,    16,    17,
      18,    19,    20,    21,    22,    23,    24,   161,    25,   123,
      78,    79,    80,     0,     0,    81,    82,     0,    83,     0,
      80,     0,     0,    81,    82,     0,    83,     0,     0,    26,
      27,    52,     6,     0,     0,     0,     0,     0,    28,     0,
      29,    30,     0,     0,     0,    17,    18,    19,    20,    21,
      22,    23,    24,     0,    53,   121,     0,     0,     0,     8,
       9,    10,    11,    12,     0,   121,     0,     0,     0,     8,
       9,    10,    11,    12,    58,    26,    27,   131,     8,     9,
      10,    11,    59,     0,    28,     0,    29,   148,    89,    90,
       5,     6,     0,     0,     8,     9,    10,    11,    12,     0,
      14,     0,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    61,    25,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,    27,     0,     0,     0,     0,
       0,     0,     0,    28,     0,    29,    30,     5,     6,     0,
       0,     8,     9,    10,    11,    12,     0,    14,     0,    15,
      16,    17,    18,    19,    20,    21,    22,    23,    24,   102,
      25,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    26,    27,     0,     0,     0,     0,     0,     0,     0,
      28,     0,    29,    30,     5,     6,     0,     0,     8,     9,
      10,    11,    12,     0,    14,     0,    15,    16,    17,    18,
      19,    20,    21,    22,    23,    24,     0,    25,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    26,    27,
      52,     6,     0,     0,     0,     0,     0,    28,     0,    29,
      30,     0,     0,     0,    17,    18,    19,    20,    21,    22,
      23,    24,     0,    53,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    26,    27,    52,     6,     0,     0,
       0,     0,     0,    28,     0,    29,    54,     0,     0,     0,
      17,    18,    19,    20,    21,    22,    23,    24,     0,    53,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   104,     0,    70,     0,    71,    72,    73,    74,     0,
      26,    27,     0,     0,     0,     0,     0,     0,     0,    28,
       0,    29,    75,    76,    77,    78,    79,    80,     0,     0,
      81,    82,     0,    83,    70,    84,    71,    72,    73,    74,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    75,    76,    77,    78,    79,    80,     0,
       0,    81,    82,     0,    83,     0,     0,    70,    90,    71,
      72,    73,    74,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    75,    76,    77,    78,
      79,    80,     0,     0,    81,    82,     0,    83,     0,    70,
     105,    71,    72,    73,    74,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    75,    76,
      77,    78,    79,    80,     0,     0,    81,    82,     0,    83,
       0,    70,   135,    71,    72,    73,    74,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      75,    76,    77,    78,    79,    80,     0,     0,    81,    82,
       0,    83,     0,    70,   136,    71,    72,    73,    74,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    75,    76,    77,    78,    79,    80,     0,     0,
      81,    82,     0,    83,     0,    70,   154,    71,    72,    73,
      74,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    75,    76,    77,    78,    79,    80,
       0,     0,    81,    82,     0,    83,    70,    84,    71,    72,
      73,    74,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    75,    76,    77,    78,    79,
      80,     0,     0,    81,    82,   104,    83,    70,    98,    71,
      72,    73,    74,     0,     0,     0,     0,     0,     0,    70,
       0,    71,    72,    73,    74,     0,    75,    76,    77,    78,
      79,    80,     0,     0,    81,    82,     0,    83,    75,    76,
      77,    78,    79,    80,     0,     0,    81,    82,     0,    83,
       0,   141,    70,   140,    71,    72,    73,    74,     0,     0,
       0,     0,     0,     0,    70,   155,    71,    72,    73,    74,
       0,    75,    76,    77,    78,    79,    80,     0,     0,    81,
      82,     0,    83,    75,    76,    77,    78,    79,    80,     0,
       0,    81,    82,    70,    83,    71,    72,    73,    74,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    75,    76,    77,    78,    79,    80,     0,     0,
      81,    82,     0,    83
};

static const yytype_int16 yycheck[] =
{
       2,     2,    22,    26,     4,    27,     0,    16,     4,    59,
      28,    20,    21,    59,    47,    27,    25,    26,    27,    28,
      29,     4,     4,    59,   122,     4,    59,    59,    59,     8,
       9,    10,    11,    12,    47,     4,     5,    60,    60,    48,
      58,    50,    51,    28,    53,    28,    28,   145,     4,    18,
      19,    20,    21,    22,    23,    24,    25,    29,    27,    59,
      62,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    94,    61,    85,    61,     4,    48,
      49,    90,    61,    62,    61,    86,    62,    60,    57,    29,
      59,   100,   101,    62,    15,     4,    28,    60,   132,    90,
      28,     4,    91,    -1,   123,     8,     9,    10,    11,    12,
     126,    -1,   132,    -1,    -1,    -1,    48,    49,    50,    51,
      52,    -1,   123,    55,    56,    -1,    58,    55,    56,    -1,
      58,     0,     1,   135,   136,     4,     5,     6,    28,     8,
       9,    10,    11,    12,    13,    14,    28,    16,    17,    18,
      19,    20,    21,    22,    23,    24,    25,   159,    27,    62,
      50,    51,    52,    -1,    -1,    55,    56,    -1,    58,    -1,
      52,    -1,    -1,    55,    56,    -1,    58,    -1,    -1,    48,
      49,     4,     5,    -1,    -1,    -1,    -1,    -1,    57,    -1,
      59,    60,    -1,    -1,    -1,    18,    19,    20,    21,    22,
      23,    24,    25,    -1,    27,     4,    -1,    -1,    -1,     8,
       9,    10,    11,    12,    -1,     4,    -1,    -1,    -1,     8,
       9,    10,    11,    12,     4,    48,    49,    26,     8,     9,
      10,    11,    12,    -1,    57,    -1,    59,    26,    61,    62,
       4,     5,    -1,    -1,     8,     9,    10,    11,    12,    -1,
      14,    -1,    16,    17,    18,    19,    20,    21,    22,    23,
      24,    25,    26,    27,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    48,    49,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    57,    -1,    59,    60,     4,     5,    -1,
      -1,     8,     9,    10,    11,    12,    -1,    14,    -1,    16,
      17,    18,    19,    20,    21,    22,    23,    24,    25,    26,
      27,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    48,    49,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      57,    -1,    59,    60,     4,     5,    -1,    -1,     8,     9,
      10,    11,    12,    -1,    14,    -1,    16,    17,    18,    19,
      20,    21,    22,    23,    24,    25,    -1,    27,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    48,    49,
       4,     5,    -1,    -1,    -1,    -1,    -1,    57,    -1,    59,
      60,    -1,    -1,    -1,    18,    19,    20,    21,    22,    23,
      24,    25,    -1,    27,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    48,    49,     4,     5,    -1,    -1,
      -1,    -1,    -1,    57,    -1,    59,    60,    -1,    -1,    -1,
      18,    19,    20,    21,    22,    23,    24,    25,    -1,    27,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    26,    -1,    28,    -1,    30,    31,    32,    33,    -1,
      48,    49,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    57,
      -1,    59,    47,    48,    49,    50,    51,    52,    -1,    -1,
      55,    56,    -1,    58,    28,    60,    30,    31,    32,    33,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    47,    48,    49,    50,    51,    52,    -1,
      -1,    55,    56,    -1,    58,    -1,    -1,    28,    62,    30,
      31,    32,    33,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    47,    48,    49,    50,
      51,    52,    -1,    -1,    55,    56,    -1,    58,    -1,    28,
      61,    30,    31,    32,    33,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    47,    48,
      49,    50,    51,    52,    -1,    -1,    55,    56,    -1,    58,
      -1,    28,    61,    30,    31,    32,    33,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      47,    48,    49,    50,    51,    52,    -1,    -1,    55,    56,
      -1,    58,    -1,    28,    61,    30,    31,    32,    33,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    47,    48,    49,    50,    51,    52,    -1,    -1,
      55,    56,    -1,    58,    -1,    28,    61,    30,    31,    32,
      33,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    47,    48,    49,    50,    51,    52,
      -1,    -1,    55,    56,    -1,    58,    28,    60,    30,    31,
      32,    33,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    47,    48,    49,    50,    51,
      52,    -1,    -1,    55,    56,    26,    58,    28,    60,    30,
      31,    32,    33,    -1,    -1,    -1,    -1,    -1,    -1,    28,
      -1,    30,    31,    32,    33,    -1,    47,    48,    49,    50,
      51,    52,    -1,    -1,    55,    56,    -1,    58,    47,    48,
      49,    50,    51,    52,    -1,    -1,    55,    56,    -1,    58,
      -1,    60,    28,    29,    30,    31,    32,    33,    -1,    -1,
      -1,    -1,    -1,    -1,    28,    29,    30,    31,    32,    33,
      -1,    47,    48,    49,    50,    51,    52,    -1,    -1,    55,
      56,    -1,    58,    47,    48,    49,    50,    51,    52,    -1,
      -1,    55,    56,    28,    58,    30,    31,    32,    33,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    47,    48,    49,    50,    51,    52,    -1,    -1,
      55,    56,    -1,    58
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    64,    65,     0,     1,     4,     5,     6,     8,     9,
      10,    11,    12,    13,    14,    16,    17,    18,    19,    20,
      21,    22,    23,    24,    25,    27,    48,    49,    57,    59,
      60,    66,    69,    70,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    85,    86,    87,    26,    60,    59,     4,
      59,    59,     4,    27,    60,    75,    75,    75,     4,    12,
      87,    26,    71,    72,    75,    86,    75,    75,    75,    75,
      28,    30,    31,    32,    33,    47,    48,    49,    50,    51,
      52,    55,    56,    58,    60,    47,    59,     4,    28,    61,
      62,    75,    81,    82,    27,    75,    75,    75,    60,    59,
      59,    28,    26,    72,    26,    61,    75,    75,    75,    75,
      75,    75,    75,    75,    75,    75,    75,    75,    75,     4,
      75,     4,    61,    62,    83,    84,    86,    29,    81,    82,
      61,    26,    67,    68,    87,    61,    61,    61,    75,    75,
      29,    60,    27,    70,    83,    61,    84,     4,    26,    68,
       4,    28,    72,    72,    61,    29,    70,    60,    29,    15,
       4,    72,    60
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    63,    64,    65,    65,    65,    65,    65,    65,    65,
      66,    66,    67,    67,    68,    68,    69,    69,    70,    70,
      70,    71,    71,    72,    72,    72,    72,    72,    72,    73,
      74,    74,    75,    75,    75,    75,    75,    75,    75,    75,
      75,    75,    75,    75,    75,    75,    75,    75,    75,    75,
      75,    75,    75,    75,    75,    76,    76,    77,    77,    77,
      78,    78,    78,    78,    78,    78,    79,    79,    80,    80,
      80,    81,    81,    81,    82,    83,    83,    83,    84,    85,
      86,    86,    87,    87,    87,    87,    87,    87
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     2,     2,     2,     3,     3,     0,
       5,     4,     2,     1,     3,     5,     5,     4,     3,     2,
       1,     2,     1,     2,     1,     1,     1,     1,     1,     5,
       7,     5,     3,     3,     3,     3,     2,     2,     2,     3,
       3,     3,     3,     3,     3,     3,     3,     2,     2,     3,
       3,     1,     1,     1,     1,     2,     3,     4,     5,     5,
       1,     1,     1,     1,     1,     1,     3,     4,     1,     4,
       3,     1,     2,     1,     2,     1,     2,     1,     2,     4,
       4,     2,     1,     1,     1,     1,     1,     1
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
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 920 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 4: /* TOK_IDENT  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 926 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 5: /* NUMBER  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 932 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 6: /* DIRECTIVE  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 938 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 7: /* RESERVED  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 944 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 8: /* TOK_KW_VOID  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 950 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 9: /* TOK_KW_BOOL  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 956 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 10: /* TOK_KW_CHAR  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 962 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 11: /* TOK_KW_INT  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 968 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 12: /* TOK_KW_STRING  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 974 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 13: /* TOK_KW_STRUCT  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 980 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 14: /* TOK_KW_IF  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 986 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 15: /* TOK_KW_ELSE  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 992 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 16: /* TOK_KW_WHILE  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 998 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 17: /* TOK_KW_RETURN  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1004 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 18: /* TOK_KW_FALSE  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1010 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 19: /* TOK_KW_TRUE  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1016 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 20: /* TOK_KW_NULL  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1022 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 21: /* TOK_KW_ORD  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1028 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 22: /* TOK_KW_CHR  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1034 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 23: /* TOK_KW_NEW  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1040 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 24: /* STRING_LIT  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1046 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 25: /* CHAR_LIT  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1052 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 26: /* '}'  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1058 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 27: /* '{'  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1064 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 28: /* '['  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1070 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 29: /* ']'  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1076 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 30: /* BOOL_EQ  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1082 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 31: /* BOOL_LESS_EQ  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1088 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 32: /* BOOL_GRT_EQ  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1094 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 33: /* BOOL_NOT_EQ  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1100 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 34: /* FIELD  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1106 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 35: /* TYPEID  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1112 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 36: /* DECLID  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1118 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 37: /* TOK_FUNCTION  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1124 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 38: /* TOK_RETURNVOID  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1130 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 39: /* TOK_PROTOTYPE  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1136 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 40: /* TOK_VARDECL  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1142 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 41: /* TOK_ARRAY  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1148 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 42: /* TOK_CALL  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1154 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 43: /* TOK_NEWARRAY  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1160 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 44: /* TOK_NEWSTRING  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1166 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 45: /* TOK_BLOCK  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1172 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 46: /* TOK_PARAM  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1178 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 47: /* '='  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1184 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 48: /* '+'  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1190 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 49: /* '-'  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1196 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 50: /* '*'  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1202 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 51: /* '/'  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1208 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 52: /* '^'  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1214 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 53: /* POS  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1220 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 54: /* NEG  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1226 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 55: /* '<'  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1232 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 56: /* '>'  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1238 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 57: /* '!'  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1244 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 58: /* '.'  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1250 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 59: /* '('  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1256 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 60: /* ';'  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1262 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 61: /* ')'  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1268 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 62: /* ','  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1274 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 64: /* start  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1280 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 65: /* program  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1286 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 66: /* structd  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1292 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 67: /* fieldsq  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1298 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 68: /* fieldec  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1304 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 69: /* fnction  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1310 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 70: /* block  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1316 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 71: /* stmtseq  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1322 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 72: /* statmnt  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1328 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 73: /* while  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1334 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 74: /* ifelse  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1340 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 75: /* expr  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1346 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 76: /* return  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1352 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 77: /* alloc  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1358 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 78: /* const  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1364 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 79: /* call  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1370 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 80: /* variabl  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1376 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 81: /* exprseq  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1382 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 82: /* exprhlp  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1388 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 83: /* identsq  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1394 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 84: /* isqhelp  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1400 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 85: /* vardecl  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1406 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 86: /* identdc  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1412 "yyparse.cpp" /* yacc.c:684  */
        break;

    case 87: /* basetype  */
#line 21 "parser.y" /* yacc.c:684  */
      { astree::dump (yyoutput, ((*yyvaluep))); }
#line 1418 "yyparse.cpp" /* yacc.c:684  */
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
  YYUSE (yytype);
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
#line 23 "parser.y" /* yacc.c:1429  */
{
   parser::root = new astree (ROOT, {0, 0, 0}, "<<ROOT>>");
}

#line 1843 "yyparse.cpp" /* yacc.c:1429  */
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
#line 54 "parser.y" /* yacc.c:1646  */
    { (yyval) = parser::root = (yyvsp[0]); }
#line 2025 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 3:
#line 57 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyval)->adopt ((yyvsp[0])); (void) (yyvsp[-1]); }
#line 2031 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 4:
#line 58 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyval)->adopt ((yyvsp[0])); (void) (yyvsp[-1]); }
#line 2037 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 5:
#line 59 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyval)->adopt ((yyvsp[0])); (void) (yyvsp[-1]); }
#line 2043 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 6:
#line 60 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0])); (void) (yyvsp[-1]); (yyval) = (yyval); }
#line 2049 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 7:
#line 61 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0])); (void) (yyvsp[-2]); (void) (yyvsp[-1]); 
                                  (yyval) = (yyval); 
                                }
#line 2057 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 8:
#line 64 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0])); (void) (yyvsp[-2]); (void) (yyvsp[-1]); 
                                  (yyval) = (yyval); 
                                }
#line 2065 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 9:
#line 67 "parser.y" /* yacc.c:1646  */
    { (yyval) = parser::root; }
#line 2071 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 10:
#line 71 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[0]));
                                  (yyvsp[-3])->change_sym (TYPEID);
                                  (yyval) = (yyvsp[-4])->adopt ((yyvsp[-3]), (yyvsp[-1])); 
                                }
#line 2080 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 11:
#line 76 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-1]), (yyvsp[0]));
                                  (yyvsp[-2])->change_sym (TYPEID); 
                                  (yyval) = (yyvsp[-3])->adopt ((yyvsp[-2])); 
                                }
#line 2089 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 12:
#line 82 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyval)->adopt ((yyvsp[0])); (void) (yyvsp[-1]); }
#line 2095 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 13:
#line 83 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2101 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 14:
#line 87 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-2])->adopt_sym ((yyvsp[-1]), FIELD); 
                                 destroy ((yyvsp[0]));
                                }
#line 2109 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 15:
#line 91 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-4])->adopt_sym ((yyvsp[-1]), FIELD); 
                                  destroy ((yyvsp[-3]), (yyvsp[-2])); 
                                  destroy ((yyvsp[0]));
                                }
#line 2118 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 16:
#line 98 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-1]));
                                  (yyval) = new astree (TOK_FUNCTION, lexer::lloc,
                                                   "");
                                  (yyvsp[-3])->change_sym (TOK_PARAM);
                                  (yyvsp[-3])->adopt ((yyvsp[-2]));
                                  (yyval)->adopt ((yyvsp[-4]), (yyvsp[-3]));
                                  (yyval)->adopt ((yyvsp[0]));
                                }
#line 2131 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 17:
#line 106 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[-1])); 
                                  (yyval) = new astree (TOK_FUNCTION, lexer::lloc, 
                                                   "");
                                  (yyval)->adopt ((yyvsp[-3]), (yyvsp[0]));
                                }
#line 2141 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 18:
#line 113 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[0])); 
                                  (yyval) = (yyvsp[-1]);
                                }
#line 2149 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 19:
#line 116 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0])); 
                                  (yyvsp[-1])->change_sym (TOK_BLOCK);
                                  (yyval) = (yyvsp[-1]);
                                }
#line 2158 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 20:
#line 120 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0])); (yyval) = nullptr; }
#line 2164 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 21:
#line 123 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyval)->adopt ((yyvsp[0])); (void) (yyvsp[-1]); }
#line 2170 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 22:
#line 124 "parser.y" /* yacc.c:1646  */
    { (yyval) = new astree (TOK_BLOCK, 
                                                   lexer::lloc, "{"); 
                                  (yyval)->adopt ((yyvsp[0]));
                                }
#line 2179 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 23:
#line 130 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0])); (yyval) = (yyvsp[-1]); }
#line 2185 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 24:
#line 131 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2191 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 25:
#line 132 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2197 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 26:
#line 133 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2203 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 27:
#line 134 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2209 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 28:
#line 135 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2215 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 29:
#line 139 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-3]), (yyvsp[-1])); 
                                  (yyval) = (yyvsp[-4])->adopt ((yyvsp[-2]), (yyvsp[0])); 
                                }
#line 2223 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 30:
#line 145 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-5]), (yyvsp[-3])); 
                                  (yyvsp[-6])->adopt ((yyvsp[-4]), (yyvsp[-2]));
                                  (yyvsp[-1])->adopt ((yyvsp[0]));
                                  (yyvsp[-6])->adopt ((yyvsp[-1]));
                                  (yyval) = (yyvsp[-6]);
                                }
#line 2234 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 31:
#line 152 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-3]), (yyvsp[-1]));
                                  (yyval) = (yyvsp[-4])->adopt ((yyvsp[-2]), (yyvsp[0])); 
                                }
#line 2242 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 32:
#line 157 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2248 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 33:
#line 159 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2254 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 34:
#line 160 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2260 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 35:
#line 161 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2266 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 36:
#line 162 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[0]));     }
#line 2272 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 37:
#line 163 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[0]));     }
#line 2278 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 38:
#line 164 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[0]));     }
#line 2284 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 39:
#line 165 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2290 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 40:
#line 166 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2296 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 41:
#line 167 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2302 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 42:
#line 168 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2308 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 43:
#line 169 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2314 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 44:
#line 170 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2320 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 45:
#line 171 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2326 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 46:
#line 172 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[-2]), (yyvsp[0])); }
#line 2332 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 47:
#line 173 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt_sym ((yyvsp[0]), POS); }
#line 2338 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 48:
#line 174 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt_sym ((yyvsp[0]), NEG); }
#line 2344 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 49:
#line 175 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[0])); (yyval) = (yyvsp[-1]); }
#line 2350 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 50:
#line 176 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[0])); (yyval) = (yyvsp[-1]); }
#line 2356 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 51:
#line 177 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2362 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 52:
#line 178 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2368 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 53:
#line 179 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2374 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 54:
#line 180 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2380 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 55:
#line 183 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0])); 
                                  (yyval)->adopt_sym ((yyvsp[-1]), TOK_RETURNVOID); 
                                }
#line 2388 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 56:
#line 187 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0])); (yyval) = (yyvsp[-2])->adopt ((yyvsp[-1])); }
#line 2394 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 57:
#line 192 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-1]), (yyvsp[0]));
                                  (yyval) = (yyvsp[-3])->adopt_sym ((yyvsp[-2]), TYPEID); 
                                }
#line 2402 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 58:
#line 196 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[0]));
                                  (yyvsp[-3])->change_sym (TOK_NEWSTRING);
                                  (yyval) = (yyvsp[-4])->adopt ((yyvsp[-3]), (yyvsp[-1])); 
                                }
#line 2411 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 59:
#line 201 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[0]));
                                  (yyval) = (yyvsp[-4])->adopt ((yyvsp[-3]), (yyvsp[-1]));
                                }
#line 2419 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 60:
#line 206 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2425 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 61:
#line 207 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2431 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 62:
#line 208 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2437 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 63:
#line 209 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2443 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 64:
#line 210 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2449 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 65:
#line 211 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2455 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 66:
#line 214 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0]));
                                  (yyval) = (yyvsp[-1])->change_sym (TOK_CALL); 
                                  (yyval)->adopt ((yyvsp[-2]));
                                }
#line 2464 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 67:
#line 219 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0]));
                                  (yyval) = (yyvsp[-2])->change_sym (TOK_CALL);
                                  (yyval)->adopt ((yyvsp[-3]), (yyvsp[-1]));
                                }
#line 2473 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 68:
#line 225 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2479 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 69:
#line 226 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[0]));
                                  (yyval) = (yyvsp[-3])->adopt_sym ((yyvsp[-1]), TOK_ARRAY); 
                                }
#line 2487 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 70:
#line 229 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-1]));
                                  (yyval) = (yyvsp[-2])->adopt_sym ((yyvsp[0]), FIELD); 
                                }
#line 2495 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 71:
#line 234 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2501 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 72:
#line 235 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyval)->adopt ((yyvsp[0])); (void) (yyvsp[-1]); }
#line 2507 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 73:
#line 236 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2513 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 74:
#line 239 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-1])); (yyval) = (yyvsp[0]); }
#line 2519 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 75:
#line 242 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2525 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 76:
#line 243 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[-1])->adopt ((yyvsp[0])); }
#line 2531 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 77:
#line 244 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2537 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 78:
#line 247 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-1])); (yyval) = (yyvsp[0]); }
#line 2543 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 79:
#line 250 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[0])); 
                                  (yyvsp[-2])->change_sym (TOK_VARDECL);
                                  (yyval) = (yyvsp[-2])->adopt ((yyvsp[-3]), (yyvsp[-1])); 
                                }
#line 2552 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 80:
#line 257 "parser.y" /* yacc.c:1646  */
    { destroy ((yyvsp[-2]), (yyvsp[-1]));
                                  (yyvsp[0])->change_sym (DECLID);
                                  (yyval) = (yyvsp[-3])->adopt ((yyvsp[0]));
                                }
#line 2561 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 81:
#line 261 "parser.y" /* yacc.c:1646  */
    { (yyvsp[0])->change_sym (DECLID);
                                  (yyval) = (yyvsp[-1])->adopt ((yyvsp[0]));
                                }
#line 2569 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 82:
#line 266 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2575 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 83:
#line 267 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2581 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 84:
#line 268 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2587 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 85:
#line 269 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2593 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 86:
#line 270 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0]); }
#line 2599 "yyparse.cpp" /* yacc.c:1646  */
    break;

  case 87:
#line 271 "parser.y" /* yacc.c:1646  */
    { (yyval) = (yyvsp[0])->change_sym (TYPEID); }
#line 2605 "yyparse.cpp" /* yacc.c:1646  */
    break;


#line 2609 "yyparse.cpp" /* yacc.c:1646  */
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
#line 274 "parser.y" /* yacc.c:1906  */


const char* parser::get_tname (int symbol) {
   return yytname [YYTRANSLATE (symbol)];
}
