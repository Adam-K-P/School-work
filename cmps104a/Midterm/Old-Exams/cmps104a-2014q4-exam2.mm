.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-104A "Compiler Design I" Fall\~2014 Test\~#2
.RCS "$Id: cmps104a-2014q4-exam2.mm,v 1.31 2014-11-20 12:00:29-08 - - $"
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
.ds-nt automaton automaton \
\[*a]\[*u]\*[+>]\[*t]\[*o]\*[+']\[*m]\[*a]\[*t]\[*o]\[*n]
.ALX 1 . 4
.LI
Write a grammar in 
.V= bison
which will recognize an input stream of balanced parentheses.
The only input tokens are the left parenthesis and the right
parenthesis.
Each left must match a corresponding right somewhere to the right of it.
Explained another way,
if you count parentheses from left to right where a left counts $+1$
and a right counts $-1$,
the count may never go negative, and must be 0 in the end.
The example at the left shows examples of balanced parentheses.
.SCORE-HERE 1
.DS
.TS
box; lfCB.
((((()))))
()(())()()
(((()()())))
((())(())())
.TE
.DE
.LI
Write an unambiguous grammar using
.V= bison
where an expression is a sequence of one or more terms connected by
at sign
.=V ( @ )
operators.
A term is a sequence of one or more tokens connected by percent
.=V ( % )
operators.
A token is either an identifier or a number.
Both operators are right associative.
Do not show semantic actions.
.SCORE-HERE 3
.SP 1.5i
.LI
Given the grammar presented here,
and using the style of the handout,
use LR(0) analysis to
construct the characteristic finite state machine (CSFM),
sets of items and transition diagram,
showing shifts, reductions, and acceptance.
.SCORE-HERE 6
.DS
.TS
tab(|); |r2 l1fCB l1fCB lfCB |.
_
0.|S|\[->]|\[Do] E \[Do]
1.|E|\[->]|( L )
2.|E|\[->]|t
3.|L|\[->]|L E
4.|L|\[->]|
_
.TE
.DE
.SP 10i
.LI
Define a grammar using
.V= bison
for a language described as follows.
.SCORE-HERE 4
.ALX a () "" 0
.LI
A program consists of zero or more statements,
each terminated with a semi-colon.
.LI
A statement is a function call.
.LI
A function call is an identifier, followed by a left
parenthesis, followed by zero or more arguments separated by
commas, followed by a right parenthesis.
.LI
An argument is a function call,
an identifier,
or a number.
.LE
.SP 3i
.LI
Using Thompson's construction exactly,
without optimization or minimization,
draw the non-deterministic finite state machine
given by the following 
.V= flex
regular expression.
.SCORE-HERE 2
.DS
.TS
allbox; lfCB.
ab*|cd
.TE
.DE
.SP 1i
.LI
There are two kinds of things permitted in an NFA
that are prohibited in a DFA.
What are they?
For each,
draw a very small NFA that illustrates it.
.SCORE-HERE 2
.SP 1.5i
.LI
Draw the abstract syntax tree as per the project 3 specifications
for the following code.
.SCORE-HERE 2
.DS
.TS
box; lfCB.
if (a < b) c = f (x, y);
      else y = m * x + b;
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
.nr MULTCHOICE_MAX 12
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
The variable that communicates semantic information from 
.V= yylex()
to
.V= yyparse()
is\(::
.CHOOSE4V yydebug yyleng yylval yytext
.CHOOSE-END
.CHOOSE-BEGIN
Which is an example of an imput recognized by the following grammar\(??
.br
$ A -> x A y $
.br
$ A -> $
.CHOOSE4 $xxxxxxxxxy$ $xxxxxyyyyy$ $xyxyxyxyxy$ $xyyyyyyyyy$
.CHOOSE-END
.CHOOSE-BEGIN
If an NFA is constructed from a regex $r$ and is used to scan a
string $s$,
then its memory requirement $M$ and running time $T$ are\(:: 
.CHOOSE 
$ M = O ( 2 sup { left | r right | } ) ~ ; ~ ~ 
T = O ( left | s right | ) $
.CHOOSE 
$ M = O ( left | r right | ) ~ ; ~ ~ 
T = O ( left | r right | times left | s right | ) $
.CHOOSE 
$ M = O ( left | r right | times left | s right | ) ~ ; ~ ~ 
T = O ( left | r right | ) $
.CHOOSE 
$ M = O ( left | s right | ) ~ ; ~ ~ 
T = O ( 2 sup { left | r right | } ) $ 
.CHOOSE-END
.CHOOSE-BEGIN
For unambiguous grammars, what kind of analysis is performed by 
.V= bison \(??
.CHOOSE4 LALR(1) LL($k$) LR(0) recursive\~descent
.CHOOSE-END
.CHOOSE-BEGIN
Which rule shows that
.V= =
is a right-associative operator\(??
.CHOOSE
$ E -> E = E $
.CHOOSE
$ E -> E = T $
.CHOOSE
$ E -> T = E $
.CHOOSE
$ E = E -> E $
.CHOOSE-END
.CHOOSE-BEGIN
What parsing action pops some number of elements
(equal to the length of the right-hand side of a rule)
off the parsing stack and then pushes a non-terminal onto the stack\(??
.CHOOSE4 accept reduce scan shift
.CHOOSE-END
.CHOOSE-BEGIN
If a regular expression $r$ of length $ | r | $ is converted into
a deterministic automaton and then used to scan a string $s$ of
length $ | s | $,
how fast will it run\(??
.CHOOSE
$ O ( | r | ) $
.CHOOSE
$ O ( | r | times | s | ) $
.CHOOSE
$ O ( | s | ) $
.CHOOSE
$ O ( | s | + | r | ) $
.CHOOSE-END
.CHOOSE-BEGIN
To solve the problem of the dangling else with an ambiguous grammar,
.V= else
should be declared as \l'.25i'-associative and given a precedence
\l'.25i'er than the arithmetic operators.
.CHOOSE
left-associative, higher than
.CHOOSE
left-associative, lower than
.CHOOSE
right-associative, higher than
.CHOOSE
right-associative, lower than
.CHOOSE-END
.CHOOSE-BEGIN
Given the semantics of
.V= adopt2
from the provided code,
what is the appropriate action
for the rule
.VTCODE* 0 "expr : expr '+' expr"
.CHOOSE
.V= "{ \[Do]\[Do] = adopt2 (\[Do]1, \[Do]2, \[Do]3); }
.CHOOSE
.V= "{ \[Do]\[Do] = adopt2 (\[Do]1, \[Do]3, \[Do]2); }
.CHOOSE
.V= "{ \[Do]\[Do] = adopt2 (\[Do]2, \[Do]1, \[Do]3); }
.CHOOSE
.V= "{ \[Do]\[Do] = adopt2 (\[Do]3, \[Do]2, \[Do]1); }
.CHOOSE-END
.CHOOSE-BEGIN
If 
.V= command
contains the Unix command to start the preprocessor,
what will be used to allow reading its output\(??
.CHOOSE4V \
"yyin = fopen (command, \[Dq]r\[Dq]);" \
"yyin = fopen (command, \[Dq]w\[Dq]);" \
"yyin = popen (command, \[Dq]r\[Dq]);" \
"yyin = popen (command, \[Dq]w\[Dq]);"
.CHOOSE-END
.CHOOSE-BEGIN
As a semantic action embedded in
.V= yylex() ,
which is obviously wrong\(??
.CHOOSE4V "{ return '+'; }" "{ return *yytext; }" "{ return PLUS; }" \
"{ return \[Dq]+\[Dq]; }"
.CHOOSE-END
.CHOOSE-BEGIN
If a DFA is constructed from each of the following regular
expressions,
then minimized,
which will have the fewest states\(??
.CHOOSE4V x x* x+ x?
.CHOOSE-END
.LE
.FINISH
