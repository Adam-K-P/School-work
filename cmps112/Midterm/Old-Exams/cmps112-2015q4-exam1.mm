.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-112 "Comparative Programming Languages" Fall\~2015 Test\~#1
.RCS "$Id: cmps112-2015q4-exam1.mm,v 1.52 2015-10-21 14:42:06-07 - - $"
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
.ALX 1 . 3
.LI
What are the very general possibilities that a function might
exhibit when called\(??
.SCORE-HERE 2
.ALX a ()
.LI
.LI
.LI
.LI
.LE
.LI
Define the function
.V= filter
whose first argument is a predicate and whose second argument
is a list.
It returns a list consisting of all elements of the argument list
which satisfy the predicate.
Do not use a higher-order function.
.ALX a ()
.LI
.E= Scheme.
.SCORE-HERE 2
.TVCODE* 0 "> " "(filter (lambda (x) (> x 0)) '(1 -1 2 -3 5 -99 8))"
.TVCODE* 0 "(1 2 5 8)"
.TVCODE* 0 "> " "(filter even '(1 2 3 4 5 6 7 8 9))"
.TVCODE* 0 "(2 4 6 8)"
.LI
.E= Ocaml.
.SCORE-HERE 2
.TVCODE* 0 "# " "filter;;"
.TVCODE* 0 "- : ('a -> bool) -> 'a list -> 'a list = <fun>"
.TVCODE* 0 "# " "filter (fun x -> x > 0) [1;-1;2;-3;5;-99;8];;"
.TVCODE* 0 "- : int list = [1; 2; 5; 8]"
.TVCODE* 0 "# " "filter even [1;2;3;4;5;6;7;8;9];;"
.TVCODE* 0 "- : int list = [2; 4; 6; 8]"
.LE
.LI
Define the function
.V= length ,
which returns the length of a list.
Use tail-recursion\(::
the function must use $ O ( 1 ) $ stack.
Do not use a higher-order function.
.ALX a ()
.LI
.E= Scheme.
.SCORE-HERE 1
.TVCODE* 0 "> " "(length '(1 2 3 4 5))"
.TVCODE* 0 "5"
.LI
.E= Ocaml.
.SCORE-HERE 1
.TVCODE* 0 "# " "length;;"
.TVCODE* 0 "- : 'a list -> int = <fun>"
.TVCODE* 0 "# " "length [1;2;3;4;5];;"
.TVCODE* 0 "- : int = 5"
.LE
.LI
Code
.V= sub'
according to the specifications of the project.
Assume that the number of larger magnitude is the first argument,
and the carry is the third argument.
Assume
.V= sub
has taken care of the signs so that
.V= sub'
does not need to do so.
.SCORE-HERE 2
.TVCODE* 0 "val sub' : int list -> int list -> int -> int list"
.SP 10i
.LI
Define the function
.V= fold_left \(::
the first argument is a function to use to fold the list,
the second argument is a unit value used to fold the first element,
the third argument is a list.
Use tail recursion\(::
the function must use $ O ( 1 ) $ stack.
.ALX a ()
.LI
.E= Scheme.
.SCORE-HERE 2
.TVCODE* 0 "> " \
"(define (length list) (fold_left (lambda (n _) (+ n 1)) 0 list))"
.TVCODE* 0 "> " "(define (sum list) (fold_left + 0 list))"
.TVCODE* 0 "> " "(length '(1 2 3 4 5))"
.TVCODE* 0 "5"
.TVCODE* 0 "> " "(sum '(1 2 3 4 5))"
.TVCODE* 0 "15"
.LI
.E= Ocaml.
.SCORE-HERE 2
.TVCODE* 0 "# " "fold_left;;
.TVCODE* 0 "- : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a = <fun>"
.TVCODE* 0 "# " \
"let length list = fold_left (fun n _ -> n + 1) 0 list;;"
.TVCODE* 0 "val length : 'a list -> int = <fun>"
.TVCODE* 0 "# " "let sum list = fold_left (+) 0 list;;"
.TVCODE* 0 "val sum : int list -> int = <fun>"
.TVCODE* 0 "# " "length [1;2;3;4;5];;"
.TVCODE* 0 "- : int = 5"
.TVCODE* 0 "# " "sum [1;2;3;4;5];;"
.TVCODE* 0 "- : int = 15"
.LE
.LI
Define the function
.V= reverse
which produces a list in reverse order to that of its argument.
The function must use $ O ( 1 ) $ stack.
You may use a tail-recursive function,
or make it very simple by a call to
.V= fold_left .
.br
.UL "\f[BI]Bonus points\(::\fP"
These two ``reverse'' questions are worth
.E= "3 points each" ,
not
.E= "2 points" ,
if you correctly define them in terms of
.V= fold_left
instead of writing a recursive function.
.br
.ALX a ()
.LI
.E= Scheme.
.SCORE-HERE 2
.=E \0 "(3 points if you use"
.V= fold_left
.E= correctly.)
.TVCODE* 0 "> " "(reverse \&'(1 2 3 4 5))"
.TVCODE* 0 "(5 4 3 2 1)"
.TVCODE* 0 "> " "(reverse \&'())"
.TVCODE* 0 "()"
.SP .5i
.LI
.E= Ocaml.
.SCORE-HERE 2
.=E \0 "(3 points if you use"
.V= fold_left
.E= correctly.)
.TVCODE* 0 "# " "reverse;;"
.TVCODE* 0 "- : \&'a list -> \&'a list = <fun>"
.TVCODE* 0 "# " "reverse [1;2;3;4;5];;"
.TVCODE* 0 "- : int list = [5; 4; 3; 2; 1]"
.TVCODE* 0 "# " "reverse [];;"
.TVCODE* 0 "- : \&'a list = []"
.SP .5i
.LE
.LI
.E= C
or
.E= C++.
Code the function in C or C++ to reverse a list.
Do not allocate or free any memory.
Do not cause memory leak or use uninitialized memory.
Assume the nodes are properly initialized as a valid linked list.
Use $ O ( 1 ) $ stack space.
.SCORE-HERE 2
.DS
.TS
tab(|); lfCB |lfCB.
T{
typedef struct node node;
struct node {
   int value;
   node* link;
};
T}|T{
node* reverse (node* head) {
T}
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
.if t .ds Fmark \v'-.3v'\[dg]\v'+.3v'
.if n .ds Fmark *
.ALX 1 . 4
.CHOOSE-BEGIN
What kind of polymorphism is exhibited by generic classes in Java
and template classes in C++\(??
.CHOOSE4 conversion inheritance overloading parametric
.CHOOSE-END
.CHOOSE-BEGIN
What is
.V= "((lambda (f x) (f x)) + 3)" \(??
.CHOOSE4V "\&'(+ 3)" "\&'(f x)" 3 6
.CHOOSE-END
.CHOOSE-BEGIN
What is type of
.V= (+)
in Ocaml\(??
.CHOOSE4V "int * int * int" "int * int -> int" "int -> int * int" \
"int -> int -> int"
.CHOOSE-END
.CHOOSE-BEGIN
What is\(??
.br
.V= "(car (cdr (cons \&'(1 2 3) \&'(4 5 6))))"
.CHOOSE4V "\&'(1 2 3)" "\&'(4 5 6)" 1 4
.CHOOSE-END
.CHOOSE-BEGIN
In Ocaml, what is the type of
.V= [1;2;3;4] \(??
.CHOOSE4V "(list int)" "int list" "list->int" "list<int>"
.CHOOSE-END
.CHOOSE-BEGIN
The type system in Scheme are\(::
.CHOOSE4 "strong and dynamic" "strong and static" "weak and dynamic" \
"weak and static"
.CHOOSE-END
.if t .SP 10i
.CHOOSE-BEGIN
The type system in Ocaml are\(::
.CHOOSE4 "strong and dynamic" "strong and static" "weak and dynamic" \
"weak and static"
.CHOOSE-END
.CHOOSE-BEGIN
In C, C++, and Java,
which operator is lazy\(??
.CHOOSE4V ++ -- // ||
.CHOOSE-END
.CHOOSE-BEGIN
What is 2\(??
.CHOOSE4V "(caar '(1 2 3))" "(cadr '(1 2 3))" "(cdar '(1 2 3))" \
"(cddr '(1 2 3))"
.CHOOSE-END
.CHOOSE-BEGIN
Lisp and Scheme, in general form, are based on a form of mathematics
first formulated by Alonzo Church.
.CHOOSE4 \[*l]-calculus \[*m]-calculus \[*p]-calculus \[*q]-calculus
.CHOOSE-END
.CHOOSE-BEGIN
Which feature of imperative languages\*[Fmark] is missing
from Scheme\(??
.CHOOSE4 conditionals functions loops variables
.CHOOSE-END
.CHOOSE-BEGIN
In 1968, Edsger W.\& Dijkstra published a paper entitled
``\l'.3i' statement considered harmful''.
.CHOOSE4V call goto switch throw
.CHOOSE-END
.LE
.FS \*[Fmark]
.in 1.5n
.S "" -2.5
.E= EWD498\(::
.E= "How do we tell truths that might hurt\(??"
Prof.\& Dr.\& Edsger W.\& Dijkstra,
June 1975.
.ALX \[bu] 0 2 0 0
.LI
FORTRAN,
``the infantile disorder'',
by now nearly 20 years old,
is hopelessly inadequate for whatever computer application you have in
mind today\(::
it is now too clumsy, too risky, and too expensive to use.
.LI
PL/I,
``the fatal disease'',
belongs more to the problem set than to the solution set. 
.LI
It is practically impossible to teach good programming to students that
have had a prior exposure to BASIC\(::
as potential programmers they are mentally mutilated beyond hope of
regeneration.
.LI
The use of COBOL cripples the mind\(;;
its teaching should, therefore, be regarded as a criminal offence. 
.LE
.br
.S "" +2.5
.FE
.FINISH
