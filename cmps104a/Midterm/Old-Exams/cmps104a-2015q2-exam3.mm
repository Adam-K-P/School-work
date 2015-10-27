.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-104A "Compiler Design I" Spring\~2015 Final\~Exam
.RCS \
"$Id: cmps104a-2015q2-exam3.mm,v 1.33 2015-06-02 14:29:41-07 - - $"
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
.ALX 1 . 3
.LI
Given the grammar presented here,
and using the style from the LALR(1) handout\(::
.ALX a () 4 0  
.LI
Construct the characteristic finite state machine (CFSM), 
sets of items and transition diagram, showing shifts, reductions,
and acceptance.
.SCORE-HERE 6
.LI
Construct the FOLLOW sets.
Show the first pass with rule symbols in the Follow sets.
Then show the revised follow sets with only terminal symbols.
(See chart at the bottom of the page.)
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
.\"1.|C|\[->]|f ( A )
.\"2.|C|\[->]|f ( )
.\"3.|C|\[->]|x
.\"4.|A|\[->]|A , C
.\"5.|A|\[->]|C
0.|S|\[->]|\[Do] G \[Do]
1.|G|\[->]|G R x
2.|G|\[->]|G o x
3.|G|\[->]|G x
4.|G|\[->]
5.|R|\[->]|s =
6.|R|\[->]|R s
_
.TE
.DE
.sp 250p
.DS
.TS
l, |lw(140p) |.
Follow sets with rule symbols:
_
.sp 2p
Follow(C)\(::
.sp 2p
_
.sp 2p
Follow(A)\(::
.sp 2p
_
.TE
.TS
l, |lw(140p) |.
Follow sets with only $V sub T$ symbols\(::
_
.sp 2p
Follow(C)\(::
.sp 2p
_
.sp 2p
Follow(A)\(::
.sp 2p
_
.TE
.DE
.SP 10i
.LI
Outline, using C-like pseudocode,
the mark algorithm used in the mark and sweep collection algorithm.
Assume a variable
.V= rootset .
.SCORE-HERE 3
.SP 2.5i
.LI
Assuming a compacting or copying collector,
write the
.V= malloc
algorithm,
assuming that memory is always allocated on a 16-byte boundary.
.SCORE-HERE 3
.SP 2.5i
.LI
Write an unambiguous grammar for the following language\(::
An
.V= E
is a sequence of one or more
.V= T s
connected by a right
associative 
.V= /
operator.
A
.V= T
is an
.V= F
optionally preceded by a
.V= +
or a
.V= - 
operator.
An
.V= F
is an
.V= x
or an
.V= E
in parentheses.
Use the same syntax as is used on the first page.
.SCORE-HERE 2
.SP 1.25i
.LI
Draw the CFSM for the following grammar.
Is the grammar LR(0)\(??
.SCORE-HERE 2
.DS
.ft CB
T \[->] x T
T \[->]
.DE
.SP 10i
.LI
Code the function
.V= abs ,
which takes the absolute value of an integer.
.E= "Do not use any control transfer instructions."
Assume that an
.V= int
is 32 bits and that the operator
.V= >>
does an arithmetic right shift.
.SCORE-HERE 1
.VTCODE* 0 "int abs (int n) {"
.SP .4i
.VTCODE* 0 "}"
.LI
Given the declaration of a class at the left,
draw a picture of a
.V= "foo* p"
pointing at an object,
label the contens of each field,
and show the contents of the virtual function table.
.SCORE-HERE 2
.DS
.ft CB
class foo {
   int a;
   int b;
   virtual void f();
   virtual void g();
}
.DE
.LI
Given the function at the left, 
translate it into
.V= oil
statements using the specification for project 5.
Each statement of your answer should be put in 
the box corresponding to the original source statement.
.SCORE-HERE 4
.DS
.TS
tab(|); |lfCB |lw(266p) |.
_
int prod (int[] a, int[] b, int n) {
.SP .4i
_
   int s = 0;
.SP .1i
_
   int i = 0;
.SP .1i
_
   while (i < n) {
.SP .3i
_
      s = s + a[i] * b[i];
.SP .5i
_
      i = i + 1;
.SP .3i
_
   }
.SP .3i
_
   return s;
.SP .3i
_
}
.SP .3i
_
.TE
.DE
.LI
Draw the abstract syntax tree for the above function,
using the specifications for project 3.
.SCORE-HERE 3
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
Which of the following items in a state was added during the closure 
computation\(??
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
The number of registers on the x86-64 architecture is\(::
.CHOOSE4 \08 16 32 64
.CHOOSE-END
.CHOOSE-BEGIN
If a function is nested inside another,
what does the inner function use to access the local variables of
the outer function\(??
.CHOOSE
dynamic link
.CHOOSE
frame pointer
.CHOOSE
stack pointer
.CHOOSE
static link
.CHOOSE-END
.CHOOSE-BEGIN
If an NFA is constructed from a regular expression whose length is
$ | r | $ and is used to scan a string whose length is $ | s | $,
then it will run at speed\(::
.CHOOSE
$ O ( | r | ) $
.CHOOSE
$ O ( | r | + | s | ) $
.CHOOSE
$ O ( | r | times | s | ) $
.CHOOSE
$ O ( | s | ) $
.CHOOSE-END
.CHOOSE-BEGIN
What is used to identify the natural loops of a function\(??
.CHOOSE4 basic\~block dominator\~tree flow\~graph tail\~call
.CHOOSE-END
.CHOOSE-BEGIN
Given a grammar $ G = \[la] V sub N , V sub T , P , S \[ra] $,
where $ V = V sub N union V sub T $.
The set of productions $P$ consists of rules of the form
$ ( A -> alpha ) $, where\(::
.CHOOSE 
$ A elem V $ and $ alpha elem V sup {*}  $.
.CHOOSE 
$ A elem V sub N $ and $ alpha elem V sup {*}  $.
.CHOOSE 
$ A elem V sub T $ and $ alpha elem V sub N sup {*}  $.
.CHOOSE 
$ A elem V sup {+} $ and $ alpha elem V sup {+} $.
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following items will cause a shift transition to be added
to the current state\(??
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
The number of bits in 
.V= %rax
on the x86-64 architecture is\(::
.CHOOSE4 \08 16 32 64
.CHOOSE-END
.CHOOSE-BEGIN
If an NFA is constructed from a regular expression whose length is
$ | r | $ and is used to scan a string whose length is $ | s | $,
then it will run at speed\(::
.CHOOSE
$ O ( | r | ) $
.CHOOSE
$ O ( | r | + | s | ) $
.CHOOSE
$ O ( | r | times | s | ) $
.CHOOSE
$ O ( | s | ) $
.CHOOSE-END
.CHOOSE-BEGIN
The first instruction in a function will usually push what
register onto the function call stack\(??
.CHOOSE4 argument\~pointer frame\~pointer return\~address stack\~pointer
.CHOOSE-END
.CHOOSE-BEGIN
In C++, what data structure implements a hash table that allows a
key lookup to find an associated value\(??
.CHOOSE4V map set unordered_map unordered_set
.CHOOSE-END
.CHOOSE-BEGIN
The executable binary name of the C/C++ preprocessor is\(::
.CHOOSE4V /usr/bin/cccp /usr/bin/cpp /usr/bin/g++ /usr/bin/gcc
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
Which of the following items will cause a reduction action to
be added to the current state\(??
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
The grammar\(::
.br
$ A -> A x $
.br
$ A -> y $
.CHOOSE
is LR(0) but not SLR(1)
.CHOOSE
is SLR(1) but not LR(0)
.CHOOSE
is both LR(0) and SLR(1)
.CHOOSE
is neither LR(0) nor SLR(1)
.CHOOSE-END
.CHOOSE-BEGIN
What parsing action pops some number of items from the parsing
stack and then pushes a nonterminal onto that stack\(??
.CHOOSE4 accept error reduce shift
.CHOOSE-END
.CHOOSE-BEGIN
The address of a variable local to a function is
determined at \l'.3i' time.
.CHOOSE4 compile exec function\~call link
.CHOOSE-END
.CHOOSE-BEGIN
Given an NFA constructed via Thompson's construction,
which is then converted into a DFA using the subset construction,
but not mimimized,
the NFA will likely be [x] than the DFA,
and when used in scanning,
the NFA will likely run more [y] than the DFA.
.CHOOSE
[x] = larger, [y] = quickly
.CHOOSE
[x] = larger, [y] = slowly
.CHOOSE
[x] = smaller, [y] = quickly
.CHOOSE
[x] = smaller, [y] = slowly
.CHOOSE-END
.CHOOSE-BEGIN
On the x86-64, what is the alignment requirement for
.V= %rbp
and
.V= %rsp \(??
.CHOOSE4V \0\0\00x10 \0\00x100 \00x1000 0x10000
.CHOOSE-END
.CHOOSE-BEGIN
The Java virtual machine (JVM) interprets what kind of language\(??
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
Which of the following items has a transition which will be taken
during a reduction operation\(??
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
Which statement is true\(??
.CHOOSE 
All LR(k) languages are unambiguous.
.CHOOSE 
All context free languages are LR(k).
.CHOOSE 
Some LR(k) languages are ambiguous.
.CHOOSE 
Some regular languages are not LR(k).
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following problems can be solved using a context-free
grammar but not a regular grammar\(??
.CHOOSE
Detecting C++ double-slash
.=V ( // )
comments.
.CHOOSE
Detecting a plus or minus sign followed by one or more digits.
.CHOOSE
Detecting a sequence of one or more letters and digits,
beginning with a letter.
.CHOOSE
Detecting balanced parentheses.
.CHOOSE-END
.CHOOSE-BEGIN
Which grammar is ambiguous\(??
.CHOOSE
$ A -> A ~ x $
.br
$ A -> x $
.CHOOSE
$ A -> x ~ A $
.br
$ A -> x $
.CHOOSE
$ A -> A ~ A $
.br
$ A -> x $
.CHOOSE
$ A -> x ~ x $
.br
$ A -> x $
.CHOOSE-END
.CHOOSE-BEGIN
Which
.V= (flex)
pattern will recognize a double-slash
.=V ( // )
comment as in Java or C++\(??
.CHOOSE4FT CB \
/\^\(rs\^/\^\(rs\^[\(ha/\^n]* \
/\^\(rs\^/\^\(rs\^[\(ha\(rs\^n]* \
\(rs\^/\^\(rs\^/\^[\(ha/\^n]* \
\(rs\^/\^\(rs\^/\^[\(ha\(rs\^n]*
.CHOOSE-END
.LE
.FINISH
