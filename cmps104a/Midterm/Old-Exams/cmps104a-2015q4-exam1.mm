.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-104A "Compiler Design I" Fall\~2015 Test\~#1
.RCS \
"$Id: cmps104a-2015q4-exam1.mm,v 1.53 2015-10-20 15:05:57-07 - - $"
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
Draw
.UL "\f[BI]abstract syntax trees\fP"
for each of the following C expressions\(::
.SCORE-HERE 3
.DS
.TS
tab(|) allbox; cw(136p)efCB cefCB cefCB.
a * b / c * d - e|a = b * c + d|a + b / c + d * e
_
.SP 1.5i
.TE
.DE
.LI
Write
.V= flex
regular expressions for each of the following\(::
.SCORE-HERE 5
.ALX a ()
.LI
A number which consists of a sequence of decimal digits,
possibly with a decimal point.
If a decimal point appears,
it must be preceded and followed by digits.
A number has an optional exponent,
which is the letter ``e'' in upper- or lower-case,
followed by an optional minus sign,
and then one or more digits.
.SP .4i
.LI
A quoted string which starts and ends with a double quote.
Between the quotes may be zero or more occurrences of any character
except a newline.
If a backslash or a quote appears in the string,
it must be excaped by a backslash.
.SP .4i
.LI
Write two patterns in the correct order.
One is the keyword
.V= if ,
which may not be recognized as an identifier.
The other is an identifier which consists of one or more 
upper- or lower-case letters or decimal digits,
but which may not begin with a digit.
.SP .4i
.LI
Write two patterns\(::
one matches a correct octal constant in C,
and the other matches a correct hexadecimal constant in C.
.SP .4i
.LI
A pattern which recognizes a list-extracting function in Scheme.
The first letter is always a lower-case ``c''
and the last letter is always a lower-case ``r''.
Between them are one or more occurrences of either the lower-case
letters ``a'' or ``d''.
Examples\(::
.V= car ,
.V= cdr ,
.V= caar ,
.V= cadr ,
.V= cdar ,
.V= cddr ,
etc.
.SP .4i
.LE
.LI
Using
.UL "\f[BI]Thompson's construction\fP,
draw the NFA from the following regular expression.
.SCORE-HERE 2
.SP
.V= ab*|cd
.SP 10i
.LI
Given the NFA shown here,
compute the $\[*e]$-closure of each state and fill in the table.
.SCORE-HERE 2
.DS
.TS
tab(|); c | c | cw(172p) |, c | c | c |, ^ | c | c |.
|_|_|
T{
.PS 3i
.ft CR
arrowwid = 0.1
arrowht = 0.2
S0: circle invis; move right movewid 
S1: circle "1"; move right 2*movewid
S3: circle "3"; move right 2*movewid
S6: circle "6"; move right 2*movewid
S8: circle "8"; circle rad circlerad-.075 at S8; move right 2*movewid
circle invis
move up 2*moveht from S3; S2: circle "2"
move up 2*moveht from S6; S5: circle "5"
move down 2*moveht from S3; S4: circle "4"
move down 2*moveht from S6; S7: circle "7"
arrow from S0 to S1 chop 
arrow "\[*e]" above from S1 to S2 chop 
arrow "\[*e]" above from S1 to S3 chop 
arrow "\[*e]" above from S1 to S4 chop 
arrow "a" below from S2 to S5 chop 
arrow "b" above from S3 to S6 chop 
arrow "c" above from S4 to S7 chop 
arrow "\[*e]" above from S5 to S8 chop 
arrow "\[*e]" above from S6 to S8 chop 
arrow "x" above from S7 to S8 chop 
arrow "b" above from S3 to S7 chop 
SX: circle invis at 1/2 between S2 and S5
spline from S5.nw then to SX.n+(0,moveht/2) then to S2.ne ->
"\[*e]" at SX+(0,moveht)
.ft R
.PE
T}|state $s$|$\[*e]$-closure($s$)
|_|_|
|1
|_|_|
|2
|_|_|
|3
|_|_|
|4
|_|_|
|5
|_|_|
|6
|_|_|
|7
|_|_|
|8
|_|_|
.TE
.DE
.LI
Given the ETF grammar shown at the left,
draw
.UL \f[BI]parse\~trees\fP
for each of the following expressions\(::
.SCORE-HERE 3
.DS
.TS
tab(|); l cw(117.3333p)e ce ce,
        l |cfCB |cfCB |cfCB |,
        ^ |cfCB |cfCB |cfCB |.
|_|_|_|
T{
.EQ
lpile { E above E above T above T above F above F }
lpile { ~ -> ~ above ~ -> ~ above ~ -> ~
above ~ -> ~ above ~ -> ~ above ~ -> ~ }
lpile { E + T above T above T * F above F above ( ~ E ~ ) above i }
.EN
T}
.SP 1.75i
|a\0 *\0 b\0 +\0 c|\0 (\0 a\0 +\0 b\0 )\0 *\0 c|\0 a\0 *\0 b\0 *\0 c
|_|_|_|
.TE
.DE
.LI
Given the ETF grammar in the previous question
and the fact that a grammar
$G = \[la] V sub N , V sub T , P , S \[ra] $,
fill in each of the following\(::
.SCORE-HERE 1
.DS
.EQ
V sub N = left { "\l'1i'" right } ~ ,
V sub T = left { "\l'1i'" right } ~ ,
roman and ~ ~ S = "\l'1i'" ~ .
.EN
.DE
.LI
Rewrite the ETF grammar from the previous question so that both the
.V= +
and 
.V= *
operators are right associative,
and have the same precedence.
.SCORE-HERE 2
.SP 1.5i
.LI
Draw deterministic finite automata for each of the following
regular expressions.
Use the
.E= minimum 
possible number of states.
.SCORE-HERE 2
.ALX a ()
.LI
.V= ab*c|d
.LI
.V= a+b+c+
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
The function
.V= yyparse
implements what kind of machine\(??
.CHOOSE
Turing machine
.CHOOSE
finite state automaton
.CHOOSE
linear bounded automaton
.CHOOSE
pushdown automaton
.CHOOSE-END
.CHOOSE-BEGIN
The function
.V= yylex
implements what kind of machine\(??
.CHOOSE
Turing machine
.CHOOSE
finite state automaton
.CHOOSE
linear bounded automaton
.CHOOSE
pushdown automaton
.CHOOSE-END
.CHOOSE-BEGIN
What kind of language is recognized by
.V= flex \(??
.CHOOSE
context-free
.CHOOSE
context-sensitive
.CHOOSE
recursively enumerable
.CHOOSE
regular
.CHOOSE-END
.CHOOSE-BEGIN
What kind of language is recognized by
.V= bison \(??
.CHOOSE
context-free
.CHOOSE
context-sensitive
.CHOOSE
recursively enumerable
.CHOOSE
regular
.CHOOSE-END
.CHOOSE-BEGIN
The regex
.V= ab|c*d
is equivalent to\(::
.CHOOSE4V (a(b|c))*d (ab)|((c*)d) a((b|c)*)d a(b|(c*))d
.CHOOSE-END
.CHOOSE-BEGIN
Whenever 
.V= yylex
returns,
what variable points at the lexeme most recently matched\(??
.CHOOSE4V yydebug yyin yylexeme yytext
.CHOOSE-END
.CHOOSE-BEGIN
Given the ETF grammar discussed in class,
which rule unambiguously shows that the operator
.V= +
is left associative and can appear multiple times in an expression\(??
.CHOOSE
$ E -> E + E $
.CHOOSE
$ E -> E + T $
.CHOOSE
$ E -> T + E $
.CHOOSE
$ E -> T + T $
.CHOOSE-END
.CHOOSE-BEGIN
Access in time $ O ( 1 ) $ to the string table is provided by\(::
.CHOOSE4V map<string> set<string> unordered_map<string> \
unordered_set<string>
.CHOOSE-END
.CHOOSE-BEGIN
A DFA is constructed from a regular expression $r$ 
and used to scan a string $s$.
How fast is the scan\(??
.CHOOSE
$ O ( 1 ) $
.CHOOSE
$ O ( 2 sup { left | r right | } ) $
.CHOOSE
$ O ( left | r right | times left | s right | ) $
.CHOOSE
$ O ( left | s right | ) $
.CHOOSE-END
.CHOOSE-BEGIN
If D is the set of languages recognizable by a DFA, 
and N is the set of languages recognizable by an NFA,
then\(::
.CHOOSE
$ D == N $
.CHOOSE
$ D subset N $
.CHOOSE
$ D supset N $
.CHOOSE
Not enough information to decide,
because it depends on the particular grammar in question.
.CHOOSE-END
.CHOOSE-BEGIN
Given a grammar
$G = \[la] V sub N , V sub T , P , S \[ra] $,
tokens returned by 
.V= yylex
deal strictly with which set\(??
.CHOOSE
$ V sub N $
.CHOOSE
$ V sub T $
.CHOOSE
$ P $
.CHOOSE
$ S $
.CHOOSE-END
.CHOOSE-BEGIN
Which pattern will recognize a Java or C++ comment\(??
.CHOOSE4V \
\&\[Dq]//\[Dq][\[ha]/n]* \
\&\[Dq]//\[Dq][\[ha]\[rs]n]* \
\&\[Dq]\[rs]\[rs]\[Dq][\[ha]/n]* \
\&\[Dq]\[rs]\[rs]\[Dq][\[ha]\[rs]n]*
.CHOOSE-END
.LE
.FINISH
