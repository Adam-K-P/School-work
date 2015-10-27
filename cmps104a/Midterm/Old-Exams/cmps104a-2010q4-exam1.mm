.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-104A "Compiler Design I" Fall\~2010 Test\~#1
.RCS "$Id: cmps104a-2010q4-exam1.mm,v 1.72 2010-10-21 16:46:31-07 - - $"
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
Draw an abstract syntax tree for each of the following C expresions.
.SCORE-HERE 3
.DS
.TS
tab(|); |cefCBw(136.3p) |cefCB |cefCB |.
_
a * b + c * d|a + b * c + d|(a + b + (c + d))
.SP 1.5i
_
.TE
.DE
.LI
What two things a permitted in an NFA that are not permitted in a
DFA\(??
State each and show a small FA as an example of each.
.SCORE-HERE 2
.SP 1.5i
.LI
Using the 
.E= minimum
possible number of states,
draw 
.E= deterministic
finite \*[automata]
for the following
.V= flex
regular expressions.
.SCORE-HERE 5
.ALX i ()
.LI
.V= xy*|cd
.SP .5i
.LI
.V= (a|b)+y+
.SP .5i
.LI
.V= ab|c*
.SP .5i
.LI
.V= ab+cd|e
.SP .5i
.LI
.V= a?b?c?
.LE
.SP 10i
.LI
The following NFA was created from Thompson's construction.
.ALX a () "" 0
.LI
What was the original regular expression\(??
You answer may contain only letters from the NFA,
and some collection of the symbols \[*e],
.V= | , 
.V= ( ,
.V= ) ,
and
.V= * .
Use as few parentheses as possible.
.SCORE-HERE 1
.LI
Fill in the table showing the \[*e]-closure foreach state.
.SCORE-HERE 2
.LI
Using the subset construction,
draw the equivalent DFA.
.E= "Do not minimize."
Draw your anwer below the NFA.
In each state of the DFA, 
write the corresponding states from the NFA.
.SCORE-HERE 2
.LI
Draw a third diagram showing a minimized DFA.
Do your scratch work elsewhere and show only the final answer.
Use any algorithm (or guesswork) that you like.
.SCORE-HERE 1
.LE
.DS
.TS
tab(|); |c |cw(2i) |ct, |c |c |^t.
_|_|T{
.RB "(a) " "Original regex\(::"
.SP
.PS 3.2i
.ft B
arrowwid=0.1
arrowht=0.2
x=movewid*1.4
xx=2*x
a2=0.7071*xx
S1: circle "1"
S2: circle "2" at S1+(xx,0)
S3: circle "3" at S2+(a2,a2)
S4: circle "4" at S3+(xx,0)
S5: circle "5" at S2+(a2,-a2)
S6: circle "6" at S5+(xx,0)
S7: circle "7" at S2+(a2+xx+a2,0)
S8: circle "8" at S7+(xx,0)
S9: circle "9" at S8+(xx,0)
circle rad circlerad*.75 at S9
arrow from S1+(-xx,0) to S1 chop
arrow "\[*e]" above from S1 to S2 chop
arrow "\[*e]" above from S2 to S3 chop
arrow "x" above from S3 to S4 chop
arrow "\[*e]" above from S4 to S7 chop
arrow "\[*e]" above from S2 to S5 chop
arrow "z" above from S5 to S6 chop
arrow "\[*e]" above from S6 to S7 chop
arrow "z" above from S7 to S8 chop
arrow "\[*e]" above from S8 to S9 chop
spline from S8.nw then to S4+(x,x) then to S3+(-x,x) then to S2.n ->
"\[*e]" at S3+(x,x*1.3)
spline from S1.se then to S5+(-x,-x) then to S6+(xx,-x) \
then to S9.sw ->
"\[*e]" at S5+(x,-x*.7)
.PE
.RB "(c) " "DFA (do not minimize)\(::"
T}
state s|(b) \[*e]-closure (s)
_|_
1
_|_
2
_|_
3
_|_
4
_|_
5
_|_
6
_|_
7
_|_
8
_|_
9|
_|_
.TE
.P
.RB "(d) " "Minimized DFA\(::"
.DE
.SP 1.5i
.LI
Using
.V= bison,
write an
.E= unambiguous
grammar defining a 
.V= thunk
to be a sequence of one or more
.V= bug
connected by operators,
either
.V= '+'
or
.V= '*' ,
both of which are right associative.
A
.V= bug
is a sequence of one or more
.V= IDENT
connected by the
.V= AND
operator, which is left associative and has a higher priority than
the others.
Do not show semantic actions.
.SCORE-HERE 2
.DS
.ft CB
%token IDENT AND
%start thunk
%%
.DE
.SP 1i
.LI
Using
.V= flex ,
define the following tokens.
Do not define, assume, or use macros.
.SCORE-HERE 2
.ALX i ()
.LI
A string which begins with either a double quote
.=V ( \[Dq] )
or a single quote
.=V ( ' )
followed by any number of characters not including newline up to
another quote mark.
The trailing quote must be the same as the opening quote,
and the bounding quotes may not appear within the string.
.SP .5i
.LI
A floating point number whose fractional part begins and ends with
a decimal digit and possibly contains an optional decimal point
.=V ( . )
within.
It is followed by an optional exponent,
which consists of the upper case letter
.V= E ,
an optional sign, and one or more decimal digits.
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
Which of the following
.V= flex
regexes will match either an
.V= a \(;;
or, alternatively, a
.V= b
followed by a 
.V= c \(??
.CHOOSE4FT CB a*bc a+bc a?bc a|bc
.CHOOSE-END
.CHOOSE-BEGIN
If a function returns a
.V= uint32_t ,
the actual possible range of values is\(::
.CHOOSE
$ - 2 sup 31 $ to $ 2 sup 31 - 1 $
.CHOOSE
$ 0 $ to $ 2 sup 32 - 1 $
.CHOOSE
$ 0 $ to $ 31 $
.CHOOSE
$ 1 $ to $ 2 sup 32 $
.CHOOSE-END
.CHOOSE-BEGIN
Putting reserved words into a
.V= flex
grammar instead of embedding them in the string table
make the DFA use\(::
.CHOOSE4 less\~CPU\~time less\~memory more\~CPU\~time more\~memory
.CHOOSE-END
.CHOOSE-BEGIN
Which one of the following
.V= flex
actions is obviously wrong\(??
.CHOOSE4FT CB "return \[Dq]=\[Dq];" "return '=';" "return *yytext;" \
"return EQ;"
.CHOOSE-END
.CHOOSE-BEGIN
Compiling following C program and then running
.V= a.out
will print what\(??
(Choose the most reasonable answer.)
.VCODE* 1 "void main () {"
.VCODE* 1 "   printf (\[Dq]%p\[rs]n\[Dq], main);"
.VCODE* 1 "}"
.CHOOSE4FT CB "0x4004f0" "Segmentation fault (core dumped)" \
"UHìHÇÆð@" "a.out: Command not found."
.CHOOSE-END
.CHOOSE-BEGIN
If the expression 
.V= (a*((b+c)+d))
retains the same meaning with parentheses removed,
that means that the operators are (a)-associative
and that 
.V= *
has a (b) precedence than
.V= + .
.CHOOSE
(a) = left, (b) = higher
.CHOOSE
(a) = left, (b) = lower
.CHOOSE
(a) = right, (b) = higher
.CHOOSE
(a) = right, (b) = lower
.CHOOSE-END
.CHOOSE-BEGIN
The
.V= flex
regex
.V= ab+|c
means the same as\(::
.CHOOSE4FT CB ((ab)+)|c (a(b+))|c (ab)(\[rs]+|c) a((b+)|c)
.CHOOSE-END
.CHOOSE-BEGIN
Which grammar is unambiguous,
matches an arbitrarily large number of terminal symbols,
and uses up the smallest amount of stack space when doing so\(??
.CHOOSE
.BR "A \[->] A A"
.br
.BR "A \[->] y"
.CHOOSE
.BR "A \[->] A x"
.br
.BR "A \[->] y"
.CHOOSE
.BR "A \[->] x A"
.br
.BR "A \[->] y"
.CHOOSE
.BR "A \[->] x x"
.br
.BR "A \[->] y"
.CHOOSE-END
.CHOOSE-BEGIN
Which grammar will accept a single
.V= y
.E= followed
by an arbitrarily large number of
.V= x s\(??
.CHOOSE
.BR "A \[->] A x"
.br
.BR "A \[->] y"
.CHOOSE
.BR "A \[->] A y"
.br
.BR "A \[->] x"
.CHOOSE
.BR "A \[->] x A"
.br
.BR "A \[->] y"
.CHOOSE
.BR "A \[->] y A"
.br
.BR "A \[->] x"
.CHOOSE-END
.CHOOSE-BEGIN
A parser uses what level of grammar in the Chomsky hierarchy\(??
.CHOOSE4 recursively\~enumerable context\~sensitive context\~free \
regular
.CHOOSE-END
.CHOOSE-BEGIN
The fact that
.V= int
is a keyword, not an identifier,
is determined by\(::
.CHOOSE4 lexical\~analyzer parser symbol\~table\~module code\~generator
.CHOOSE-END
.LE
.FINISH
