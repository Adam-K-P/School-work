.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-112 "Comparative Programming Languages" Fall\~2014 \
Final\~Exam
.RCS "$Id: cmps112-2014q4-exam3.mm,v 1.115 2014-12-11 13:23:31-08 - - $"
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
.ds Fdagger \v'-.1v'\[dg]\v'+.1v'
.ALX 1 . 3
.LI
.E= Ocaml.
Define the function
.V= reverse
which reverses a list.
Use an inner function that is tail recursive.
Do not use a higher-order function.
.SCORE-HERE 2
.TVCODE* 0 "val reverse : 'a list -> 'a list"
.SP 1.3i
.LI
.E= Ocaml.
Define the functions
.V= reverse
and
.V= sum
using
.V= fold_left .
(Fill in the blanks.)
.SCORE-HERE 3
.TVCODE 0 "# " "List.fold_left;;"
.TVCODE 0 "- : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a"
.SP .1i
.TVCODE 0 "# " "let reverse = List.fold_left \l'4i';;"
.TVCODE 0 "val reverse : '_a list -> '_a list"
.SP .1i
.TVCODE 0 "# " "let sum = List.fold_left \l'4i';;"
.TVCODE 0 "val sum : int list -> int"
.SP .1i
.TVCODE 0 "# " "let length = List.fold_left \l'4i';;"
.TVCODE 0 "val length : '_a list -> int"
.LI
.E= Ocaml.
The Collatz conjecture states that for any positive integer $n$,
if it is replaced by $ n / 2 $ when even and $ 3 n + 1 $ when odd,
that the sequence eventually converges on $1$.
Write a function which uses a tail-recursive inner function to
return a list of all integers starting from the argument and
ending with 1.
The inner function produces the list in reverse order,
but the result is reversed by the outer function.
.SCORE-HERE 3
.TVCODE* 0 "# " "collatz;;"
.TVCODE* 0 "- : int -> int list"
.TVCODE* 0 "# " "collatz 1;;"
.TVCODE* 0 "- : int list = [1]"
.TVCODE* 0 "# " "collatz 2;;"
.TVCODE* 0 "- : int list = [2; 1]"
.TVCODE* 0 "# " "collatz 3;;"
.TVCODE* 0 "- : int list = [3; 10; 5; 16; 8; 4; 2; 1]"
.SP .3i
.LI
.E= Scheme.
Write a function
.V= take
in Scheme which will make a copy of the first $n$ elements of a list.
If there are fewer than $n$ elements in the list,
it returns the complete list.
If $n <= 0$ it returns the empty list.
.SCORE-HERE 2
.DS
.ft CB
(define (take n list)
.DE
.SP 10i
.LI
.E= Ocaml,
or any functional language.
Rules about type checking.
.ALX i () "" 0
.LI
Every expression has exactly one type.
.LI
When an expression is evaluated,
exactly one of four general things may happen.
List them.
.SCORE-HERE 2
.ALX a ()
.LI
.SP 1.5v
.LI
.SP 1.5v
.LI
.SP 1.5v
.LI
.SP 1.5v
.LE
.LE
.LI
.E= \[*l]-calculus.
For both applicative and normal order,
perform \[*b]-reduction on the following expression.
.SCORE-HERE 2
.DS
.TS
tab(|); |lew(214p) |le |.
_
Applicative order|Normal order
_
T{
$ ( lambda x . ~ ~ * ~ x ~ x ) ~ ( + ~ 2 ~ 3 ) $
T}|T{
$ ( lambda x . ~ ~ * ~ x ~ x ) ~ ( + ~ 2 ~ 3 ) $
T}
.SP 1i
_
.TE
.DE
.LI
.E= Ocaml.
Given the function at the left,
fill in the table at the right giving the Ocaml types for each item.
.SCORE-HERE 2
.DS
.TS
tab(|); l l l, ltfCB |lfCB |lw(216p) |, ^ |lfCB |l |.
|_|_
T{
let fac n =
    if n < 0
    then failwith "fac n | n < 0"
    else let rec fac' n' m' =
             if n' = 0
             then m'
             else fac' (n' - 1) (n' * m')
         in fac' n 1
;;
T}|fac
|_|_
|n
|_|_
|0
|_|_
|fac'
|_|_
|n'
|_|_
|m'
|_|_
|-
|_|_
|*
|_|_
.TE
.DE
.LI
.E= Prolog.
Given the graph shown here,
write
.V= edge
facts to describe it.
Write a rule
.V= adjacent
which uses
.V= edge
to determine if two nodes are adjacent.
.SCORE-HERE 2
.DS
.PS 0.75i
A: circle "a"
B: circle "b" at A+(-4*circlerad,-4*circlerad)
C: circle "c" at A+(0,-4*circlerad)
D: circle "d" at A+(4*circlerad,-4*circlerad)
line from A to B chop
line from A to C chop
line from A to D chop
line from B to C chop
line from C to D chop
.PE
.DE
.SP .3i
.LI
.E= Scheme.
Define the functions
.V= map
and
.V= filter.
.SCORE-HERE 2
.TVCODE* 0 "> " "(map (lambda (n) (+ 1 n)) '(3 4 5))"
.TVCODE* 0 "(4 5 6)"
.TVCODE* 0 "> " "(filter (lambda (n) (> n 4)) '(3 4 5 6 7))"
.TVCODE* 0 "(5 6 7)"
.SP 10i
.LI
.E= Perl.
Write a script in Perl which will iterate over all of the
input files given on the command line and print the contents
of all of the files to the standard output.
If no files are specified, copy the standard input.
You are limited to
.E= one
statement only.
Hint\(::
Use
.V= <> .
.SCORE-HERE 1
.DS
.ft CB
#!/usr/bin/perl
.DE
.SP .5i
.LI
.E= Prolog.
Given facts like the ones presented at the left,
define the rules
.V= father
and
.V= mother
where the first argument is the parent and the second argument is
the child.
.SCORE-HERE 2
.DS
.ft CB
parents(henry_vii,elizabeth_of_york,henry_viii).
parents(henry_viii,catherine_of_aragon,mary_i).
parents(henry_viii,anne_boleyn,elizabeth_i).
parents(henry_viii,jane_seymour,edward_vi).
| ?- father(X,henry_viii).
X = henry_vii
| ?- father(henry_viii,X).
X = mary_i
X = elizabeth_i
X = edward_vi
.DE
.LI
Define a function
.V= range
with two integer arguments and which returns a list of
all arguments in order including the two arguments.
If the first number is larger than the second,
return an empty list.
.SCORE-HERE 3
.ALX a ()
.LI
.E= Ocaml.
.TVCODE* 0 "# " "range 2 7;;"
.TVCODE* 0 "- : int list = [2; 3; 4; 5; 6; 7]"
.TVCODE* 0 "# " "range 7 2;;"
.TVCODE* 0 "- : int list = []"
.LI
.E= Scheme.
.TVCODE* 0 "> " "(range 2 7)"
.TVCODE* 0 "(2 3 4 5 6 7)"
.TVCODE* 0 "> " "(range 7 2)"
.TVCODE* 0 "()"
.LI
.E= Perl.
.TVCODE* 0 "print \[Dq][@{[range(2,7)]}]\[rs]n\[Dq];"
.TVCODE* 0 "[2 3 4 5 6 7]"
.TVCODE* 0 "print \[Dq][@{[range(7,2)]}]\[rs]n\[Dq];"
.TVCODE* 0 "[]"
.LE
.LI
Write a function that takes two lists as arguments and which
returns a single list where each element is a list of corresponding
pairs.
If the lists are of different lengths,
trailing elements of the longer list are ignored.
.ALX a ()
.LI
.E= Scheme.
.SCORE-HERE 2
.TVCODE* 0 "> " "(pairthem '(1 2 3 4) '(a b c d e))"
.TVCODE* 0 "((1 a) (2 b) (3 c) (4 d))"
.TVCODE* 0 "> " "(pairthem '(1 2 3 4 5) '(a b))"
.TVCODE* 0 "((1 a) (2 b))"
.SP .2i
.LI
.E= Ocaml.
.SCORE-HERE 2
.TVCODE* 0 "# " "pairthem [1;2;3] ['a';'b';'c';'d'];;"
.TVCODE* 0 "- : (int * char) list = [(1, 'a'); (2, 'b'); (3, 'c')]"
.TVCODE* 0 "# " "pairthem [1;2;3;4;5] ['a';'b'];;"
.TVCODE* 0 "- : (int * char) list = [(1, 'a'); (2, 'b')]"
.SP .2i
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
.char \[QQ] \s+2'\s-2\h'-1p'
.CHOOSE-BEGIN
What is
.E= not
to be avoided in a pure functional language\(??
.CHOOSE4 goto lambda loops variables
.CHOOSE-END
.CHOOSE-BEGIN
Which languages do not have parametric polymorphism\(??
.CHOOSE4 C++ Java Ocaml Smalltalk
.CHOOSE-END
.CHOOSE-BEGIN
What is the expected running time of fold left and fold right
on a list of length $n$\(??
.CHOOSE
fold left $ O ( 1 ) $\(;;
fold right $ O ( 1 ) $
.CHOOSE
fold left $ O ( 1 ) $\(;;
fold right $ O ( n ) $
.CHOOSE
fold left $ O ( n ) $\(;;
fold right $ O ( 1 ) $
.CHOOSE
fold left $ O ( n ) $\(;;
fold right $ O ( n ) $
.CHOOSE-END
.CHOOSE-BEGIN
What is the required amount of stack space for fold left and fold right
on a list of length $n$\(??
.CHOOSE
fold left $ O ( 1 ) $\(;;
fold right $ O ( 1 ) $
.CHOOSE
fold left $ O ( 1 ) $\(;;
fold right $ O ( n ) $
.CHOOSE
fold left $ O ( n ) $\(;;
fold right $ O ( 1 ) $
.CHOOSE
fold left $ O ( n ) $\(;;
fold right $ O ( n ) $
.CHOOSE-END
.CHOOSE-BEGIN
If
.V= guess
is a predicate that searches a database to return one of its elements,
and
.V= verify
checks to see if the thing found is good,
then we may define the predicate
.V= find ,
which returns a valid entry from the database as\(::
.CHOOSE
.V= "find(X) :- guess(X), verify(X)."
.CHOOSE
.V= "find(X) :- guess(X)."
.br
.V= "find(X) :- verify(X)."
.CHOOSE
.V= "find(X) :- verify(X), guess(X)."
.CHOOSE
.V= "guess(X) :- find(X), verify(X)."
.CHOOSE-END
.CHOOSE-BEGIN
What is the type of
.V= List.map \(??
.CHOOSE4V "('a -> 'b -> 'a) -> 'a -> 'b list -> 'a" \
"('a -> 'b -> 'b) -> 'a list -> 'b -> 'b" \
"('a -> 'b) -> 'a list -> 'b list" \
"('a -> bool) -> 'a list -> 'a list"
.CHOOSE-END
.CHOOSE-BEGIN
In Smalltalk,
the expression
.V= 3+4
means\(::
.CHOOSE
The message
.V= +4
is sent to the object
.V= 3 .
.CHOOSE
The message
.V= 3
is sent to the function
.V= + ,
the result of which is a function to which the message
.V= 4
is sent.
.CHOOSE
The same as
.V= (+)3\~4 .
.CHOOSE
The tuple message
.V= (3,4)
is sent to the object
.V= + .
.CHOOSE-END
.CHOOSE-BEGIN
What is the type of the Ocaml function
.br
.V= "let g () = 3;;"
.CHOOSE4V "int * unit" "int -> unit" "unit * int" "unit -> int"
.CHOOSE-END
.CHOOSE-BEGIN
Unification is a part of the static type checking algorithm used by
compilers of\(??
.CHOOSE4 "C and C++" "Java and Smalltalk" "ML and Ocaml" \
"Perl and Python"
.CHOOSE-END
.CHOOSE-BEGIN
When a garbage collector forms the closure of the root set,
it identifies all \l'.3i' objects on the heap.
.CHOOSE4 dead live reachable unreachable
.CHOOSE-END
.CHOOSE-BEGIN
A C++ compiler does object-oriented dynamic dispatch via\(::
.CHOOSE4 "default memory allocator" "help-allocated closure" \
"inferential type indicator" "virtual function table"
.CHOOSE-END
.CHOOSE-BEGIN
``Structured Programming with goto Statements''
.CHOOSE4 "Edsger Dijkstra" "C.A.R.\& Hoare" \
"Donald Knuth" "Niklaus Wirth"
.CHOOSE-END
.LE
.SP 10i
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
.char \[QQ] \s+2'\s-2\h'-1p'
.CHOOSE-BEGIN
Which language is not completely strongly typed\(??
.CHOOSE4 C++ Perl Scheme Smalltalk
.CHOOSE-END
.CHOOSE-BEGIN
What is a comment in Ocaml\(??
.CHOOSE4V (*...*) /*...*/ //...  ;;...
.CHOOSE-END
.CHOOSE-BEGIN
What kind of garbage collection fails on cyclic data structures\(??
.CHOOSE4 "copying with semispaces" "generational" "mark and sweep" \
"reference counting"
.CHOOSE-END
.CHOOSE-BEGIN
In Ocaml, what is the type of
.V= (/.) \(??
.CHOOSE4V "float * float * float" "float * float -> float" \
"float -> float * float" "float -> float -> float"
.CHOOSE-END
.CHOOSE-BEGIN
In Java or C++,
which statement can cause control to pass from the current
function to the calling function,
or perhaps the caller of the caller,
or perhaps even all the way back to the main function\(??
.CHOOSE4V break continue return throw
.CHOOSE-END
.CHOOSE-BEGIN
A static (access) link is\(::
.CHOOSE
a pointer to the instruction which called the current function.
.CHOOSE
a pointer to the next free byte of storage on the heap.
.CHOOSE
a pointer to the stack frame in which the current function is nested.
.CHOOSE
a pointer to the stack frame of the caller of the current function.
.CHOOSE-END
.CHOOSE-BEGIN
Which is a fully curried lazy functional language with overloading\(??
.CHOOSE4 Haskell Ocaml Scheme Smalltalk
.CHOOSE-END
.CHOOSE-BEGIN
Given the Smalltalk statement
.V= "a:=[:x|x+1]."
.br
What expression would return the number 4\(??
.CHOOSE4V "3 to: a." "a 3." "a at: 3." "a value: 3."
.CHOOSE-END
.CHOOSE-BEGIN
In Perl, what will print the current date and time\(??
.CHOOSE4V "print \[Dq]date\[Dq];" "print 'date';" "print (date);" \
"print `date`;"
.CHOOSE-END
.CHOOSE-BEGIN
What is not false in Perl\(??
.CHOOSE4V 0 0.0/0.0 \[Dq]\[Dq] undef
.CHOOSE-END
.CHOOSE-BEGIN
In Smalltalk, what is 
.V= 9 \(??
.CHOOSE4V "(4 + 5) value." "[4 + 5] value." "\[Dq]4 + 5\[Dq] value." \
"{4 + 5} value."
.CHOOSE-END
.CHOOSE-BEGIN
``Go To Statement Considered Harmful''
.CHOOSE4 "Edsger Dijkstra" "C.A.R.\& Hoare" \
"Donald Knuth" "Niklaus Wirth"
.CHOOSE-END
.LE
.FINISH
