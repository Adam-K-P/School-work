.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-104A "Compiler Design I" Fall\~2010 Test\~#2
.RCS "$Id: cmps104a-2010q4-exam2.mm,v 1.23 2010-11-09 20:06:43-08 - - $"
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
0.|S|\[->]|\[Do] A \[Do]
1.|A|\[->]|( L )
2.|A|\[->]|( )
3.|A|\[->]|x
4.|L|\[->]|L A
5.|L|\[->]|
_
.TE
.DE
.SP 10i
.LI
Define a grammar for the following language,
carefully separating the
.V= bison
grammar from the
.V= flex
grammar.
Do not show any semantic a ations.
.SCORE-HERE 5
.ALX a () "" 0
.LI
A program is a sequence of zero or more expressions.
If more than one expression, they are separated by semi-colons.
.LI
An expression is a function call,
or an identifier,
or a number.
.LI
A function call is an identifier followed by a parenthesized argument
list.
.LI
An argument list is a sequence of zero or more expressions,
separated by commas if there are more than one expression.
.LI
An identifier
is a sequence of one or more upper and lower case letters.
.LI
A number is a sequence of digits,
optionally preceded by a 
.V= +
or
.V= -
sign.
.LI
A comment is a hash
.=V ( # )
followed by any number of characters not including newline.
.LI
White space is ignored and consists of spaces, tabs, and newlines.
.LE
.DS
.TS
tab(|); |lw(180p)fCB |lw(244p)fCB |.
_
flex|bison
.SP 3i
.TE
.DE
.LI
Using the specifications of project 3,
draw abstract syntax trees for each of the following.
.SCORE-HERE 5
.DS
.TS
tab(|); lw(3i)fCB lfCB.
T{
int f (int n) { // [2 pts.]
   /* This is O(2^n). */
   if (n <= 1) return n;
   return f (n - 1)
        + f (n - 2);
}
T}|T{
int g (int n) { // [3 pts.]
   /* This is O(n). */
   int a; int b; int c;
   a = 0; b = 1;
   while (n > 0) {
      c = a + b; a = b; b = c;
   }
   return a;
}
T}
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
For a grammar
$G = \[la] V sub N , V sub T , P , S \[ra] $,
If $ roman LR ( k ) $ analysis generates $n$ states,
then the size of the parsing table will be\(::
.CHOOSE
$ n times { left | V sub N right | } sup k $
.CHOOSE
$ n times { left | V sub T right | } sup k $
.CHOOSE
$ n sup k times { left | V sub N right | } $
.CHOOSE
$ n sup k times { left | V sub T right | } $
.CHOOSE-END
.CHOOSE-BEGIN
What variable is used to pass semantic information from
.V= yylex
to 
.V= yyparse \(??
.CHOOSE4FT CB yyerror yyin yylval yytext
.CHOOSE-END
.CHOOSE-BEGIN
The part of the compiler that figures out which declaration of the
form
.V= "int x;"
is being referred to by the statment
.V= "x = 3;"
is\(::
.CHOOSE4 lexical\~analyzer parser symbol\~table\~manager code\~generator
.CHOOSE-END
.CHOOSE-BEGIN
If $N$ is the set of languages recognizable by an NFA,
and $D$ is the set of languages recognizable by a DFA,
then\(::
.CHOOSE
$ N subset D $
.CHOOSE
$ N = D $
.CHOOSE
$ N supset D $
.CHOOSE
none of the above
.CHOOSE-END
.CHOOSE-BEGIN
What is a reasonable guess as to what might be printed by\(::
.VCODE* 1 "printf ("%p\n", malloc (1));"
.CHOOSE4FT CB 0x0 0xdb9b030 0x7fff498c72d9 0xabcdefgh
.CHOOSE-END
.CHOOSE-BEGIN
In order to disambiguate the following grammar consistent
with the syntax of C, C++, and Java,
we should insert the declaration (x)
in the first part of the
.BR bison
grammar,
because we need to resolve the shift/reduce conflict in favor of a
(y).
.VTCODE* 0 "stmt : IF '(' expr ')' stmt ELSE stmt"
.VTCODE* 0 "     | IF '(' expr ')' stmt %prec ELSE"
.VTCODE* 0 "     | other"
.VTCODE* 0 "     ;"
.CHOOSE
(x) =
.V= "%left ELSE" \0\0\0\0
(y) = reduce.
.CHOOSE
(x) =
.V= "%left ELSE" \0\0\0\0
(y) = shift.
.CHOOSE
(x) =
.V= "%right ELSE" \0\0\0\0
(y) = reduce.
.CHOOSE
(x) =
.V= "%right ELSE" \0\0\0\0
(y) = shift.
.CHOOSE-END
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
Which of these items was entered into a state after having
propagated a shift transition\(??
.CHOOSE
$ E ~ \[->] ~ \[bu] ~ E + T $
.CHOOSE
$ E ~ \[->] ~ E ~ \[bu] ~ + T $
.CHOOSE
$ E ~ \[->] ~ E + ~ \[bu] ~ T $
.CHOOSE
$ E ~ \[->] ~ E + T ~ \[bu] $
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following items in a state will cause a reduction action
to be added to the state\(??
.CHOOSE
$ E ~ \[->] ~ \[bu] ~ E + T $
.CHOOSE
$ E ~ \[->] ~ E ~ \[bu] ~ + T $
.CHOOSE
$ E ~ \[->] ~ E + ~ \[bu] ~ T $
.CHOOSE
$ E ~ \[->] ~ E + T ~ \[bu] $
.CHOOSE-END
.CHOOSE-BEGIN
How many tokens in the following C code\(??
.VTCODE* 1 "/* Say hello. */"
.VTCODE* 1 "printf (\[Dq]Hello, world.\[rs]n\[Dq]);"
.CHOOSE4 3 5 7 9
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
a monster confined to the labyrinth on Crete.
.CHOOSE
Yak\(::
a bovine mammal native to the high plains of central Asia. 
.CHOOSE-END
.LE
.FINISH
