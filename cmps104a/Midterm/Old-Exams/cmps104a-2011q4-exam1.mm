.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-104A "Compiler Design I" Fall\~2011 Test\~#1
.RCS "$Id: cmps104a-2011q4-exam1.mm,v 1.19 2011-10-20 19:08:47-07 - - $"
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
Using as few states as possible,
draw 
.E= deterministic
finite \*[automata] for each of the following
.V= flex
regular expressions.
Do not show garbage states.
Draw a separate transition for each symbol.
.SCORE-HERE 5
.ALX i ()
.LI
.V= a|bc+
.SP .5i
.LI
.V= (a|b)*c*
.SP .5i
.LI
.V= a+b*c
.SP .5i
.LI
.V= x[3-5]*x
.SP .5i
.LI
.V= (a|b)+
.SP .5i
.LE
.LI
Write some
.V= flex
regular expressions as described by the following\(::
.SCORE-HERE 5
.ALX i ()
.LI
An identifier consists of one ore more upper- or lower-case letters,
digits, and underscores,
but must begin with a letter.
An underscore, if present, must be preceded and followed by a letter or
a digit.
.SP .5i
.LI
A number consists of one or more digits with an optional decimal point.
If the decimal point is present,
it must be preceded and followed by a digit.
.SP .5i
.LI
A string constant begins with a double quote mark
.=V ( \[Dq] )
and may have zero or more character denotations in between.
A character denotation is any character that is not a quote or a
newline.
.SP .5i
.LI
A comment in C or Java which begins with a double slash and continues
until end of line,
not including the newline character at the end of the line.
.SP .5i
.LI
A single pattern which recognizes one of the reserved words
.V= if ,
.V= then ,
.V= else ,
or
.V= fi .
.LE
.SP 10i
.LI
Using
.E= Thompson 's
construction,
convert the following 
.V= flex
regular expression into a
.E= nondeterministic
finite \*[automaton].
Draw it to the right of the table,
and number each one starting at 0.
Call the initial state state 0.
Then fillin the table with the \[*e]-closure of each state.
Scribble out state numbers that are not needed.
.SCORE-HERE 5
.VTCODE* 1 "abc|de*
.DS
.TS
allbox tab(|); r lw(2i).
$s$|\[*e]-closure ($s$)
0|T{
.SP 1.2v
T}
1|T{
.SP 1.2v
T}
2|T{
.SP 1.2v
T}
3|T{
.SP 1.2v
T}
4|T{
.SP 1.2v
T}
5|T{
.SP 1.2v
T}
6|T{
.SP 1.2v
T}
7|T{
.SP 1.2v
T}
8|T{
.SP 1.2v
T}
9|T{
.SP 1.2v
T}
10|T{
.SP 1.2v
T}
11|T{
.SP 1.2v
T}
.TE
.DE
.LI
Define an unambiguous grammar similar to ETF,
which contains identifiers, parentheses, and two operators.
The operator
.V= & 
is right associative and has a higher precedence than the operator 
.V= @ ,
which is also right associative.
.SCORE-HERE 2
.SP 1i
.LI
For the ETF grammar given at the left,
draw abstract syntax trees for each of the following expressions.
.SCORE-HERE 3
.DS
.TS
tab(|); l l.
T{
$ E -> E + T $
$ E -> T $
$ T -> T * F $
$ T -> F $
$ F -> ( E ) $
$ F -> i $
T}|T{
.ALX i ()
.LI
.V= a*b+c*d
.SP 1.2i
.LI
.V= a+b*c+d
.SP 1.2i
.LI
.V= a+b+c+d
.LE
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
What is the proper ordering of these functions\(??
.CHOOSE
parsing then scanning then symbol table
.CHOOSE
scanning then parsing then symbol table
.CHOOSE
scanning then symbol table then parsing
.CHOOSE
symbol table then scanning then parsing
.CHOOSE-END
.CHOOSE-BEGIN
What kind of Chomsky grammar is used to build a scanner\(??
.CHOOSE4 context-free context-sensitive regular unrestricted
.CHOOSE-END
.CHOOSE-BEGIN
What kind of Chomsky grammar is used to build a parser\(??
.CHOOSE4 context-free context-sensitive regular unrestricted
.CHOOSE-END
.CHOOSE-BEGIN
The set of languages recognizable by a DFA is \l'.25i'
the set of languages recognizable by an NFA.
.CHOOSE
a proper subset of
.CHOOSE
a proper superset of
.CHOOSE
the same as
.CHOOSE
none of the above
.CHOOSE-END
.CHOOSE-BEGIN
If a
.E= nondeterministic
finite \*[automaton] is constructed from a regular expression $r$
and used to scan a string $s$,
how much time will it take to perform the scan\(??
(The notation $ | r | $ means\(::
the length of $ r $.) 
.CHOOSE 
$ O ( 2 sup { | r | } ) $ 
.CHOOSE 
$ O ( | r | ) $ 
.CHOOSE 
$ O ( | s | ) $
.CHOOSE 
$ O ( | r | times | s | ) $ 
.CHOOSE-END
.CHOOSE-BEGIN
If a
.E= deterministic
finite \*[automaton] is constructed from a regular expression $r$
and used to scan a string $s$,
how much time will it take to perform the scan\(??
(The notation $ | r | $ means\(::
the length of $ r $.) 
.CHOOSE 
$ O ( 2 sup { | r | } ) $ 
.CHOOSE 
$ O ( | r | ) $ 
.CHOOSE 
$ O ( | s | ) $
.CHOOSE 
$ O ( | r | times | s | ) $ 
.CHOOSE-END
.CHOOSE-BEGIN
The following grammar is\(::
.br
$ A -> A + A $
.br
$ A -> A * A $
.br
$ A -> i $
.CHOOSE4 LL(1) LR(1) ambiguous regular
.CHOOSE-END
.CHOOSE-BEGIN
How long should it take to find something in a hash table
with $n$ items in it\(??
.CHOOSE
$ O ( 1 ) $
.CHOOSE
$ O ( log sub 2 n ) $
.CHOOSE
$ O ( n ) $
.CHOOSE
$ O ( n log sub 2 n ) $
.CHOOSE-END
.CHOOSE-BEGIN
What is prohibited in a
.E= deterministic
finite \*[automaton]\(??
.CHOOSE
cycles in the graph
.CHOOSE
epsilon transitions
.CHOOSE
multiple final states
.CHOOSE
all of the above
.CHOOSE-END
.CHOOSE-BEGIN
Which parsing action pops the right hand side of a rule off of
the parsing stack,
performs a semantic action,
then pushes the left hand side of the same rule onto the stack\(??
.CHOOSE4 accept reduce scan shift
.CHOOSE-END
.CHOOSE-BEGIN
The intersection of the set of ambiguous grammars with the set of
LALR(1) grammars is\(::
.CHOOSE 
a non-empty subset of the set of context free grammars.
.CHOOSE 
the empty set.
.CHOOSE 
the same as the set of context free grammars.
.CHOOSE 
the same as the set of regular grammars.
.CHOOSE-END
.LE
.FINISH
