.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-112 "Comparative Programming Languages" \
Spring\~2011 Final\~Exam
.RCS "$Id: cmps112-2011q2-exam3.mm,v 1.67 2011-06-09 14:06:15-07 - - $"
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
Note\(::
In the interaction samples provided,
computer output is shown using
.UL \f[CR]Courier\f[P]
font, and user input is shown in
.UL \f[CB]Courier-Bold\f[P]
font.
.EQ
delim $$
.EN
.ALX 1 . 4
.LI
.E= Ocaml\(::
Define a function
.V= evenlen
in Ocaml which returns true if the list's length is even and false if
not.
It must be tail-recursive and may not use the function
.V= List.length 
or any of the folding functions.
.SCORE-HERE 2
.DS
.TVCODE* 0 "# " "evenlen [];;"
.TVCODE* 0 "- : bool = true"
.TVCODE* 0 "# " "evenlen [1];;"
.TVCODE* 0 "- : bool = false"
.TVCODE* 0 "# " "evenlen [1;2;3;4];;"
.TVCODE* 0 "- : bool = true"
.DE
.LI
.E= Prolog\(::
Define some facts or rules such that the predicate
.V= oddlen/1
succeeds if the length of its list is odd and fails otherwise.
Do not do any computation on the length of the list.
.SCORE-HERE 2
.DS
.TVCODE* 0 "| ?- " "oddlen([])."
.TVCODE* 0 "no"
.TVCODE* 0 "| ?- " "oddlen([1])."
.TVCODE* 0 "yes"
.TVCODE* 0 "| ?- " "oddlen([1,2,3,4])."
.TVCODE* 0 "no"
.DE
.LI
What are the four general things that a function may do when called\(??
.SCORE-HERE 2
.SP 1i
.LI
.E= Smalltalk\(::
Define a class
.V= List
in which supports the class messages
.V= new
and
.V= cons:with: \(;;
and the instance messages
.V= car ,
.V= cdr ,
and
.V= setcar:setcdr: .
Note that
.V= cons:with:
has to call
.V= setcar:setcdr:
to initialize the instance just created.
.SCORE-HERE 4
.DS
.TVCODE* 0 "st> " \
"a := List cons: 3 with: (List cons: 4 with: List new)."
.TVCODE* 0 "a List"
.TVCODE* 0 "st> " "a car."
.TVCODE* 0 "3"
.TVCODE* 0 "st> " "a cdr."
.TVCODE* 0 "a List"
.TVCODE* 0 "st> " "a cdr car."
.TVCODE* 0 "4"
.TVCODE* 0 "st> " "a cdr cdr."
.TVCODE* 0 "nil"
.DE
.SP 10i
.LI
.E= Haskell\(::
Consider the following two Ocaml functions.
Define the functions
.V= filter
and
.V= map
in Haskell in terms of list comprehensions.
.SCORE-HERE 2
.DS
.TVCODE* 0 "# " "filter;;"
.TVCODE* 0 "- : ('a -> bool) -> 'a list -> 'a list = <fun>"
.TVCODE* 0 "# " "filter ((>)4) [3; 1; 4; 1; 5; 9];;"
.TVCODE* 0 "- : int list = [3; 1; 1]"
.TVCODE* 0 "# " "map;;"
.TVCODE* 0 "- : ('a -> 'b) -> 'a list -> 'b list = <fun>"
.TVCODE* 0 "# " "map ((-)8) [3; 1; 4; 1; 5; 9];;"
.TVCODE* 0 "- : int list = [5; 7; 4; 7; 3; -1]"
.DE
.LI
.E= Scheme\(::
Using
.V= apply
and
.V= max ,
define the Scheme function
.V= depth .
The depth of anything that is not a list is 0.
The depth of a list is one more than the maximum depth of its
constituent elements.
.SCORE-HERE 2
.DS
.TVCODE* 0 "> " "(depth '(1 2 (3 4 (5 6)) 88))"
.TVCODE* 0 "3"
.TVCODE* 0 "> " "(depth '(a b c))"
.TVCODE* 0 "1"
.TVCODE* 0 "> " "(depth '())"
.TVCODE* 0 "1"
.TVCODE* 0 "> " "(depth 7)"
.TVCODE* 0 "0"
.DE
.LI
.E= Prolog\(::
Given the following graph,
Define several facts called
.V= edge
which define the graph.
Also,
define a rule
.V= adjacent
which can be used to test whether or not two nodes are adjacent to
each other.
.SCORE-HERE 2
.DS
.PS 0.75i
A: circle "a"
B: circle "b" at A+(4*circlerad,0)
C: circle "c" at B+(4*circlerad,0)
D: circle "d" at B-(0,4*circlerad)
E: circle "e" at A-(0,4*circlerad)
line from A to B chop
line from B to C chop
line from B to D chop
line from D to E chop
line from A to E chop
line from C to D chop
.PE
.DE
.LI
.E= Perl\(::
Write a program in Perl that uses
.V= <>
to read all of the input lines.
At end of the last file, 
it prints the number of characters, words, and lines found in the file.
A word is any sequence of characters that does not match white space.
(A word matches
.V= \[rs]S+).
.SCORE-HERE 2
.DS
.TVCODE* 0 "bash-3.2\[Do] " "(echo this is a test; \[rs]"
.TVCODE* 0 "> " "echo 2 lines in the file) \[rs]"
.TVCODE* 0 "> " "| wc.perl"
.TVCODE* 0 "2 9 35"
.DE
.LI
.E= Ocaml\(::
The Collatz conjecture states that for any positive integer $n$,
if it is replaced by $n / 2$ when even and $3 n + 1$ when odd,
eventually it converges to the integer $1$.
Write a function which accepts any integer and returns the number
of steps necessary to reach the value of $1$.
Your solution must be tail-recursive.
Do not handle a case where $n < 1$ or is larger than the maximum
integer.
.SCORE-HERE 2
.DS
.TVCODE* 0 "# " "collatz 1;;"
.TVCODE* 0 "- : int = 0"
.TVCODE* 0 "# " "collatz 2;;"
.TVCODE* 0 "- : int = 1"
.TVCODE* 0 "# " "collatz 3;;"
.TVCODE* 0 "- : int = 7"
.TVCODE* 0 "# " "collatz 10;;"
.TVCODE* 0 "- : int = 6"
.DE
.SP 10i
.LI
.E= Smalltalk\(::
Write some smalltalk code to create a
.V= SortedCollection
and store it in a variable called 
.V= sc .
Then use cascaded (chained) messages to add the numbers
.V= 23 ,
.V= 498 ,
.V= 33 ,
.V= 87 ,
and
.V= 10 ,
in that order.
Then print out all the numbers, one per line, in sorted order.
.SCORE-HERE 2
.SP 1i
.LI
.E= Scheme\(::
Define the function
.V= iota ,
which returns a list of all integers from 1 to the argument given.
It returns an empty list for an argument less than 1.
.SCORE-HERE 2
.DS
.TVCODE* 0 "> " "(iota -5)"
.TVCODE* 0 "()"
.TVCODE* 0 "> " "(iota 0)"
.TVCODE* 0 "()"
.TVCODE* 0 "> " "(iota 1)"
.TVCODE* 0 "(1)"
.TVCODE* 0 "> " "(iota 8)"
.TVCODE* 0 "(1 2 3 4 5 6 7 8)"
.DE
.LI
.E= Prolog\(::
Define
.V= after/3 ,
which returns in its third argument all of the elements of the
second argument that appear after the first argument.
Return 
.V= []
if not found.
.SCORE-HERE 2
.DS
.TVCODE* 0 "| ?- " "after(3,[1,2,3,4,5,6],X)."
.TVCODE* 0 "X = [4,5,6] ? "
.TVCODE* 0 "yes"
.TVCODE* 0 "| ?- " "after(0,[1,2,3,4,5,6],X)."
.TVCODE* 0 "X = [] ? "
.TVCODE* 0 "yes"
.TVCODE* 0 "| ?- " "after(6,[],X)."
.TVCODE* 0 "X = [] ? "
.TVCODE* 0 "yes"
.DE
.LI
Enter the names of these programming languages in the appropriate
box\(::
.E= C ,
.E= C++ ,
.E= Haskell ,
.E= Java ,
.E= Ocaml ,
.E= Perl ,
.E= Prolog ,
.E= Scheme .
.SCORE-HERE 1
.DS
.TS
tab(|); l |ce |cew(175p) |, l |c |c |, |l |c |c |.
|_|_
|strong typing|weak typing
_
static types
.SP
_
dynamic types
.SP
_
.TE
.DE
.LI
.E= Ocaml\(::
Define the function
.V= zipwith
whose arguments are a function of two curried arguments, and two lists.
The lists must have element types acceptable to the function,
and the result is a single list computed by applying the function to
pair elements of the lists.
Do not compute the lengths of the lists.
If the lists are of different lengths,
.V= "raise (Invalid_argument \[Dq]zipwith\[Dq])" .
.SCORE-HERE 3
.DS
.TVCODE* 0 "# " "zipwith;;"
.TVCODE* 0 \
"- : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list = <fun>"
.TVCODE* 0 "# " "zipwith (+);;"
.TVCODE* 0 "- : int list -> int list -> int list = <fun>"
.TVCODE* 0 "# " "zipwith (+) [1;3;5] [2;4;6];;"
.TVCODE* 0 "- : int list = [3; 7; 11]"
.TVCODE* 0 "# " "zipwith (+) [1;3;5] [2];;"
.TVCODE* 0 "Exception: Invalid_argument \[Dq]zipwith\[Dq]."
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
In Smalltalk, the expression
.V= 3+4
means\(::
.CHOOSE
The message
.V= +
is sent to the number
.V= 3 ,
the result of which is a function that accepts the message
.V= 4 .
.CHOOSE
The message
.V= +4
is sent to the number
.V= 3 .
.CHOOSE
The message
.V= 3+
is sent to the number
.V= 4 .
.CHOOSE
The messages
.V= 3
and
.V= 4
are sent to the operator
.V= + .
.CHOOSE-END
.CHOOSE-BEGIN
In Ocaml, the expression
.V= 3+4
means\(::
.CHOOSE
The same as the expression
.V= (3)(+)(4) .
.CHOOSE
The operands
.V= 3
and
.V= 4
are pushed on a stack, and the operator
.V= +
pops the stack and pushes the sum.
.CHOOSE
The operator
.V= +
is applied to the operand
.V= 3 ,
the result of which is a function which is applied to the number
.V= 4 .
.CHOOSE
The operator
.V= +
is applied to the operands
.V= 3
and
.V= 4 .
.CHOOSE-END
.CHOOSE-BEGIN
If
.E= M
= memory leak,
.E= D
= dangling references, and
.E= U
= unsafe type conversions,
which is possible in Java\(??
.CHOOSE
all of them
.CHOOSE
none of them
.CHOOSE
.E= D
but neither
.E= M
nor
.E= U
.CHOOSE
.E= M
but neither
.E= D
nor
.E= U
.CHOOSE-END
.CHOOSE-BEGIN
Some early languages, like PL/I, allowed non-local
.V= goto s,
i.e.,
the ability to use a
.V= goto
to transfer control to a different function.
A structured way of doing this in Java is with\(::
.CHOOSE4FT CB break continue throw try
.CHOOSE-END
.CHOOSE-BEGIN
Unification is an important algorithm in determining the flow of
control in\(::
.CHOOSE4 Ocaml Prolog Scheme Smalltalk
.CHOOSE-END
.CHOOSE-BEGIN
A  
.E= closure 
is\(::
.CHOOSE 
the address of the local variables that are passed to another function
during a function call.
.CHOOSE 
automatically closing all opened files when the
.BR exit
function is called. 
.CHOOSE 
a heap allocated structure which points at a function and contains the
values of all non-local variables used by that function.
.CHOOSE 
a structure which holds an unevauated expression used when parameters
are passed in normal form.
.CHOOSE-END
.CHOOSE-BEGIN
A  
.E= thunk 
is\(::
.CHOOSE 
the address of the local variables that are passed to another function
during a function call.
.CHOOSE 
automatically closing all opened files when the
.BR exit
function is called. 
.CHOOSE 
a heap allocated structure which points at a function and contains the
values of all non-local variables used by that function.
.CHOOSE 
a structure which holds an unevauated expression used when parameters
are passed in normal form.
.CHOOSE-END
.CHOOSE-BEGIN
A Perl pattern that matches one or more white space characters is\(::
.CHOOSE4FT CB \[rs]d+ \[rs]s+ \[rs]t+ \[rs]w+
.CHOOSE-END
.CHOOSE-BEGIN
In C++,
templates such as
.V= stack<int>
are an example of what kind of polymorphism\(??
.CHOOSE4 ad-hoc\~conversion ad-hoc\~overloading \
universal\~inclusion universal\~parametric
.CHOOSE-END
.CHOOSE-BEGIN
A static link is a pointer to the\(::
.CHOOSE
call instruction that activated the current function.
.CHOOSE
segment in an executable binary containing all of a C program's static
variables.
.CHOOSE
stack frame of the calling function.
.CHOOSE
stack frame of the most recent function activation for the function in
which the current function is nested.
.CHOOSE-END
.CHOOSE-BEGIN
The first computer bug was so named in 1947 at\(::
.CHOOSE4 Carnegie-Mellon Harvard Princeton Stanford
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
In Ocaml, what is the depth of recursive non-tail calls
for the following functions,
where $n$ is the length of the list argument\(??
.CHOOSE
.V= fold_left \(::
$ O ( 1 ) $\(;;
.V= fold_right \(::
$ O ( 1 ) $
.CHOOSE
.V= fold_left \(::
$ O ( 1 ) $\(;;
.V= fold_right \(::
$ O ( n ) $
.CHOOSE
.V= fold_left \(::
$ O ( n ) $\(;;
.V= fold_right \(::
$ O ( 1 ) $
.CHOOSE
.V= fold_left \(::
$ O ( n ) $\(;;
.V= fold_right \(::
$ O ( n ) $
.CHOOSE-END
.CHOOSE-BEGIN
If a balanced binary search treeis implemented in a purely functional
language,
the insertion of one new node will take how long\(??
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
If
.V= %h
is a hash in Perl, and
.V= \[Do]k
is its key,
the value is obtained by the expression\(::
.CHOOSE4FT CB \[Do]h{\[Do]k} %h{\[Do]k} &h{\[Do]k} @h{\[Do]k}
.CHOOSE-END
.CHOOSE-BEGIN
Which expression will cause Scheme to print\(::
.VTCODE* 1 "(3)"
.CHOOSE4FT CB "(caar '(1 2 3))" "(cadr '(1 2 3))" "(cdar '(1 2 3))" \
"(cddr '(1 2 3))"
.CHOOSE-END
.CHOOSE-BEGIN
In Prolog,
if
.V= guess
is a function that searches a database to return one of its elements,
and
.V= verify
checks to see if the selection is valid,
then we may define the function
.V= find
to look up a valid entity in the database.
.CHOOSE
.V= "find(X) :- guess(X), verify(X)."
.CHOOSE
.V= "guess(X) :- verify(X), find(X)."
.CHOOSE
.V= "find(X) :- guess(X).
.br
.V= "find(X) := verify(X)."
.CHOOSE
.V= "verify(X) :- guess(X), find(X)."
.CHOOSE-END
.CHOOSE-BEGIN
Ocaml does
.E= *not*
have\(::
.CHOOSE
applicative order evaluation
.CHOOSE
operator overloading
.CHOOSE
parametric polymorphism
.CHOOSE
type inference
.CHOOSE-END
.CHOOSE-BEGIN
In Perl,
the name of the script being run is\(::
.CHOOSE4FT CB \[Do]! \[Do]0 \[Do]ARGV[0] \[Do]ENV{SCRIPT}
.CHOOSE-END
.CHOOSE-BEGIN
What kind of function is
.VTCODE* 1 "let f x y = x + y"
.CHOOSE4 curried thunked tupled unified
.CHOOSE-END
.CHOOSE-BEGIN
In Ocaml, the type of 
.V= (+)
is\(::
.CHOOSE4FT CB "int * int * int" "int * int -> int" \
"int -> int * int" "int -> int -> int"
.CHOOSE-END
.CHOOSE-BEGIN
In Ocaml, what is the type of 
.V= List.map \(??
.CHOOSE4FT CB "('a -> 'b -> 'a) -> 'a -> 'b list -> 'a" \
"('a -> 'b) -> 'a list -> 'b list" \
"('a -> bool) -> 'a list -> 'a list" \
"('a -> bool) -> 'a list -> bool"
.CHOOSE-END
.CHOOSE-BEGIN
In Ocaml, what is the type of 
.V= List.fold_left \(??
.CHOOSE4FT CB "('a -> 'b -> 'a) -> 'a -> 'b list -> 'a" \
"('a -> 'b) -> 'a list -> 'b list" \
"('a -> bool) -> 'a list -> 'a list" \
"('a -> bool) -> 'a list -> bool"
.CHOOSE-END
.LE
.if dPSPIC \{
.   DS
.   PSPIC jpgs/bug-zero.ps 2i
.   DE
.\}
.br
.S -2 -4
.BR "The First ``Computer Bug''."
Moth found trapped between points at Relay #70, Panel F,
of the Mark II Aiken Relay Calculator while it was being tested at
Harvard University,
9 September 1947.
The operators affixed the moth to the computer log,
with the entry: ``First actual case of bug being found''.
They put out the word that they had ``debugged'' the machine,
thus introducing the term ``debugging a computer program''.
In 1988,
the log,
with the moth still taped by the entry,
was in the Naval Surface Warfare Center Computer Museum at Dahlgren,
Virginia.
.br
.=V [ http://en.wikipedia.org/wiki/File:H96566k.jpg ]
.br
.S +2 +4
.FINISH
