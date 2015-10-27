.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-104A "Compiler Design I" Fall\~2014 Final\~Exam
.RCS "$Id: cmps104a-2014q4-exam3.mm,v 1.83 2014-12-09 16:59:07-08 - - $"
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
0.|S|\[->]|\[Do] P \[Do]
1.|P|\[->]|P ; E
2.|P|\[->]|
3.|E|\[->]|f ( L )
4.|E|\[->]|f ( )
5.|L|\[->]|L , E
6.|L|\[->]|E
_
.TE
.DE
.SP 10i
.LI
Assume free space is one large chunk of memory delimited by the
.V= free
pointer at the lower end and the
.V= end
pointer at the upper end.
Code a version of
.V= malloc
which allocates the number of bytes given by its argument and
updates 
.V= free
to point just past the area allocated.
The amount of space allocated must be a multiple of 16.
.SCORE-HERE 3
.SP 1.2i
.LI
After a call instruction, 
on entry to a function,
what machine instructions are executed to save the frame pointer
and allocate enough space for
.V= N
bytes on the stack\(??
What instructions are executed just prior to a return instruction
to remove the local stack frame from the function call stack\(??
The frame pointer is
.V= rbp
and the stack pointer is
.V= rsp .
.SCORE-HERE 2
.DS
.TS
allbox tab(|); lw(211.5p)e le.
Code on entry to the function|Code just before the return instruction
.SP .65i
|T{
.V= \0\0\0\0\0\0\0\0ret
T}
.TE
.DE
.LI
Draw deterministic finite \*[automata] for each of the following
.V= flex
regular expressions.
Use the minimum possible number of states.
.SCORE-HERE 3
.ALX i ()
.LI
.V= (a|b)*c
.SP 4v
.LI
.V= (abc)+
.SP 4v
.LI
.V= ab|cd
.SP 4v
.LE
.LI
Using
.V= bison
syntax,
define a context free LALR(1) grammar for the following
language\(::
.SCORE-HERE 2
.ALX a () "" 0
.LI
A program is a sequence of zero or more expressions,
each expression separated from the next by a semi-colon
.=V ( ; ).
The last expression is
.E= not
followed by a semi-colon.
.LI
An expression is an identifier followed by an argument list
enclosed in parentheses.
.LI
An argument list consists of a sequence of zero or more expressions.
If there are two or more expressions in the argument list,
consecutive expressions are separated by commas
.=V ( , ).
.LE
.SP 10i
.LI
Given the function presented here,
and following the project specifications\(::
.ALX a () "" 0
.LI
Draw the abstract syntax tree as for project 3.
Do not annotate with attributes.
Draw the tree in the empty space to the right of the first
two tables.
.SCORE-HERE 4
.LI
Fill in the the symbol table,
with associated attributes.
Just use plain names, 
without mangling.
Attributes are\(::
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
.V= lval ,
.V= const ,
.V= vreg ,
.V= vaddr .
.SCORE-HERE 2
.LI
Show the translated
.V= oil
code.
Just use plain names,
without mangling.
The table at the bottom of the page shows numbered boxes.
Write the
.V= oil
code in each box at the bottom of the page
whose number corresponds to the line numbers
in the program.
Name all temporaries (registers) as
.V= t1 ,
.V= t2 ,
.V= t3 ,
etc.,
without declaring their specific types.
.SCORE-HERE 4
.LE
.DS
.TS
tab(|); |r |lfCB |.
_
1.|int atoi (string s, int n) {
2.|   int v = 0;
3.|   int i = 0;
4.|   int z = ord '0';
5.|   while (i < n) {
6.|      v = v * 10 + ord s[i] - z;
7.|      i = i + 1;
8.|   }
9.|   return v;
10.|}
_
.TE
.DE
.DS
.TS
tab(|); |l |lw(127p) |, |lfCB |l |.
_
symbol|attributes
_
atoi
.SP 1v
_
s
.SP 1v
_
n
.SP 1v
_
v
.SP 1v
_
i
.SP 1v
_
z
.SP 1v
_
.TE
.DE
.DS
.TS
tab(|); |r lw(187p) |r lw(187p) |.
_
1.||6.
.SP 4.9v
_
2.||7.
.SP 2v
_
3.||8.
.SP 2v
_
4.||9.
.SP 2v
_
5.||10.
.SP 2v
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
Garbage collection might be expected to slow down a program by
about how much\(??
.CHOOSE4 \010% \050% 100% 200%
.CHOOSE-END
.CHOOSE-BEGIN
For object oriented programming with single inheritance only,
what is the expected space overhead per object allocated\(??
.CHOOSE
one pointer per class table
.CHOOSE
one pointer per instance field
.CHOOSE
one pointer per object
.CHOOSE
one pointer per virtual function
.CHOOSE-END
.CHOOSE-BEGIN
Given the declarations
.V= int\~i
and
.V= int*\~p ,
which expression is in error\(??
.CHOOSE4V i+p i-p p+i p-i
.CHOOSE-END
.CHOOSE-BEGIN
In a classical Unix memory map of a process,
which segment will be allocated to the highest addresses\(??
.CHOOSE4 data heap stack text
.CHOOSE-END
.CHOOSE-BEGIN
If $N$ is the set of languages recognizable by a nondeterministic
finite automaton and $D$ is the set of languages recognizable
by a deterministic finite automaton,
then\(::
.CHOOSE
$ N subset D $
.CHOOSE
$ N = D $
.CHOOSE
$ N supset D $
.CHOOSE
none of the above
.CHOOSE-END
.CHOOSE-BEGIN
On the x86-64, what is the alignment requirement (in bytes) for
.V= rsp
and
.V= rbp \(??
.CHOOSE4 \0\0\0\0\0\00x10 \0\0\0\00x1000 \0\00x100000 0x10000000
.CHOOSE-END
.CHOOSE-BEGIN
On the x86-64, what is the page size (in bytes)\(??
.CHOOSE4 \0\0\0\0\0\0\016 \0\0\0\0\04096 \0\01048576 268435456
.CHOOSE-END
.CHOOSE-BEGIN
The virtual address of a static variable is determined at \l'.3i' time.
.CHOOSE4 compile link exec debugging
.CHOOSE-END
.CHOOSE-BEGIN
The largest class of grammars whose characteristic finite state machine
(CFSM) is the same size as the LR(0) CSFM is\(::
.CHOOSE4 LALR(1) LR(0) LR(1) SLR(1)
.CHOOSE-END
.CHOOSE-BEGIN
Which grammar is unambiguous,
allows for an arbitrary large number of $x$s,
and makes the $+$ operator left associative\(??
.CHOOSE
$ E ~ -> ~ E + x ~ ~ left | ~ ~ x $
.CHOOSE
$ E ~ -> ~ E + E ~ ~ left | ~ ~ x $
.CHOOSE
$ E ~ -> ~ x + E ~ ~ left | ~ ~ x $
.CHOOSE
$ E ~ -> ~ x + x ~ ~ left | ~ ~ x $
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following items was added to a set of items
during a closure operation\(??
.CHOOSE
$ E -> ~ \[bu] ~ E + T $
.CHOOSE
$ E -> E ~ \[bu] ~ + T $
.CHOOSE
$ E -> E + ~ \[bu] ~ T $
.CHOOSE
$ E -> E + T ~ \[bu] ~ $
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following items will cause all rules of the form
$ T -> beta $
to be added as items of the form
$ T -> ~ \[bu] ~ beta $,
where $beta elem V sup { size 9 "\v'2p'*\v'-2p'" }$\(??
.CHOOSE
$ E -> ~ \[bu] ~ E + T $
.CHOOSE
$ E -> E ~ \[bu] ~ + T $
.CHOOSE
$ E -> E + ~ \[bu] ~ T $
.CHOOSE
$ E -> E + T ~ \[bu] ~ $
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
The register that points at the local data area of the function
in which the current function is nested is called\(::
.CHOOSE4 dynamic\~link frame\~pointer return\~address static\~link
.CHOOSE-END
.CHOOSE-BEGIN
In a typical implementation of
.V= malloc (3),
what is the usual boundary tag overhead per allocation\(??
.CHOOSE4 2\~bytes 2\~pages 2\~pointers 2\~strings
.CHOOSE-END
.CHOOSE-BEGIN
If parameters are passed on the stack,
as in the x86 32-bit address space,
what might be a reasonable address of one of the incoming
parameters\(??
.CHOOSE4V +8(ebp) +8(esp) -8(ebp) -8(esp)
.CHOOSE-END
.CHOOSE-BEGIN
If 
.V= malloc (3)
runs out of heap space,
what system call can be used to request more space from the kernel\(??
.CHOOSE8V= brk (2) creat (2) execve (2) fork (2)
.CHOOSE-END
.CHOOSE-BEGIN
In garbage collection terminology,
reachable objects are\(::
.CHOOSE
all variables local to any function on the function call stack.
.CHOOSE
objects in a reference counting environment excluding cyclic references.
.CHOOSE
objects on the heap accessible from the closure of the root set.
.CHOOSE
static variables local to a given file, excluding external variables.
.CHOOSE-END
.CHOOSE-BEGIN
What will detect the error in the following Java statements\(??
.VTCODE* 0 "Object o = new Integer (3);"
.VTCODE* 0 "String s = (String) o;"
.CHOOSE
the parser
.CHOOSE
the type checker
.CHOOSE
the code generator
.CHOOSE
the runtime library
.CHOOSE-END
.CHOOSE-BEGIN
The Java virtual machine (JVM) interpreter uses what kind of
intermediate format\(??
.CHOOSE
abstract syntax tree
.CHOOSE
stack machine code
.CHOOSE
three-address code
.CHOOSE
two-address code
.CHOOSE-END
.CHOOSE-BEGIN
Given that $ V = V sub N union V sub T $,
if a grammar has rules of the form $ A -> beta $,
then
.CHOOSE
$ A elem V sub N $ and $ beta elem V sup { size 9 "\v'2p'*\v'-2p'" } $
.CHOOSE
$ A elem V $ and $ beta elem V sub N sup + $
.CHOOSE
$ A elem V $ and $ beta elem V sup + $
.CHOOSE
$ A elem V sub T $ and $ beta elem V sup { size 9 "\v'2p'*\v'-2p'" } $
.CHOOSE-END
.CHOOSE-BEGIN
Putting reserved words into a
.V= flex
scanner instead of recognizing them as identifiers and
looking them up in a separate table will have what effect\(??
.CHOOSE
Makes the DFA run more quickly.
.CHOOSE
Makes the DFA run more slowly.
.CHOOSE
Makes the DFA take up less memory.
.CHOOSE
Makes the DFA take up more memory.
.CHOOSE-END
.CHOOSE-BEGIN
What is prohibited in a deterministic finite \*[automaton]\(??
.CHOOSE
\[*e]-transitions
.CHOOSE
cycles in the graph
.CHOOSE
multiple final states
.CHOOSE
all of the above
.CHOOSE-END
.CHOOSE-BEGIN
The following grammar is\(::
.br
$ A -> A + A $
.br
$ A -> A * A $
.br
$ A -> x $
.CHOOSE4 LALR(1) LL(1) ambiguous regular
.CHOOSE-END
.CHOOSE-BEGIN
Which is an example of something recognizable by the following
grammar\(??
.br
$ A -> A ~ x ~ | ~ y $
.CHOOSE4 xxxxxxxxy xyyyyyyyy yxxxxxxxx yyyyyyyyx
.CHOOSE-END
.LE
.FINISH
