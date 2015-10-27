.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-104A "Compiler Design I" Fall\~2012 Test\~#2
.RCS "$Id: cmps104a-2012q4-exam2.mm,v 1.73 2012-11-07 13:04:02-08 - - $"
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
For each of the two expressions in the table at the right,
draw parse trees, 
.E= not
abstract syntax trees for the E-T-F grammar.
.SCORE-HERE 4
.DS
.TS
tab(|); lfCB |cew(184p)fCB |cefCB |.
|_|_
E \[->] E + T
E \[->] T
T \[->] T * F
T \[->] F
F \[->] ( E )
F \[->] i
T{
.SP .5i
T}
|a \0 * \0 ( \0 b \0 + \0 c \0 )|a \0 * \0 b \0 + \0 c
|_|_
.TE
.DE
.LI
In the style of the LALR(1) handout discussed in class\(::
.ALX a () "" 0
.LI
Construct the characteristic finite state machine (CFSM), 
sets of items and transition diagram, showing shifts, reductions,
and acceptance.
.SCORE-HERE 5
.LI
Is the grammar LR(0)\(??
If not,
which state(s) have LR(0) conflicts\(??
.SCORE-HERE 1
.LE
.DS
.TS
tab(|); |r2 l1fCB l1fCB lfCB |.
_
0.|S|\[->]|\[Do] A \[Do] 
1.|A|\[->]|f ( A )
2.|A|\[->]|E
3.|E|\[->]|A + A
4.|E|\[->]|x
_
.TE
.DE
.SP 10i
.LI
Write a grammar in 
.V= bison
that recognizes the following language.
Show declarations from part 1 and the grammar from part 2 of a 
.V= bison
grammar file.
Keep the number of rules small by using an ambiguous grammar,
with suitable precedence and associativity declarations.
Do not show any semantic actions.
.SCORE-HERE 5
.ALX a () "" 0
.LI
A program is a sequence of zero or more statements.
.LI
A statement is an assignment or a query.
.LI
An assignment is an identifier, an equal sign, an expression,
and ends with a semi-colon.
.LI
A query is an identifier followed by a question mark.
.LI
An expression is a mixture of identifiers, numbers, left and right
parentheses, and the operators
.V= + ,
.V= - ,
.V= * ,
and
.V= / ,
with the same precedence and associativity of C.
.LI
Make other assumptions sensible to a C programmer.
.LE
.SP 3.25i
.LI
Write a lexical grammar using
.V= flex
for the language described above.
.SCORE-HERE 5
.ALX a () "" 0
.LI
Identifiers are sequences of letters, digits, and underscores,
but must begin with a letter, and may not end with an underscore.
.LI
A number is a sequence of one or more digits,
with an optional decimal point which may appear before the first
digit, after the last digit, or in between digits.
.LI
A number may have an optional exponent which is an upper- or lower-case
letter E, an optional sign, followed by one or more digits.
.LI
Spaces, tabs, and newlines are ignored.
.LI
Comments begin with a hash
.=V ( # )
and are followed by all characters up to but not including a
trailing newline character.
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
The following grammar\(::
.TVCODE* 1 "$ A -> ~ ( ~ A ~ ) $"
.TVCODE* 1 "$ A -> ~ x $"
.CHOOSE 
is LR(0) but not SLR(1). 
.CHOOSE 
is SLR(1) but not LR(0).
.CHOOSE 
is both LR(0) and SLR(1). 
.CHOOSE 
is neither LR(0) nor SLR(1). 
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following items in a state will cause a shift\(??
.CHOOSE 
$ E ~ -> ~ \[bu] ~ E + T $ 
.CHOOSE 
$ E ~ -> ~ E ~ \[bu] ~ + T $ 
.CHOOSE 
$ E ~ -> ~ E + ~ \[bu] ~ T $
.CHOOSE 
$ E ~ -> ~ E + T ~ \[bu] $ 
.CHOOSE-END
.CHOOSE-BEGIN
Given the following two rules in a grammar,
and assuming a language like C,
when the lookahead symbol is an $bold else$,
we should mark the rule and the $bold else$ [x] associative,
so that we perform a [y] action.
.TVCODE* 1 "$ S -> ~ bold if ~ ( ~ E ~ ) ~ S ~ bold else ~ S $"
.TVCODE* 1 "$ S -> ~ bold if ~ ( ~ E ~ ) ~ S $"
.CHOOSE4 "[x] = left, [y] = reduce" "[x] = left, [y] = shift" \
"[x] = right, [y] = reduce" "[x] = right, [y] = shift" 
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following grammars will recognize an arbitrary number of
$x$s followed by one $y$\(??
.CHOOSE
$ A ~ -> ~ A ~ x ~ \[br] ~ y $
.CHOOSE
$ A ~ -> ~ A ~ y ~ \[br] ~ x $
.CHOOSE
$ A ~ -> ~ x ~ A ~ \[br] ~ y $
.CHOOSE
$ A ~ -> ~ y ~ A ~ \[br] ~ x $
.CHOOSE-END
.CHOOSE-BEGIN
Putting reserved words into the lexical grammar instead of into 
a separate reserved word table will have what effect\(??
.CHOOSE 
Make the DFA run more slowly. 
.CHOOSE 
Put too many \(*e-transitions into the DFA.
.CHOOSE 
Make the DFA larger. 
.CHOOSE 
Generate shift/reduce error messages.
.CHOOSE-END
.CHOOSE-BEGIN
Which grammar is ambiguous\(??
.CHOOSE
$ A ~ -> ~ A ~ A ~ \[br] ~ x $
.CHOOSE
$ A ~ -> ~ A ~ x ~ \[br] ~ x $
.CHOOSE
$ A ~ -> ~ x ~ A ~ \[br] ~ x $
.CHOOSE
$ A ~ -> ~ x ~ x ~ \[br] ~ x $
.CHOOSE-END
.CHOOSE-BEGIN
If we have a grammar
$G = \[la] V sub N , V sub T , P , S \[ra] $,
and the notation $\[br] ~ x ~ \[br]$ means ``length of $x$'' or
``size of $x$''\(::
when reducing by the rule $ ( A -> \[*a] ) elem P $,
how many items are popped from the stack\(??
.CHOOSE
$ \[br] ~ P ~ \[br] $
.CHOOSE
$ \[br] ~ V sub N ~ \[br] $
.CHOOSE
$ \[br] ~ V sub T ~ \[br] $
.CHOOSE
$ \[br] ~ \[*a] ~ \[br] $
.CHOOSE-END
.CHOOSE-BEGIN
The semantic information is communicated from
.V= yylex()
to
.V= yyparse()
via what variable\(??
.CHOOSE4V yyleng yylval yytext yywrap
.CHOOSE-END
.CHOOSE-BEGIN
How many tokens are there in the following Java code\(??
.VTCODE* 1 "/* Say hello */"
.VTCODE* 1 "out.printf (\[Dq]%s%n\[Dq], \[Dq]Hello, World!\[Dq]);"
.CHOOSE4 \07 \09 11 13
.CHOOSE-END
.CHOOSE-BEGIN
If $D$ is the set of languages recognizable by a DFA
and $N$ is the set of languages recognizable by an NFA,
then\(::
.CHOOSE
$D subset A$
.CHOOSE
$D = A $
.CHOOSE
$D supset A$
.CHOOSE
None of the above.
.CHOOSE-END
.CHOOSE-BEGIN
The \l'.25i' mechanism,
built ca.\~150\[en]100 \s[-2]BCE\s[+2],
is the oldest known complex scientific calculator,
and is sometimes called the first known analog computer,
with operational instructions written in Greek.
.char-nt '*A 'A \[cq]\h'-3p'\[*A]
.ds-nt Antigone Antigone \
\['*A]\[*n]\[*t]\[*i]\[*g]\[*o']\[*n]\[*y]
.ds-nt Antikleia Antikleia \
\['*A]\[*n]\[*t]\[*i']\[*k]\[*l]\[*e]\[*i]\[*a]
.ds-nt Antikythera Antikythera \
\['*A]\[*n]\[*t]\[*i]\[*k]\[*u']\[*h]\[*y]\[*r]\[*a]
.ds-nt Antinoos Antinoos \
\['*A]\[*n]\[*t]\[*i']\[*n]\[*o]\[*o]\[ts]
.CHOOSE4 \*[Antigone] \*[Antikleia] \*[Antikythera] \*[Antinoos]
.CHOOSE-END
.LE
.SP .5i 
.DS C
(answer 11 was in this space on test 1) 
.DE 
.FINISH
