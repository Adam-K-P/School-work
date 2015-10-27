.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-104A "Compiler Design I" Fall\~2014 Test\~#1
.RCS "$Id: cmps104a-2014q4-exam1.mm,v 1.78 2014-10-21 17:30:16-07 - - $"
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
Using the precedence and associativity of C,
draw abstract syntax trees for each of the following.
.SCORE-HERE 3
.DS
.TS
tab(|); |cw(136p)efCB |cefCB |cefCB |.
_
a + b * c / d|a + b / c + d|a * b + c * d
.SP 1.5i
_
.TE
.DE
.LI
Using as
.E= few
states as possible,
draw deterministic finite \*[automata]
for each of the following
.V= flex
regular expressions.
Do not show garbage states.
.SCORE-HERE 5
.ALX i ()
.LI
.V= ab*c+
.SP .5i
.LI
.V= x*abb
.SP .5i
.LI
.V= abc|d+
.SP .5i
.LI
.V= a*b*c*
.SP .5i
.LI
.V= (a?b*)x
.SP .5i
.LE
.LI
Write a function
.V= openpipe
that will take a string
.V= "char* command" ,
as an argument and open a pipe to a subprocess for reading.
If the open fails,
call the function
.V= "void syserror()" .
If it succeeds,
pass the opened file to the function
.V= "void readpipe (FILE*)" .
.SCORE-HERE 2
.SP 10i
.LI
Write
.V= flex
patterns for each of the following descriptions.
Whenever letters are mentioned or required,
they may appear either as upper-case or lower-case.
.SCORE-HERE 5
.ALX i ()
.LI
An identifier starts with a letter,
followed by zero or more letters, digits, or underscores.
.SP .5i
.LI
A hexadecimal constant which starts with the digit 0,
a letter X,
followed by one or more hexadecimal digits.
.SP .5i
.LI
A string constant which starts and ends with a single quote
.=V ( ' )
and has any number of characters (except single quotes) in between.
If a single quote appears in the string it is doubled.
Examples\(::
.V= 'abc' ,
.V= 'don''t' .
.SP .5i
.LI
A floating point number consists of one or more decimal digits,
possibly with a decimal point.
If a decimal point appears,
there must be at least one digit before and after the decimal point.
It may have an optional exponent,
which consists of the letter E,
optionally followed by a 
.V= +
or
.V= -
sign,
then followed by one or more decimal digits.
.SP .5i
.LI
The name of a list-extracting function from Lisp or Scheme,
which consists of the lower-case (only) letter C,
followed by one or more occurrences of the lower-case letters
A or D
in any order,
and terminated by the lower-case letter R.
Examples\(::
.V= car ,
.V= cdr ,
.V= caar ,
.V= cadr ,
.V= cdar ,
.V= cddr ,
\&.\|.\|.\|, etc.
.SP .5i
.LE
.LI
Given the following nondeterministic finite \*[automaton]\(::
.ALX a () "" 0
.LI
Write the regular expression from which Thompson's construction
was used to construct it.
.SCORE-HERE 1
.LI
Fill in the table with the \[*e]-closure of each state.
.SCORE-HERE 2
.LI
Use the subset algorithm to construct the equivalent deterministic
finite \*[automaton].
Inside each state of the DFA
write the numbers of the NFA states to which it corresponds.
.SCORE-HERE 2
.LE
.DS
.TS
tab(|); c |c |cw(2i) |, ct |c |c |, ^ |c |c |.
|_|_
T{
.PS 3i
arrowwid = 0.1
arrowht = 0.2
S0: circle invis
S1: circle "1" at S0+(1,0)
S2: circle "2" at S1+(1.6,.75)
S3: circle "3" at S2+(1.2,0)
S4: circle "4" at S3+(1.2,0)
S5: circle "5" at S1+(1,-.75)
S6: circle "6" at S5+(1.2,0)
S7: circle "7" at S6+(1.2,0)
S8: circle "8" at S7+(1.2,0)
S9: circle "9" at S1+(5.6,0)
circle rad circlerad-.075 at S9
circle invis at S9+(.5,0)
arrow from S0 to S1 chop
arrow "\[*e]" above from S1 to S2 chop
arrow "a" above from S2 to S3 chop
arrow "b" above from S3 to S4 chop
arrow "\[*e]" above from S4 to S9 chop
arrow "\[*e]" above from S1 to S5 chop
arrow "\[*e]" above from S5 to S6 chop
arrow "c" above from S6 to S7 chop
arrow "\[*e]" above from S7 to S8 chop
arrow "\[*e]" above from S8 to S9 chop
spline from S7.n to S6+(.6,.75) then to S6.n ->
spline from S5.se to S6+(.6,-.75) then to S8.sw ->
"\[*e]" at S6+(.6,.75)
"\[*e]" at S6+(.6,-.8)
.PE
T}| state $s$|\[*e]-closure ($s$)
|_|_
|1
|_|_
|2
|_|_
|3
|_|_
|4
|_|_
|5
|_|_
|6
|_|_
|7
|_|_
|8
|_|_
|9
|_|_
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
A scanner generated by
.V= flex
makes use of what kind of language\(??
.CHOOSE4 recursively\~enumerable context-sensitive context-free regular
.CHOOSE-END
.CHOOSE-BEGIN
A parser generated by
.V= bison
makes use of what kind of language\(??
.CHOOSE4 recursively\~enumerable context-sensitive context-free regular
.CHOOSE-END
.CHOOSE-BEGIN
The shortest string that the pattern
.V= xx+
can match contains how many characters\(??
.CHOOSE4 1 2 3 unlimited
.CHOOSE-END
.CHOOSE-BEGIN
Which pattern will match one or more
.V= a 's
followed by one or more
.V= b 's\(??
.CHOOSE4V (a|b)+ a+|b+ a+b+ a|b+
.CHOOSE-END
.CHOOSE-BEGIN
The last byte of the string pointed at by
.V= "char* yytext"
contains\(::
.CHOOSE4V \&'0' \&'\[rs]0' \&'\[rs]n' EOF
.CHOOSE-END
.CHOOSE-BEGIN
What is the expected speed of a lookup in an
.V= unordered_set<string> \(??
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
Comments in
.V= oc
are stripped of by the\(::
.CHOOSE4 parser preprocessor scanner stringset
.CHOOSE-END
.CHOOSE-BEGIN
For a grammar
$G = \[la] V sub N , V sub T , P , S \[ra] $,
the set $P$ contains rules of the form
$( A \[->] beta ) $,
where
.EQ
define STAR |size 10 *|
define PLUS |size 10 +|
.EN
.CHOOSE
$ A elem V sub N $ and $ beta elem ( V sub N inter V sub T ) sup STAR $
.CHOOSE
$ A elem V sub N $ and $ beta elem ( V sub N union V sub T ) sup STAR $
.CHOOSE
$ A elem V sub T $ and $ beta elem ( V sub N inter V sub T ) sup PLUS $
.CHOOSE
$ A elem V sub T $ and $ beta elem ( V sub N union V sub T ) sup PLUS $
.CHOOSE-END
.CHOOSE-BEGIN
The expression
.V= ab|c*
means
.CHOOSE4V ((ab)|c)* (a(b|c))* (ab)|(c*) a((b|c)*)
.CHOOSE-END
.CHOOSE-BEGIN
A
.V= stringset
with search time $ O ( 1 ) $
can be implemented as a
.CHOOSE4V binarytree_map<string> binarytree_set<string> \
unordered_map<string> unordered_set<string>
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following rules from the ETF example
shows that the operator $+$
is left associative\(??
.CHOOSE
$ E + T \[->] E $
.CHOOSE
$ E + T \[->] T $
.CHOOSE
$ E \[->] E + T $
.CHOOSE
$ E \[->] T + E $
.CHOOSE-END
.CHOOSE-BEGIN
How many tokens in the following C statement\(??
.VTCODE* 0 "printf (\[Dq]%s\[rs]n\[Dq], hello); // Say hello there."
.CHOOSE4 \05 \07 \09 11
.CHOOSE-END
.LE
.br
.if dPSPIC \{
.   sp -1.5v
.   DS
.   PSPIC jpgs/antikythera-0140x125.ps 2.4i
.   DE
.   sp -.2v
.\} 
.br 
.S -2.4 -3.6
The Antikythera mechanism,
built ca.\~160\[en]100 \s[-2]BCE\s[+2],
is the oldest known complex scientific calculator,
and is sometimes called the first known analog computer,
with operational instructions written in Greek.
.br
.V= http://en.wikipedia.org/wiki/Antikythera_mechanism
.br 
.S +2.4 +3.6
.FINISH
