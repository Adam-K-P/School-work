.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-104A "Compiler Design I" Spring\~2015 Test\~#1
.RCS \
"$Id: cmps104a-2015q2-exam1.mm,v 1.135 2015-04-20 21:27:45-07 - - $"
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
The ETF grammar is presented here.
Rewrite it so that the
.V= +
and
.V= *
operators are both right-associative,
and also make 
.V= +
have a higher precedence than
.V= * .
.SCORE-HERE 2
.DS
E \[->] E + T
E \[->] T
T \[->] T * F
T \[->] F
F \[->] ( E )
F \[->] i
.DE
.LI
Draw abstract syntax trees (not parse trees) for each of the following
C expressions.
.SCORE-HERE 3
.DS
.TS
allbox tab(|); cw(135.8p)efCB cefCB cefCB.
a * b + c * d | ( a + b ) * c * d | a / b * c + d 
_
.SP 1.6i
.TE
.DE
.LI
Given the nondeterministic finite \*[automaton] shown here\(::
.ALX a () "" 0
.LI
Write the regular expression that was used by Thompson's construction
to create this NFA.
.SCORE-HERE 1
.SP .3i
.LI
Fill in the table of \[*e]-closures for each state.
.SCORE-HERE 2
.LI
Use the subset algorithm to construct the equivalent
.E= deterministic
finite \*[automaton].
Inside each state of the DFA,
write the numbers of the NFA states to which it corresponds.
.SCORE-HERE 2
.LE
.DS
.TS
tab(|); |c |cw(2i) | c, |c |c |ct, |c |c |^.
_|_|
state $s$|\[*e]-closure ($s$)|T{
.PS 3.3i
circlerad=.3
arrowwid=0.1
arrowht=0.2
movewid=.5
x=movewid*1.4
S2: circle "2"
S3: circle "3" at S2+(x*2,0)
S4: circle "4" at S3+(x*2,0)
S5: circle "5" at S4+(x*2,0)
S6: circle "6" at S5+(x*2,0)
S8: circle "8" at S2-(0,x*3)
S9: circle "9" at S8+(x*2,0)
S10: circle "10" at S9+(x*2,0)
S11: circle "11" at S10+(x*2,0)
S12: circle "12" at S11+(x*2,0)
arrow "\[*e]" above from S2 to S3 chop
arrow "a" above from S3 to S4 chop
arrow "\[*e]" above from S4 to S5 chop
arrow "b" above from S5 to S6 chop
arrow "\[*e]" above from S8 to S9 chop
arrow "c" above from S9 to S10 chop
arrow "\[*e]" above from S10 to S11 chop
arrow "d" above from S11 to S12 chop
spline from S4.nw to S3+(x,x) then to S3.ne ->
spline from S10.nw to S9+(x,x) then to S9.ne ->
spline from S2.se to S3+(0,-x) then to S4+(0,-x) then to S5.sw ->
spline from S8.se to S9+(0,-x) then to S10+(0,-x) then to S11.sw ->
"\[*e]" at S3+(x,x*1.1)
"\[*e]" at S9+(x,x*1.1)
"\[*e]" at S3+(x,-x*.8)
"\[*e]" at S9+(x,-x*.8)
S1: circle "1" at S2+(-x*1.322876,-x*1.5)
S7: circle "7" at S6+(x*1.322876,-x*1.5)
circle rad circlerad*.8 at S7
arrow "\[*e]" above from S1 to S2 chop
arrow "\[*e]" above from S1 to S8 chop
arrow "\[*e]" above from S6 to S7 chop
arrow "\[*e]" above from S12 to S7 chop
S0: circle invis at S1-(x*2,0)
arrow from S0 to S1 chop
.PE
T}
_|_|
\01
_|_|
\02
_|_|
\03
_|_|
\04
_|_|
\05
_|_|
\06
_|_|
\07
_|_|
\08
_|_|
\09
_|_|
10
_|_|
11
_|_|
12
_|_|
.TE
.DE
.SP 10i
.LI
Write 
.V= flex
regular expressions for each of the following descriptions of tokens.
.SCORE-HERE 3
.ALX a ()
.LI
An identifier consists of upper- and lower-case letters and digits
and underscores.
It may not being with a digit or an underscore,
nor end with an underscore.
Underscores may not appear next to each other.
.SP .4i
.LI
A string consists of a sequence of characters between either double
quotes or single quotes,
but the ending quote must be the same as the starting quote.
In between the quotes may be any characters except for newlines
and the quotes that begin and end the string.
.SP .4i
.LI
A number consists of a sequence of decimal digits with a decimal
point somewhere in between the digits, 
but the decimal point may not appear on the front or on the end.
An optional exponent may appear,
which consists of an
.V= E
or an
.V= e ,
followed optionally by a 
.V= +
or
.V= -
sign,
followed by one or more digits.
.SP .4i
.LE
.LI
For each of the following
.V= flex
regular expressions, draw a
.E= deterministic
finite \*[automaton], using as few states as possible.
.SCORE-HERE 4
.ALX a ()
.LI
.V= ab|cd*
.SP .3i
.LI
.V= a*b|c
.SP .3i
.LI
.V= a?b*c+
.SP .3i
.LI
.V= a*b*c
.SP .3i
.LE
.LI
Draw parse trees (not abstract syntax trees) for the following
expressions, given the ETF grammar at the left.
The lexical symbols are below the middle line.
Match each with a terminal symbol above the middle line and draw the
trees.
.SCORE-HERE 2
.DS
.TS
tab(|); l |cw(185p)efCB |cefCB |.
|_|_
E \[->] E + T
E \[->] T
T \[->] T * F
T \[->] F
F \[->] ( E )
F \[->] i
.SP 1.3i
|_|_
|T{
a \0\0 * \0\0 b \0\0 + \0\0 c \0\0 * \0\0 d
T}|T{
( \0\0 a \0\0 + \0\0 b \0\0 ) \0\0 * \0\0 c
T}
|_|_
.TE
.DE
.LI
A context-free grammar
$G = \[la] V sub N , V sub T , P , S \[ra] $.
If $P$ is the ETF grammar,
fill in the blanks for the other three components.
.SCORE-HERE 1
.SP 1
$ V sub N = left { "\l'1.5i'" right } , ~ ~ ~ ~
V sub T = left { "\l'1.5i'" right } , ~ ~ ~ ~ S = "\l'.5i'" $
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
Thompson's construction\(::
.CHOOSE
converts C code into assembly language.
.CHOOSE
converts a regular expression into an NFA.
.CHOOSE
converts an NFA into a DFA.
.CHOOSE
minimizes a DFA.
.CHOOSE-END
.CHOOSE-BEGIN
Given a regular expression $r$ used to construct a DFA,
and a scanned string $s$,
the worst-case size of a DFA is\(::
.CHOOSE
$ O ( 2 sup { | r | } ) $
.CHOOSE
$ O ( 2 sup { | s | } ) $
.CHOOSE
$ O ( | r | sup 2 ) $
.CHOOSE
$ O ( | r | times | s | ) $
.CHOOSE-END
.CHOOSE-BEGIN
Which pattern might match a string of zero characters\(??
.CHOOSE4V a*b* a*b+ a+b* a+b+
.CHOOSE-END
.CHOOSE-BEGIN
Which pattern will match the following string\(??
bbaaaabaaaabababa
.CHOOSE4V (ba)+ (b+a+)* (ba+)* b+a+
.CHOOSE-END
.CHOOSE-BEGIN
Given a regular expression $r$ used to construct an NFA,
and a scanned string $s$,
the speed of the scan is\(::
.CHOOSE
$ O ( 2 sup { | r | } ) $
.CHOOSE
$ O ( 2 sup { | s | } ) $
.CHOOSE
$ O ( | r | sup 2 ) $
.CHOOSE
$ O ( | r | times | s | ) $
.CHOOSE-END
.CHOOSE-BEGIN
The
.V= flex
pattern
.V= .
(dot)
is the same as
.CHOOSE4V [/n] [\[rs]n] [\[ha]/n] [\[ha]\[rs]n]
.CHOOSE-END
.CHOOSE-BEGIN
What is not possible in an NFA\(??
.CHOOSE
epsilon transitions
.CHOOSE
multiple final states
.CHOOSE
multiple initial states
.CHOOSE
multiple outgoing transitions from a given state with the same label
.CHOOSE-END
.CHOOSE-BEGIN
How many tokens in the following Java statement\(??
.VTCODE* 0 out.printf ("%d%n", n);
.CHOOSE4 \07 \09 11 13
.CHOOSE-END
.CHOOSE-BEGIN
Which is equivalent to the following regex\(??
.VTCODE* 0 a|bc*
.CHOOSE4V ((a|b)c)* (a|b)(c*) a|((bc)*) a|(b(c*))
.CHOOSE-END
.CHOOSE-BEGIN
Determining that
.V= int
is a reserved word, not an identifier,
is done by\(::
.CHOOSE4 preprocessor scanner parser magic\~numbers
.CHOOSE-END
.CHOOSE-BEGIN
The value returned by
.V= yylex
is\(::
.CHOOSE
a non-terminal symbol
.CHOOSE
a pointer to a struct token
.CHOOSE
a pointer to the lexical buffer
.CHOOSE
an integer token code
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following regexes will produce the smallest DFA
(DFA with the fewest states)\(??
.CHOOSE4V (a) a* a+ ab
.CHOOSE-END
.LE
.if dPSPIC \{
.SP .47i
.PSPIC -I -.9i jpgs/code_quality.ps 4.75i
.\}
.FINISH
