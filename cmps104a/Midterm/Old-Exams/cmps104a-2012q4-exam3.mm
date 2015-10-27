.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-104A "Compiler Design I" Fall\~2012 Final\~Exam
.RCS "$Id: cmps104a-2012q4-exam3.mm,v 1.50 2012-11-30 13:45:38-08 - - $"
.DS
.PS
examboxes(5)
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
.ds-nt automaton automaton \
\[*a]\[*u]\*[+>]\[*t]\[*o]\*[+']\[*m]\[*a]\[*t]\[*o]\[*n]
.ALX 1 . 4
.LI
Write code for the function
.V= malloc .
Assume that there is a single contiguous free area bounded by 
.V= firstfree
and
.V= end .
Call a garbage collector if space is unavailable.
Do not code the gc.
Always return a chunk of memory which is a multiple of 16 bytes
aligned on a 16-byte boundary.
.SCORE-HERE 4
.SP 2i
.LI
Given the grammar presented here,
and using the style from the LALR(1) handout\(::
.SCORE-HERE 6
.ALX 1 () "" 0
.GKLI
Construct the characteristic finite state machine (CFSM), 
sets of items and transition diagram, showing shifts, reductions,
and acceptance.
.GKLI
Is the grammar LR(0)\(??
.LE
.DS
.TS
tab(|); |r2 l1fB l1fB lfB |.
_
0.|S|\[->]|\[Do] A \[Do]
1.|A|\[->]|( B )
2.|A|\[->]|x
3.|B|\[->]|B A
4.|B|\[->]|
_
.TE
.DE
.SP 10i 
.LI
Given the
.V= oc
program presented here\(::
.ALX 1 () "" 0
.GKLI
Draw the abstract syntax tree.
.SCORE-HERE 3
.GKLI
Show the contents of the symbol table, with attributes.
.SCORE-HERE 3
.GKLI
Show the generated
.V= oil
program.
.SCORE-HERE 4
.LE
Note that there is no header file included in this program.
.DS
.TS
box; lfCB.
void puti (int i);
int i = 1;
int x = 0;
while (i <= 10) {
   x = x * 10 + i * i;
}
puti (x);
.TE
.DE
.SP 10i
.LI
Write a scanner and a parser using
.V= flex
and
.V= bison
for a Lisp-like language, as described here.
Clearly identify which of your code belongs in 
.V= scanner.l
and which belongs in
.V= parser.y .
Don't create tokens or assemble an abstract syntax tree.
Semantic actions in the scanner will consist only of
.V= return
statements when necessary.
.SCORE-HERE 10
.ALX 1 () "" 0
.GKLI
A number is a sequence of one or more decimal digits.
.br
Example\(::
.V= 12345
.GKLI
A string is a sequence of zero or more characters,
other than a double quote
.=V ( \[Dq] )
preceded and followed by double quotes.
.br
Example\(::
.V= \[Dq]foobar\[Dq]
.GKLI
An identifier is any sequence of one or more
letters, digits, and underscores,
unless it matches a number.
.br
Example\(::
.V= 123foo_bar
.GKLI
An operator is any character from the set
.V= \0+ 
.V= \0- 
.V= \0* 
.V= \0/ 
.V= \0= 
.V= \0< 
.V= \0> 
.GKLI
White space consists of spaces, tabs, and newlines.
.GKLI
Comments are Java-style, starting with a double slash
.=V ( // )
followed by all characters up to but not including the trailing newline.
.GKLI
Any other character is invalid.
.GKLI
A program is a sequence of zero or more elements.
.GKLI
An element is an atom or a list.
.GKLI
An atom is a number, a string, an identifier, or an operator.
.GKLI
A list is a left parenthesis, followed by zero or more elements,
followed by a right parenthesis.
.LE
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
Which statement is true about these languages\(??
.CHOOSE 
$ LR ( 0 ) subset LALR ( 1 ) subset SLR ( 1 ) subset LR ( 1 )  $
.CHOOSE 
$ LR ( 0 ) subset LR ( 1 ) subset SLR ( 1 ) subset LALR ( 1 )  $
.CHOOSE 
$ LR ( 0 ) subset SLR ( 1 ) subset LALR ( 1 ) subset LR ( 1 )  $
.CHOOSE 
$ LR ( 1 ) subset LALR ( 1 ) subset SLR ( 1 ) subset LR ( 0 )  $
.CHOOSE-END
.CHOOSE-BEGIN
For a grammar
$ G = \[la] V sub N , V sub T , P , S \[ra] $,
used to construct an $ roman LR ( k ) $ parse table
with $n$ states,
what is the size of the parse table\(??
.CHOOSE
$ n times { left | V sub N right | } sup k $
.CHOOSE
$ n times { left | V sub T right | } sup k $
.CHOOSE
$ n times { left | P right | } sup k $
.CHOOSE
$ n times { left | S right | } sup k $
.CHOOSE-END
.CHOOSE-BEGIN
If
.V= malloc (3)
and
.V= free (3)
use the boundary tag method to manage storage,
what is likely the size of a single boundary tag\(??
.CHOOSE4V 8\~*\~sizeof\~(char) 2\~*\~sizeof\~(int) \
2\~*\~sizeof\~(struct\~node) 2\~*\~sizeof\~(void\~*)
.CHOOSE-END
.CHOOSE-BEGIN
To solve a shift/reduce conflict,
we should shift if the precedence of the rule is [x] than
the precedence of the lookahead symbol,
or if the precedences are the same but they are [y] associative.
.CHOOSE4 "[x] = higher, [y] = left" "[x] = higher, [y] = right" \
"[x] = lower, [y] = left" "[x] = lower, [y] = right"
.CHOOSE-END
.de grammar
.   nr grammar.indent \\$1
.   shift
.   while \\n[.$]>0 \{.\"
.      BR "\h'\\n[grammar.indent]n'\\$1"
.      br
.      shift
.   \}
..
.CHOOSE-BEGIN
Which of the following grammars is unambiguous,
recognizes an arbitrarily large number of symbols,
but uses only $ O ( 1 ) $ stack space\(??
.CHOOSE
.grammar 0 "A \[->] A A" "A \[->] x"
.CHOOSE
.grammar 0 "A \[->] A x" "A \[->] x"
.CHOOSE
.grammar 0 "A \[->] x A" "A \[->] x"
.CHOOSE
.grammar 0 "A \[->] x x" "A \[->] x"
.CHOOSE-END
.CHOOSE-BEGIN
For a grammar
$ G = \[la] V sub N , V sub T , P , S \[ra] $\(::
.CHOOSE
$ P elem V sub N $
.CHOOSE
$ P elem V sub T $
.CHOOSE
$ S elem V sub N $
.CHOOSE
$ S elem V sub T $
.CHOOSE-END
.CHOOSE-BEGIN
Given the C global static variable declaration
.VTCODE* 1 "int a[10];"
which is an 
.E= lvalue \(??
.CHOOSE4V **a a a+2 a[2]
.CHOOSE-END
.CHOOSE-BEGIN
What is permitted in an NFA but not a DFA\(??
.CHOOSE4 epsilon\~transitions input\~alphabet nonterminal\~symbols \
undeclared\~identifiers
.CHOOSE-END
.CHOOSE-BEGIN
Given the following grammar,
assuming appropriate declarations in section 1 of a
.V= bison
grammar,
which should fill in the blank to ensure proper (i.e. C or Java)
parsing\(??
.VTCODE* 0 "stmt : IF '(' expr ')' stmt ELSE stmt"
.VTCODE* 0 "     | IF '(' expr ')' stmt \l'.5i'"
.VTCODE* 0 "     | other"
.VTCODE* 0 "     ;"
.CHOOSE4V %left\~ELSE %prec\~ELSE %right\~ELSE %token\~ELSE
.CHOOSE-END
.CHOOSE-BEGIN
What might be an address returned by a successful call to
.V= malloc
when run in the lab if printed with
.V= %p
format\(??
.CHOOSE4V 0x0 0x1206010 0x1234567 0xdefghij
.CHOOSE-END
.CHOOSE-BEGIN
.hw la-by-rinth
The name
.V= bison
is a pun on an earlier program whose name is a homonym for\(:: 
.CHOOSE 
Buffalo\(::
a kind of African stag or gazelle.
.CHOOSE 
Camel\(::
a ruminant used for carrying burdens and for riding. 
.CHOOSE 
Minotaur\(::
a mythical monster in the labyrinth on Crete.
.CHOOSE 
Yak\(:: 
a bovine mammal native to the high plains of central Asia. 
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
A large number of allocated and unallocated
chunks of memory randomly intermixed is called\(::
.CHOOSE4 fragmentation memory\~leak storage\~regeneration thrashing
.CHOOSE-END
.CHOOSE-BEGIN
A method of garbage collection that results in all reachable
objects being compacted into as few pages as possible is\(::
.CHOOSE4 copying\~with\~semispaces incremental\~parallel\~threads \
mark\~and\~sweep reference\~counting
.CHOOSE-END
.CHOOSE-BEGIN
The weakest form of grammar that can detect matching parentheses is\(::
.CHOOSE4 context\~free context\~sensitive regular \
unrestricted\~rewriting
.CHOOSE-END
.CHOOSE-BEGIN
What system call can extend the data segment in order to
increase the size of the heap\(??
.CHOOSE4V brk execve fork malloc 
.CHOOSE-END
.CHOOSE-BEGIN
In a language allowing nested functions,
what will allow an inner function to access the local data
of an outer function\(??
.CHOOSE4 dynamic\~link return\~link stack\~pointer static\~link
.CHOOSE-END
.CHOOSE-BEGIN
Which grammar will recognize
any number of left parentheses followed
by any number of right parentheses,
provided that there are the same number of each,
and will fail to recognize anything else\(??
.CHOOSE
.grammar 0 "B \[->] ( ) B" "B \[->]"
.CHOOSE
.grammar 0 "B \[->] ( B ) B" "B \[->]"
.CHOOSE
.grammar 0 "B \[->] ( B )" "B \[->]"
.CHOOSE
.grammar 0 "B \[->] ( B" "B \[->] B )" "B \[->]"
.CHOOSE-END
.CHOOSE-BEGIN
The following grammar\(::
.br
.grammar 4 "E \[->] x" "E \[->]"
.CHOOSE 
is both LR(0) and SLR(1). 
.CHOOSE 
is LR(0) but not SLR(1). 
.CHOOSE 
is neither LR(0) nor SLR(1). 
.CHOOSE 
is SLR(1) but not LR(0).
.CHOOSE-END
.CHOOSE-BEGIN
What part of a compiler will figure out if the expression
.V= "x + 3"
is a valid expression\(??
.CHOOSE
lexical analyzer
.CHOOSE
parser
.CHOOSE
symbol table manager
.CHOOSE
type checker
.CHOOSE-END
.CHOOSE-BEGIN
The largest class of grammars whose parse tables are the same
size as an LR(0) parse table is\(::
.CHOOSE4 LR(0) SLR(1) LALR(1) LR(1)
.CHOOSE-END
.CHOOSE-BEGIN
The largest possible Unicode character,
according to the current definition is\(::
.CHOOSE4V \0\0\0\0\0\00x7F \0\0\0\0\0\00xFF \0\00x10FFFF 0xFFFFFFFF
.CHOOSE-END
.CHOOSE-BEGIN
The \l'\w'Dragon'u'book discusses compilers.
.CHOOSE4 Camel D\[ae]mon Dragon Penguin
.CHOOSE-END
.LE
.FINISH
