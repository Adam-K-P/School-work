.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-104A "Compiler Design I" Fall\~2010 Final\~Exam
.RCS "$Id: cmps104a-2010q4-exam3.mm,v 1.35 2010-12-02 14:34:49-08 - - $"
.DS
.PS
examboxes(3)
.PE
.DE
.P
.ft BI
No books\(;;
No calculator\(;;
No computer\(;;
No email\(;;
No internet\(;;
No notes\(;;
No phone.
Neatness counts\(!!
Do your scratch work elsewhere and enter only your final
answer into the spaces provided.
.ft R
.EQ
delim $$
.EN
.highacc@over-def +> \[cq]
.highacc@over-def +' \[aa]
.ds-nt automata automata \
\[*a]\[*u]\*[+>]\[*t]\[*o]\*[+']\[*m]\[*a]\[*t]\[*a]
.ALX 1 . 4
.LI
Given the grammar presented here,
and using the style from the LALR(1) handout\(::
.ALX a () "" 0
.LI
Construct the characteristic finite state machine (CFSM),
sets of items and transition diagram, showing shifts, reductions,
and acceptance.
.SCORE-HERE 6
.LI
Construct the FOLLOW sets.
.SCORE-HERE 3
.LI
Answer
.E= yes
or
.E= no
to each of the following questions\(::
.SCORE-HERE 1
.P
Is the grammar LR(0)\(??
\l'1i'
\h'.25i'
Is the grammar SLR(1)\(??
\l'1i'
.LE
.DS
.TS
tab(|); |r2 l1fB l1fB lfB |.
_
0.|S|\[->]|\[Do] M \[Do]
1.|M|\[->]|{ X }
2.|X|\[->]|X A
3.|X|\[->]|
4.|A|\[->]|i x M M
5.|A|\[->]|x
_
.TE
.DE
.SP 10i
.LI
For the
.V= bison
grammar on the left, 
fill in the table on the right.
The contents of the box at the left end of each row indicates the
rule (handle) at the top of the stack,
and the symbol at the top of each column indicates the lookahead
symbol.
Write
.RB ` S '
if the appropriate action is a shift\|;
write
.RB ` R '
if the appropriate action is a reduce\|;
write
.RB ` X '
if something else should be done or if it is not possible to
determine whether or not the action should be a shift or reduce.
.SCORE-HERE 3
.DS
.TS
tab(@); l6fCB  cfCB |cew(25.35p)fCB |cefCB |cefCB |cefCB |.
T{
%left  '+' '-'
%right '*' '/'
%token NUM
%%
expr : expr '+' expr | expr '-' expr
     | expr '*' expr | expr '/' expr
     | '(' expr ')'  | NUM ;
%%
T}@@_@_@_@_
\^@@'*'@'/'@'+'@'-'
\^@_@_@_@_@_
.T&
lfCB |cfCB |cfCB |cfCB |cfCB |cfCB |.
\^@T{
.SP .3v
expr : expr '*' expr
.SP .3v
T}@
\^@_@_@_@_@_
\^@T{
.SP .3v
expr : expr '/' expr
.SP .3v
T}@
\^@_@_@_@_@_
\^@T{
.SP .3v
expr : expr '+' expr
.SP .3v
T}@
\^@_@_@_@_@_
\^@T{
.SP .3v
expr : expr '-' expr
.SP .3v
T}@
\^@_@_@_@_@_
.TE
.DE
.LI
Code (fast)
.V= malloc ,
assuming a copying collector with semispaces and one large chunk of
free memory with
.V= free
pointing at it start and
.V= end
pointing at its end.
Call the collector if needed.
.SCORE-HERE 3
.SP 2i
.LI
Write a
.V= bison
grammar for a simple language,
described here.
.SCORE-HERE 4
.ALX a () "" 0
.LI
A program is a sequence of zero or more elements.
.LI
An element is an
.V= ATOM
or a list.
.LI
A list is a left parenthesis followed by zero or more elements,
followed by a right parenthesis.
.LI
The scanner returns only one of three kinds of tokens\(::
.V= ATOM ,
.V= '(' ,
.V= ')' .
Do not code the scanner.
.LE
Use semantic actions to construct the entire program as a list,
using the function
.V= cons .
For example,
.V= "\[Do]\[Do] = cons (\[Do]1, \[Do]2)"
will take an already constructed list
.=V ( \[Do]2 )
and a new node 
.V= ( \[Do]1 )
and return the list with the new node prepended to the list.
Thus,
your rules must be right associative,
so that for any list,
the tail is constructed first.
Do not use
.V= adopt
from the project.
.SP 10i
.LI
Consider the following program.
.ALX a () "" 0
.LI
To the right of the program,
draw the abstract syntax tree as per the project specifications.
.SCORE-HERE 3
.LI
Annotate the abstract syntax tree with attributes.
Abbreviate each attribute using one letter beside each node in 
the AST\(::
.V= C  " (char)",
.V= I  " (int)",
.V= V  " (void)",
.V= *  " (pointer)",
.V= ** " (pointer to pointer)",
.V= L  " (lval)",
.V= [] " (array)",
.V= T  " (temporary)".
Ignore other attributes from the program,
and only annotate those nodes that should have attributes.
.SCORE-HERE 3
.LI
On the column of line numbers in the program,
draw a circle around each set of number that represent a
basic block.
.SCORE-HERE 1
.LI
Translate the program into icode,
putting icode into the particular box below that matches
the line numbers in the program.
.LI
.SCORE-HERE 3
.LE
.DS
.TS
tab(|); |r |lfCB |.
_
 1.|int sum (int *a,
 2.|         int n) {
 3.|   int i;
 4.|   int s;
 5.|   i = 0;
 6.|   s = 0;
 7.|   while (i < n) {
 8.|      s = s + a[i];
 9.|      i = i + 1;
10.|   }
11.|   return s;
12.|}
_
.TE
.DE
.SP 124p
.DS
.TS
tab(|); |r lw(185.5p) |r lw(185.5p) |.
_
\01.||\07.
.SP 2v
_
\02.||\08.
.SP 2v
_
\03.||\09.
.SP 2v
_
\04.||10.
.SP 2v
_
\05.||11.
.SP 2v
_
\06.||12.
.SP 2v
_
.TE
.DE
.LE
.SP 10i
.if t .2C
.\".nr Ds 0
Multiple choice.
To the
.E= left
of each question,
write the letter that indicates your answer.
Write
.E= Z
if you don't want to risk a wrong answer.
Wrong answers are worth negative points.
.nr MULTCHOICE_MAX 11
.SCORE-HERE \n[MULTCHOICE_MAX]
.P
.DS
.TS
tab(|); |l |r2w(.4i) |l1 r1 l |rw(.2i) l |.
_
number of||×|1|\&=||$= a$
correct answers
_
number of||×|\[12]|\&=||$= b$
wrong answers
_
number of|\0\0\0|×|0|\&=|0
missing answers
_
column total|\n[MULTCHOICE_MAX]|||||$= c$
$ c = max ( a - b , 0 ) $
_
.TE
.DE
.ALX 1 . 4
.CHOOSE-BEGIN
The symbol
.V= YYSTYPE
denotes objects on the \l'.25i' stack.
.CHOOSE4 lexical semantic state symbol
.CHOOSE-END
.CHOOSE-BEGIN
The lookahead symbol in 
.V= yyparse
is declared as
.CHOOSE4FT CB "int yydebug;" "int yylex;" "YYSTYPE yylval;" \
"char *yytext;"
.CHOOSE-END
.CHOOSE-BEGIN
Memory management most friendly to locality of reference is\(::
.CHOOSE
copying collector with semispaces
.CHOOSE
.V= malloc
and
.V= free
.CHOOSE
mark and sweep
.CHOOSE
reference counting
.CHOOSE-END
.CHOOSE-BEGIN
For a grammar $ G = \[la] V sub N , V sub T , P , S \[ra] $,
the gram\%mar symbols returned by the scanner
consist of elements of\(::
.CHOOSE
$ V sub N $
.CHOOSE
$ V sub T $
.CHOOSE
$ V sub N inter V sub T $
.CHOOSE
$ V sub N union V sub T $
.CHOOSE-END
.CHOOSE-BEGIN
Which 
.V= bison
grammar will recognize any number of left parentheses followed
by any number of right parentheses,
provided that there are the same number of each,
and will fail to recognize anything else\(??
.CHOOSE4FT CB "b : '(' ')' b | ;" "b : '(' b ')' b | ;" \
"b : '(' b ')' | ;" "b : '(' b | b ')' | ;"
.CHOOSE-END
.CHOOSE-BEGIN
If the following regular expressions are each converted into a DFA
with the smallest number of possibl states for each,
of the choices, which will necessarily result in the largest number of
states\(??
.CHOOSE4FT CB a|b a* ab (a)
.CHOOSE-END
.CHOOSE-BEGIN
For a grammar $ G = \[la] V sub N , V sub T , P , S \[ra] $\(::
.CHOOSE
$ S elem V sub N $
.CHOOSE
$ S elem V sub T $
.CHOOSE
$ S elem P $
.CHOOSE
$ P elem V sub N times V sub T sup * $
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following context-free grammar rules shows that
.V= +
is left associative\(??
.CHOOSE
$ E + T -> E $
.CHOOSE
$ E -> E + E $
.CHOOSE
$ E -> E + T $
.CHOOSE
$ E -> T + E $
.CHOOSE-END
.CHOOSE-BEGIN
The following grammar\(::
.VTCODE* 1 "A \[->] x A"
.VTCODE* 1 "A \[->]"
.CHOOSE
is both LR(0) and LALR(1)
.CHOOSE
is neither LR(0) nor LALR(1)
.CHOOSE
is LR(0) but not LALR(1)
.CHOOSE
is LALR(1) but not LR(0)
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following is permitted in an NFA but not a DFA\(??
.CHOOSE
a set of input symbols
.CHOOSE
epsilon transitions
.CHOOSE
nonterminal symbols
.CHOOSE
undeclared identifiers
.CHOOSE-END
.CHOOSE-BEGIN
If function 
.V= f
contains function
.V= g
nested inside of it,
what will be used inside
.V= g
to refer to the local variables of
.V= f \(??
.CHOOSE
dynamic link
.CHOOSE
static link
.CHOOSE
frame pointer
.CHOOSE
stack pointer
.CHOOSE-END
.LE
.SP 10i
.\".nr Ds 0
Multiple choice.
To the
.E= left
of each question,
write the letter that indicates your answer.
Write
.E= Z
if you don't want to risk a wrong answer.
Wrong answers are worth negative points.
.nr MULTCHOICE_MAX 11
.SCORE-HERE \n[MULTCHOICE_MAX]
.P
.DS
.TS
tab(|); |l |r2w(.4i) |l1 r1 l |rw(.2i) l |.
_
number of||×|1|\&=||$= a$
correct answers
_
number of||×|\[12]|\&=||$= b$
wrong answers
_
number of|\0\0\0|×|0|\&=|0
missing answers
_
column total|\n[MULTCHOICE_MAX]|||||$= c$
$ c = max ( a - b , 0 ) $
_
.TE
.DE
.ALX 1 . 4
.CHOOSE-BEGIN
For a grammar $ G = \[la] V sub N , V sub T , P , S \[ra] $,
the gram\%mar symbols on the parsing stack consist of elements of\(::
.CHOOSE
$ V sub N $
.CHOOSE
$ V sub T $
.CHOOSE
$ V sub N inter V sub T $
.CHOOSE
$ V sub N union V sub T $
.CHOOSE-END
.CHOOSE-BEGIN
Which kind of memory management will not work if there are
cycles in the data structure\(??
.CHOOSE
copying collector with semispaces
.CHOOSE
.V= malloc
and
.V= free
.CHOOSE
mark and sweep
.CHOOSE
reference counting
.CHOOSE-END
.CHOOSE-BEGIN
The C declaration
.V= "int a[6];"
will declare 
.V= a
as an lvalue in what context\(??
.CHOOSE
a local variable
.CHOOSE
a global variable
.CHOOSE
a parameter
.CHOOSE
a field of a structure
.CHOOSE-END
.CHOOSE-BEGIN
The
.V= flex
expression
.V= a|bc*
means\|:
.CHOOSE4FT CB (a|(bc))* (a|b)(c*) a|((bc)*) a|(b(c*))
.CHOOSE-END
.CHOOSE-BEGIN
Given the finite
.if n automaton\|:
.if t \[*a]\[*u]\[*t]\[*o]\[*m]\[*a]\[*t]\[*o]\[*n]\|:
.PS
circlerad=.08i
arrowht=circlerad
arrowwid=arrowht/2
unit=circlerad*4
finalrad=circlerad*.75
S0: circle invis; move unit
S1: circle "1"; move unit
S2: circle "2"; move unit
S3: circle "3"; move unit
S4: circle "4"; circle rad finalrad at S4
arrow from S0 to S1 chop
arrow from S1 to S2 chop "\[*e]" above
arrow from S2 to S3 chop "\[*e]" above
arrow from S3 to S4 chop "a" above
move down unit/2 from .5 between S2 and S3
Z1: circle invis "b" below
spline-> from S3.sw to Z1 then to S2.se
move up unit/2 from .5 between S2 and S3
Z2: circle invis
move up unit/2 from .5 between S3 and S4
Z3: circle invis "\[*e]" above
spline-> from S4.nw to Z3 then to Z2 then to S2.ne
.PE
.in \n[li*tind]u
.CHOOSE
$ \[*e] roman {-closure} ( 2 ) = left { 3 right } $
.CHOOSE
$ \[*e] roman {-closure} ( 2 ) = left { 1 , 2 right } $
.CHOOSE
$ \[*e] roman {-closure} ( 2 ) = left { 1 , 2 , 3 right } $
.CHOOSE
$ \[*e] roman {-closure} ( 2 ) = left { 2 , 3 right } $
.CHOOSE-END
.CHOOSE-BEGIN
A sequence of instructions where if the first one is executed,
then all of the rest of the instructions in that sequence will
also be executed (except possibly if an exception occurs) is
called\(::
.CHOOSE4 basic\~block dominator\~tree function natural\~loop
.CHOOSE-END
.CHOOSE-BEGIN
If an NFA is constructed from a regular expression whose length is
$ | r | $ and then used to scan a string whose length is $ | s | $,
the running time will be\(::
.CHOOSE
$ O ( | s | ) $
.CHOOSE
$ O ( | s | + | r | ) $
.CHOOSE
$ O ( | s | / | r | ) $
.CHOOSE
$ O ( | s | times | r | ) $
.CHOOSE-END
.CHOOSE-BEGIN
According to the standard Unix memory map,
the heap is an extension of what other segment\(??
.CHOOSE4 text data BSS stack
.CHOOSE-END
.CHOOSE-BEGIN
For the frame pointer register
.V= fp
and the stack pointer register
.V= sp ,
if
.V= N
is the size of a local stack frame,
then after saving
.V= fp ,
the following instructions will allocate the local stack frame\(::
.CHOOSE4FT CB "*sp++ -= N; fp = sp;" "fp = *sp++; fp -= N;" \
"fp = sp; sp -= N;" "sp = fp; sp += N;"
.CHOOSE-END
.CHOOSE-BEGIN
The object-oriented function call in C++ coded as
.V= a->f(x,y)
will be translated into machine code equivalent to which
C expression\(::
.CHOOSE4FT CB "(a->f) (x, y)" "(a->f) (a, x, y)" \
"(a->classtable->f) (x, y)" "(a->classtable->f) (a, x, y)" 
.CHOOSE-END
.CHOOSE-BEGIN
In an expression tree\(::
.CHOOSE
operators are children of their operands
.CHOOSE
operators are leaf nodes
.CHOOSE
operators are parents of their operands
.CHOOSE
operators are root nodes
.CHOOSE-END
.LE
.FINISH
