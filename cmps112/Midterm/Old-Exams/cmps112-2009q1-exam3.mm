.so Tmac.mm-etc
.RCS "$Id: cmps112-2009q1-exam3.mm,v 9.34 2009-03-13 23:05:44-07 - - $"
.EXAM 5 CMPS-112 "Comparative Programming Languages" Winter\~2009 \
Final\~Exam
.nr SPACE_FOR_ANSWERS 1
.DS
.PS
examboxes(5,52)
.PE
.DE
.hw de-fined
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
.ALX 1 . 4
.LI
Give an example of how a function call in normal order might
return a result,
but the same function call in applicative order might crash
or go into an infinite loop.
.SCORE_HERE 2
.SPACE 1i
.LI
.E= C++\(::
Write code to print out the elements of a vector,
one item per line.
Assume that
.V= operator<<
is defined on type 
.V= foo .
Use a
.V= const_iterator .
.SCORE_HERE 2
.VCODE* 0 "vector<foo> vec;"
.SPACE 1i
.LI
.E= Perl\(::
Write a function that will accept a function and an array
and return all elements of the array in the same order,
for which the function applied to an element of the array returns true.
.SCORE_HERE 2
.SPACE 1i
.LI
.E= Prolog\(::
Draw a picture of the undirected graph represented by the facts
given below.
Write a function
.V= adjacent
which will succeed if two nodes in the graph are adjacent to
each other.
.SCORE_HERE 2
.VCODE* 0 "edge(a,b)."
.VCODE* 0 "edge(b,c)."
.VCODE* 0 "edge(c,d)."
.VCODE* 0 "edge(d,a)."
.VCODE* 0 "edge(a,c)."
.SPACE .25i
.LI
.E= Prolog\(::
Write
.V= drop/3
such that it returns all elements of the second argument,
starting with the one that matches the first argument,
or none, if none match.
The third argument is the result.
.SCORE_HERE 2
.TVCODE* 0 "| ?- " "drop(3,[5,4,3,2,1],X)."
.TVCODE* 0 "X = [3,2,1]"
.TVCODE* 0 "| ?- " "drop(9,[1,2,3],X)."
.TVCODE* 0 "X = []"
.TVCODE* 0 "| ?- " "drop(1,[1,2,3,4],X)."
.TVCODE* 0 "X = [1,2,3,4]"
.SPACE 10i
.LI
.E= Ocaml\(::
Define the function
.V= merge
which takes a predicate as an argument and a pair of sorted lists.
The result is a single list in sorted order.
.SCORE_HERE 3
.TVCODE 0 "# " "merge;;"
.TVCODE 0 "- : ('a -> 'a -> bool) -> 'a list -> 'a list -> 'a list
.TVCODE 0 "# " "merge (<) [1;3;5] [2;4;8;9];;"
.TVCODE 0 "- : int list = [1; 2; 4; 4; 8; 9; 9]"
.SPACE 1.0i
.LI
.E= Ocaml\(::
Define the function
.V= sum
in terms of
.V= List.fold_left
in a curried manner to sum a list of integers.
Do not write a recursive function.
.SCORE_HERE 1
.TVCODE 0 "# " "sum;;"
.TVCODE 0 "- : int list -> int"
.TVCODE 0 "# " "sum [1;2;3;4;5];;"
.TVCODE 0 "- : int = 15"
.LI
.E= Ocaml\(::
Define the function
.V= zip
whose arguments are a curried pair of lists and whose result
is a list of tuples.
Raise
.V= Invalid_argument
if the lengths are different.
.SCORE_HERE 2
.ds FOO \[Dq]foo\[Dq]
.ds BAR \[Dq]bar\[Dq]
.ds BAZ \[Dq]baz\[Dq]
.TVCODE* 0 "# " "zip;;"
.TVCODE* 0 "- : 'a list -> 'b list -> ('a * 'b) list"
.TVCODE* 0 "# " "zip [1;2;3] [\*[FOO];\*[BAR];\*[BAZ]];;"
.TVCODE* 0 \
"- : (int * string) list = [(1, \*[FOO]); (2, \*[BAR]); (3, \*[BAZ])]"
.TVCODE* 0 "# " "zip [1;2;3] [];;"
.TVCODE* 0 "Exception: Invalid_argument \[Dq]length mismatch\[Dq]."
.SPACE 0.8i
.LI
.E= Ocaml\(::
Define the function 
.V= map ,
which a unary function to a list and returns the list of results.
Use recursion.
Do not use a higher-order function.
.SCORE_HERE 2
.TVCODE* 0 "# " "map;;"
.TVCODE* 0 "- : ('a -> 'b) -> 'a list -> 'b list"
.TVCODE* 0 "# " "map ((+)2) [1;2;3;4];;"
.TVCODE* 0 "- : int list = [3; 4; 5; 6]"
.SPACE 1.0i
.LI
.E= Ocaml\(::
Write the function
.V= reverse
which reverses list.
Do not use any higher-order functions.
Your function must be tail-recursive or use a
local tail-recursive helper.
.SCORE_HERE 2
.TVCODE* 0 "# " "reverse;;"
.TVCODE* 0 "- : 'a list -> 'a list"
.TVCODE* 0 "# " "reverse [1;2;3];;"
.TVCODE* 0 "- : int list = [3; 2; 1]"
.SPACE 10i
.LI
.E= Ocaml\(::
Write a function
.BR iota
which has an integer argument $n$ and returns a list of numbers
from $1$ to $n$ inclusive.
The empty list is returned for non-positive numbers.
Use a local helper function to make your solution tail-recursive.
.SCORE_HERE 2
.TVCODE* 0 "# " "iota;;"
.TVCODE* 0 "- : int -> int list = <fun>"
.TVCODE* 0 "# " "iota 5;;"
.TVCODE* 0 "- : int list = [1; 2; 3; 4; 5]"
.TVCODE* 0 "# " "iota (-5);;"
.TVCODE* 0 "- : int list = []"
.SPACE 0.5i
.LI
Give an example of one function nested inside another,
where the inner function refers to a local variable of
the outer function in such a way that the program crashes
due to a dangling pointer.
.SCORE_HERE 2
.SPACE 1.5i
.LI
Give an example of how memory leak might occur in Java.
.SCORE_HERE 2
.SPACE 1.5i
.LI
.E= Prolog\(::
Define the function
.V= product ,
which produces the product of all the numbers in a list.
.SCORE_HERE 2
.TVCODE* 0 "| ?- " "product(N,[1,2,3,4,5])."
.TVCODE* 0 "N = 120"
.TVCODE* 0 "| ?- " "product(N,[])."
.TVCODE* 0 "N = 1"
.SPACE 1i
.LI
.E= Scheme\(::
Write the function
.V= elim ,
which takes a symbol and a list and returns a list consisting
of elements of the list starting with the first one that is
.V= eqv?
to its first argument\(;;
or the empty list, if none.
.SCORE_HERE 2
.TVCODE* 0 "> " "(elim 3 '(5 4 3 2 1))"
.TVCODE* 0 "(3 2 1)"
.TVCODE* 0 "> " "(elim 9 '(1 2 3))"
.TVCODE* 0 "()"
.TVCODE* 0 "> " "(elim 1 '(1 2 3 4))"
.TVCODE* 0 "(1 2 3 4)"
.LE
.SPACE 10i
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
.SCORE_HERE \n[MULTCHOICE_MAX]
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
.CHOOSE_BEGIN
Haskell is a purely functional language which maintains state using
a\(::
.CHOOSE4 closure daemon monad thunk
.CHOOSE_END
.CHOOSE_BEGIN
Partial parameterization of a currried function keeps arguments in
a\(::
.CHOOSE4 closure daemon monad thunk
.CHOOSE_END
.CHOOSE_BEGIN
In C++, a static variable is bound to a virtual address\(::
.CHOOSE
at compile
.=V ( CC )
time.
.CHOOSE
at link
.=V ( ld )
time.
.CHOOSE
at
.V= exec()
time.
.CHOOSE
when
.V= main()
is called.
.CHOOSE_END
.CHOOSE_BEGIN
In Java, a static variable is allocated\(::
.CHOOSE
at translation time.
.CHOOSE
when the class files are put in a jar.
.CHOOSE
when the class is loaded.
.CHOOSE
when an object is created with
.V= new .
.CHOOSE_END
.CHOOSE_BEGIN
From what segment does a call to
.V= new
in C++ allocate memory\(??
.CHOOSE4 data heap stack text
.CHOOSE_END
.if t .SPACE 10i
.CHOOSE_BEGIN
What is the type of
.V= f \(??
.VCODE* 0 "let f x y = x + y;;"
.CHOOSE4FT CB "int * int * int" "int * int -> int" \
"int -> int * int" "int -> int -> int"
.CHOOSE_END
.CHOOSE_BEGIN
When arguments to functions are evaluated before the function is
called, this is \l'.25i' order.
.CHOOSE4 applicative efficient normal short\~circuit
.CHOOSE_END
.CHOOSE_BEGIN
A garbage collector which is most friendly to the page tables
by compacting heap objects into as few pages as possible\(::
.CHOOSE
concurrent reclamation of live objects
.CHOOSE
copying collector with semispaces
.CHOOSE
mark and sweep collector
.CHOOSE
reference counting
.CHOOSE_END
.CHOOSE_BEGIN
Of the ones listed here,
the attribute most associated with functional programming is\(::
.CHOOSE4 dynamic\~dispatch referential\~transparency \
static\~type\~checking unification
.CHOOSE_END
.CHOOSE_BEGIN
If
.V= a
is a list,
which expression produces the same list\(??
.CHOOSE4FT CB "(car (cdr (cons a))" "(car (cons a (cdr a))" \
"(cons (car a) (cdr a))" "(cons (cdr a) (car a))"
.CHOOSE_END
.CHOOSE_BEGIN
The Java class that permits a process to have multiple things done
concurrently is\(::
.CHOOSE4FT CB Daemon Runnable Task Thread
.CHOOSE_END
.LE
.SPACE 10i
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
.SCORE_HERE \n[MULTCHOICE_MAX]
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
.CHOOSE_BEGIN
What is the type of
.V= swap \(??
.VCODE* 0 "let swap f x y = f y x;;"
.CHOOSE4FT CB \
"('a \-> 'b \-> 'a) \-> 'a \-> 'b list \-> 'a" \
"('a \-> 'b \-> 'b) \-> 'a list \-> 'b \-> 'b" \
"('a \-> 'b \-> 'c) \-> 'b \-> 'a \-> 'c" \
"('a \-> 'b) \-> ('c \-> 'a) \-> 'c \-> 'b" 
.CHOOSE_END
.CHOOSE_BEGIN
What is
.V= 6 \(??
.CHOOSE4FT CB "((lambda (x)(+ x 3 ))3)" "(cdar '(7 6 5 4 3))" \
"(if (2 < 3) 4 6)" "(map * '(1 2 3))"
.CHOOSE_END
.CHOOSE_BEGIN
The function
.V= List.fold_left
uses up how much stack space on a list of length $n$\(??
.CHOOSE
$ O ( 1 ) $
.CHOOSE
$ O ( 2 sup n ) $
.CHOOSE
$ O ( log sub 2 n ) $
.CHOOSE
$ O ( n ) $
.CHOOSE_END
.CHOOSE_BEGIN
An object-oriented language such as C++ does dynamic dispatching
of method calls by means of a\(::
.CHOOSE4 "virtual function table" "template declaration" \
"heap-allocated closure" "friend function"
.CHOOSE_END
.CHOOSE_BEGIN
What is the stack efficiency of this function\(??
.VCODE* 0 "let rec f n ="
.VCODE* 0 "    if n <= 1 then n"
.VCODE* 0 "    else f (n - 1) + f (n - 2);;"
.CHOOSE
$ O ( 1 ) $
.CHOOSE
$ O ( n ) $
.CHOOSE
$ O ( n sup 2 ) $
.CHOOSE
$ O ( 2 sup n ) $
.CHOOSE_END
.CHOOSE_BEGIN
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
.CHOOSE_END
.CHOOSE_BEGIN
What is the stack efficiency of this function\(??
.VCODE* 0 "let rec f n ="
.VCODE* 0 "    if n <= 1 then n"
.VCODE* 0 "    else f (n - 1) + f (n - 2);;"
.CHOOSE
$ O ( 1 ) $
.CHOOSE
$ O ( n ) $
.CHOOSE
$ O ( n sup 2 ) $
.CHOOSE
$ O ( 2 sup n ) $
.CHOOSE_END
.CHOOSE_BEGIN
Which of the following data structures violates the spirit of
functional programming\(??
.CHOOSE4 array list stack tree
.CHOOSE_END
.CHOOSE_BEGIN
Passing a parameter by \l'.25i' means that it is passed in
unevaluated and then evaluated only if needed.
.CHOOSE4 name reference value value-result
.CHOOSE_END
.CHOOSE_BEGIN
Which of these is not part of the local stack frame in ANSI C\(??
.CHOOSE4 "access (static) link" "control (dynamic) link" \
"register save area" "return address"
.CHOOSE_END
.CHOOSE_BEGIN
The most recently released version of the Scheme language
(not in draft format) is\(::
.CHOOSE4 R5RS R6RS R7RS R8RS
.CHOOSE_END
.LE
.DS
.SCORE_END
.DE
