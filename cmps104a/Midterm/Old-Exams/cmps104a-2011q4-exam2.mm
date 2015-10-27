.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-104A "Compiler Design I" Fall\~2011 Test\~#2
.RCS "$Id: cmps104a-2011q4-exam2.mm,v 1.33 2011-11-10 16:20:44-08 - - $"
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
1.|A|\[->]|i X A e A
2.|A|\[->]|i X A
3.|A|\[->]|X
4.|X|\[->]|X + y
5.|X|\[->]|y
_
.TE
.DE
.SP 10i
.LI
Using
.V= bison ,
define a grammar for
.V= expr .
An
.V= expr
is a pair of 
.V= expr s
connected by one of the operators
.V= '+' ,
.V= '-' ,
.V= '*' ,
or
.V= '/' ,
or may be an 
.V= IDENT
or an
.V= expr
in between parentheses.
The operators
.V= '+'
and
.V= '*'
have the same precedence as each other and are right associative.
The other operators
.V= '-'
and
.V= '/'
have the same precedence as each other but lower then the other two,
and are left associative.
Provide two answers, each using as few rules as possible.
Both must be acceptable to
.V= bison .
Do not show semantic actions.
.DS
.TS
tab(|); |lw(211.5p) |lw(211.5p) |.
_
T{
.fi
.ALX a ()
.LI
An unambiguous grammar.
.SCORE-HERE 2
.LE
T}|T{
.fi
.ALX a ()
.nr li*cnt!\\n[li*lvl] +1
.LI
An ambiguous grammar
using precedence and associativity declarations.
.SCORE-HERE 2
.LE
T}
.SP 1i
T{
.V= %%
T}|T{
.V= %%
T}
.SP 1.75i
T{
.V= %%
T}|T{
.V= %%
T}
_
.TE
.DE
.LI
Using the specifications for project 3,
draw abstract syntax trees for the following programs.
Show only tokens, not lexical information.
Draw the ASTs as a tree, not as a data structure, i.e.,
all lines should be from parent to child, not sibling to sibling.
.DS
.TS
tab(|); |lw(211.5p) |lw(211.5p) |.
_
T{
.fi
.ALX a ()
.LI
.V= //
.SCORE-HERE 2
.nf
.ft CB
int a = 3 + 4;
if (a < 2) puti (a); else exit (6);
.LE
T}|T{
.fi
.ALX a ()
.nr li*cnt!\\n[li*lvl] +1
.LI
.V= //
.SCORE-HERE 2
.nf
.ft CB
int i = 3;
while (i > 0) { puti (i); i = i + 1; }
.SP 2.5i
.LE
T}
_
.TE
.DE
.LI
Draw the LR(0) CFSM for the following grammar.
.SCORE-HERE 2
.DS
.TS
tab(|); |r2 l1fB l1fB lfB |.
_
0.|S|\[->]|\[Do] A \[Do]
1.|A|\[->]|A x y
2.|A|\[->]|z
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
If an LR(0) machine created from a grammar has $n$ states,
then the size of the SLR(1) parse table will be\(::
what will be the size of the parse table\(??
.CHOOSE
$ ( left | V sub N right | times left | V sub T right | ) + n $
.CHOOSE
$ ( left | V sub N union V sub T right | ) times n$
.CHOOSE
$ ( left | V sub N inter V sub T right | ) times n$
.CHOOSE
$ left | V sub N right | times left | V sub T right | sup n$
.CHOOSE-END
.CHOOSE-BEGIN
This
.V= bison
grammar has\(::
.VTCODE* 0 "s : a | b ;"
.VTCODE* 0 "a : 'x' ;"
.VTCODE* 0 "b : 'x' ;"
.CHOOSE4 "a reduce/reduce conflict." "a shift/reduce conflict." \
"a shift/shift conflict." "no conflict of any kind." 
.CHOOSE-END
.CHOOSE-BEGIN
Which grammar will recognize one 
.V= 'x'
followed by zero or more 
.V= 'y' s\(??
.CHOOSE4FT CB "a : 'x' a | 'y' ;" "a : 'y' a | 'x' ;" \
"a : a 'x' | 'y' ;" "a : a 'y' | 'x' ;"
.CHOOSE-END
.CHOOSE-BEGIN
The following grammar\(::
.br
$ S -> x ~ S $
.br
$ S -> $
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
When a parser pops symbols from the parsing stack,
calls a semantic action,
and pushes a symbol onto the stack,
what kind of action is it\(??
.CHOOSE4 accept error reduce shift
.CHOOSE-END
.CHOOSE-BEGIN
The
.V= flex
expression
.V= ab|c*
is the same as 
.CHOOSE4FT CB ((ab)|c)* (a(b|c))* (ab)|(c*) a((b|c)*)
.CHOOSE-END
.CHOOSE-BEGIN
When
.V= yylex
has scanned a token,
during the execution of the appropriate semantic action,
what variable points at the lexeme\(??
.CHOOSE4FT CB yyin yylval yyparse yytext
.CHOOSE-END
.CHOOSE-BEGIN
What is used to convert an NFA into a DFA\(?? 
.CHOOSE4 "Hopcroft's construction" "Kleene's construction" \
"subset construction" "Thompson's construction"
.CHOOSE-END
.CHOOSE-BEGIN
Which 
.BR flex
pattern will recognize a Java double-slash comment\(?? 
.CHOOSE4FT B \
/\^\(rs\^/\^\(rs\^[\(ha/\^n]* \
/\^\(rs\^/\^\(rs\^[\(ha\(rs\^n]* \
\(rs\^/\^\(rs\^/\^[\(ha/\^n]* \
\(rs\^/\^\(rs\^/\^[\(ha\(rs\^n]*
.CHOOSE-END
.CHOOSE-BEGIN
What kind of Chomsky automaton does 
.V= bison
simulate\(??
.CHOOSE
Turing machine
.CHOOSE
linear-bounded automaton
.CHOOSE
pushdown automaton
.CHOOSE
finite state automaton
.CHOOSE-END
.CHOOSE-BEGIN
The largest class of grammars whose characteristic finite state
machines are the same size as the LR(0) CFSM is\(::
.CHOOSE4 LR(0) SLR(1) LALR(1) LR(1)
.CHOOSE-END
.LE
.SP
.if dPSPIC \{
.   sp -2v
.   DS
.   PSPIC jpgs/bug-zero.ps 2i
.   DE
.\}
.hw Uni-ver-si-ty
.br
.S -3 -4
Grace Hopper was working on the Harvard University Mark
II Aiken Relay Calculator (a primitive computer).
On the 9th of September, 1947,
when the machine was experiencing problems,
an investigation showed that there was a moth trapped between 
the points of Relay #70, in Panel F.
.br
.T= [http://en.wikipedia.org/wiki/Grace_Hopper]
.br
.S +3 +4
.FINISH
