.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-104A "Compiler Design I" Fall\~2011 Final\~Exam
.RCS "$Id: cmps104a-2011q4-exam3.mm,v 1.49 2011-12-08 18:25:19-08 - - $"
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
1.|A|\[->]|[ C ]
2.|A|\[->]|x
3.|C|\[->]|C , L
4.|C|\[->]|L
5.|L|\[->]|A : L
6.|L|\[->]|0
_
.TE
.DE
.SP 10i
.LI
Define a grammar using
.V= bison ,
showing everything that needs to be placed into section 1 and 2 of the
grammar.
Do not show any semantic actions.
Make your grammar as brief as possible by leveraging on ambiguity
declarations in section 1.
The language is defined below.
.SCORE-HERE 5
.ALX a () "" 0
.LI
A program is a sequence of one or more expressions separated by commas.
Commas may only occur between expressions,
never at the beginning nor end of the program.
.LI
An expression is one of the following\(::
.ALX i () "" 0
.LI
An
.V= if
keyword followed by an expression follwed by a
.V= then
keyword followed by an expression.
Optionally,
this may be followed by an
.V= else
keyword followed by another expression.
.LI
Two expressions connected by a plus
.=V ( + )
sign, left associative and a precedence above that of
.V= if .
.LI
An identifier followed by a subscript.
.LI
An expression inside parentheses
.=V ( (
and
.V= ) ).
.LI
Either an identifier or a number.
.LE
.LI
A subscript is an expression inside brackets
.=V ( [ 
and
.V= ] ).
.LE
.SP 3i
.LI
Define the lexical grammar for the language above,
such that it can be compiled using
.V= flex .
For semantic actions, just show a
.V= return
statement where a token is returned.
Define macros in section 1 and use them in section 2,
as appropriate.
.SCORE-HERE 5
.ALX a () "" 0
.LI
An identifier is one or more upper- or lower-case letters,
digits, or underscores,
but may not begin with a digit.
.LI
A number is a sequence of one or more digits with an optional decimal
point.
The decimal point may occur in front of or after all digits,
or between a pair of digits.
.LI
Comments are two slashes, as in Java,
followed by all characters up to, but not including, the next newline
character.
(The C preprocessor is not used.)
.LI
White space is any sequence of one or more spaces, tabs, or newline
characters.
.LI
Other tokens are as described in the 
.V= bison
grammar above.
.LE
.SP 10i
.LI
Given the program at the left\(::
.ALX a () "" 0
.LI
Show the symbol table at the right,
specifying which symbol table has each identifier.
Use the specification for project 4.
Do not show any hashing structure, just list the fields,
block numbers, and attributes as appropriate.
Do not mangle identifiers.
The attributes to choose from are\(::
.V= void ,
.V= bool ,
.V= char ,
.V= int ,
.V= null ,
.V= string ,
.V= struct ,
.V= array ,
.V= function ,
.V= variable ,
.V= field ,
.V= typeid ,
.V= param ,
.V= lvalue ,
.V= const ,
.V= vreg ,
.V= vaddr .
.SCORE-HERE 3
.LI
Draw the abstract symtax tree as per the project 3 specifications
(Don't show attributes).
.SCORE-HERE 3
.LI
Translate this program into 
.V= o\[:i]l
code as per the project 5 specifications.
.SCORE-HERE 4
.LE
.DS
.TS
box; lfCB.
struct foo {
   int f1;
   string f2;
}
foo bar = null;
void f (int i) {
   puti (i + 6);
}
int m = 6 * 3 + 8;
f(m + 8);
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
Which of the following items in a state will cause a reduction\(??
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
Which of the following items was entered into a state
during the closure operation\(??
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
Which item will cause a shift action to be added to the state
during goto propagation\(??
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
What might one expect as the output from compiling and
running the following C program\(??
.VTCODE* 0 "void main() { printf (\[Dq]%p\[rs]n\[Dq], main); }
.CHOOSE4FT CB 0x4004c8 Segmentation\~fault UHå¿È@ \
a.out:\~Command\~not\~found.
.CHOOSE-END
.CHOOSE-BEGIN
In general, a DFA is \l'.3i' when compared to an NFA.
.CHOOSE4 "faster (CPU) and larger (memory)" \
"faster (CPU) and smaller (memory)" \
"slower (CPU) and larger (memory)" \
"slower (CPU) and smaller (memory)"
.CHOOSE-END
.CHOOSE-BEGIN
A reduce/reduce conflict occurs in an LR(1) machine when\(::
.CHOOSE 
The grammar is ambiguous,
and only when the grammar is ambiguous.
.CHOOSE 
A terminal symbol is in the lookahead set of a reduction,
and in the lookahead set of another reduction in the
same state.
.CHOOSE 
A terminal symbol is in the lookahead set of a reduction,
and also on an outgoing transition in the same state.
.CHOOSE 
A nonterminal symbol is in the lookahead set of a reduction,
and also on an outgoing transition in the same state.
.CHOOSE-END
.CHOOSE-BEGIN
An input file containing $n$ characters will be scanned by a DFA in
what time\(??
.CHOOSE
$ O ( log sub 2 n ) $
.CHOOSE
$ O ( n ) $
.CHOOSE
$ O ( n log sub 2 n ) $
.CHOOSE
$ O ( n sup 2 ) $
.CHOOSE-END
.CHOOSE-BEGIN
A sequence of straight-line code fundamental to code optimization,
such that if the first instruction is executed,
then so will all of the following instructions be executed,
describes a\(::
.CHOOSE4 basic\~block folded\~constant natural\~loop stack\~machine
.CHOOSE-END
.CHOOSE-BEGIN
Which language can be recognized by a push-down \*[automaton]
but not by a finite state machine\(??
.CHOOSE
A sequence of one or more decimal digits.
.CHOOSE
An
.V= x
followed by zero or more
.V= y 's.
.CHOOSE
Input requiring balanced parentheses.
.CHOOSE
Strictly alternating
.V= x 's
and
.V= y 's.
Example\(::
.V= xyxyxyxyxy
.CHOOSE-END
.CHOOSE-BEGIN
A 
.V= flex
pattern that matches either an
.V= x
or a
.V= y ,
but not both\(::
.CHOOSE4FT CB x*y x+y x?y x|y
.CHOOSE-END
.CHOOSE-BEGIN
What is it called when the lookahead symbol is pushed onto the parsing
stack,
then the scanner is called to obtain the next lookahead symbol\(??
.CHOOSE4 accept error reduce shift
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
What is the appropriate semantic action to attach to the  
.V= bison
rule
.VCODE* 0 "expr : '(' expr ')'
.CHOOSE4FT CB "{ \[Do]\[Do] = \[Do]1; }" "{ \[Do]\[Do] = \[Do]2; }" \
"{ \[Do]1 = \[Do]\[Do]; }" "{ \[Do]2 = \[Do]1; }"
.CHOOSE-END
.CHOOSE-BEGIN
In a local stack frame, the static (access) link points at\(::
.CHOOSE
The instruction following the call instruction that activated the
function.
.CHOOSE
The local stack frame in which the current function is nested.
.CHOOSE
The local stack frame of the caller.
.CHOOSE
The object referred to as
.V= this
in Java and C++.
.CHOOSE-END
.CHOOSE-BEGIN
During a function call,
the return address is pushed onto the stack or placed in a register by
the\(::
.CHOOSE4 called\~function calling\~function garbage\~collector \
operating\~system
.CHOOSE-END
.CHOOSE-BEGIN
Given
.V= String\~s
and
.V= Object\~o
in Java,
if
.V= o
actually points an an
.V= Integer ,
when will the error in the following statement be detected\(??
.VTCODE* 0 "s = (String) o;"
.CHOOSE4 "by the parser" "by the type checker" "by the code generator" \
"by the runtime routines"
.CHOOSE-END
.CHOOSE-BEGIN
For a grammar $ G = \[la] V sub N , V sub T , P , S \[ra] $,
where the elements of $P$ are of the form $ ( A -> beta ) $,
where\(::
.CHOOSE
$ beta elem ( V sub N inter V sub T ) * $
.CHOOSE
$ beta elem ( V sub N union V sub T ) * $
.CHOOSE
$ beta elem { V sub N } * $
.CHOOSE
$ beta elem { V sub T } * $
.CHOOSE-END
.CHOOSE-BEGIN
A sequence of instructions such that,
if the first one in the sequence is executed,
so will all of the others,
barring an exception,
is called a\(::
.CHOOSE4 basic\~block function interpreter natural\~loop
.CHOOSE-END
.CHOOSE-BEGIN
A form of automatic memory management which fails to work on a cyclic
data structure is\(::
.CHOOSE
copying collector with semispaces
.CHOOSE
explicit allocation and deallocation
.CHOOSE
mark and sweep
.CHOOSE
reference counting collector
.CHOOSE-END
.CHOOSE-BEGIN
The Java virtual machine (JVM) is an interpreter which uses\(::
.CHOOSE
abstract syntax tree
.CHOOSE
stack machine code
.CHOOSE
three address code
.CHOOSE
two address code
.CHOOSE-END
.CHOOSE-BEGIN
An ambiguous grammar like the following can be disambiguated in
.V= bison
by declaring
.V= else
to be __(a)__ associative with a very low precedence so that
preference will be given to a __(b)__ when
.V= ELSE
is the lookahead
symbol.
Assume a C-like language.
.VTCODE* 0 "stmt : IF '(' expr ')' stmt ELSE stmt"
.VTCODE* 0 "stmt : IF '(' expr ')' stmt %prec ELSE"
.CHOOSE
(a) = left, (b) = reduce
.CHOOSE
(a) = left, (b) = shift
.CHOOSE
(a) = right, (b) = reduce
.CHOOSE
(a) = right, (b) = shift
.CHOOSE-END
.CHOOSE-BEGIN
If we represent a set of the integers 0 to 31 as a
.V= uint32_t 
bitset,
the union of two such sets can be expressed in C as\(::
.CHOOSE4FT CB x\~|\~y x\~&\~y x\~\[ha]\~y x\~\[ti]\~y
.CHOOSE-END
.CHOOSE-BEGIN
``Go To Statement Considered Harmful''
.CHOOSE4 Edsger\~Dijkstra Donald\~Knuth John\~McCarthy Dennis\~Ritchie
.CHOOSE-END
.LE
.FINISH
