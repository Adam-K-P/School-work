.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-112 "Programming Languages" Winter\~2012 Final\~Exam
.RCS "$Id: cmps112-2012q1-exam3.mm,v 1.31 2012-03-15 00:42:18-07 - - $"
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
.de LIQ
.   LI
..
.ALX 1 . 4
.LI
.E= Ocaml\(::
Define a function 
.V= split
which takes a predicate and a list and returns a 2-tuple of lists,
where all elements of the first list cause the predicate to return
true,
and all other elements are in the second list.
The elements must remain in the same order as on input.
.SCORE-HERE 3
.TVCODE* 0 "# " "split;;"
.TVCODE* 0 "- : ('a -> bool) -> 'a list -> 'a list * 'a list = <fun>"
.TVCODE* 0 "# " "split even [1; 3; 5; 2; 8; 4; 1; 10];;"
.TVCODE* 0 "- : int list * int list = ([2; 8; 4; 10], [1; 3; 5; 1])"
.SP 1i
.LI
.E= Prolog\(::
Define a function
.V= filter
which takes three arguments\(::
a predicate, an input list, and an output list.
The output list contains all elements of the input list for which
the predicate is true, and in the same order.
.SCORE-HERE 2
.TVCODE* 0 "| ?- " "filter( even, [1,2,3,4,5,6,7,8], X)."
.TVCODE* 0 "X = [2,4,6,8] ? "
.SP 1i
.LI
.E= Scheme\(::
Define a function 
.V= maxzip
which takes a predicate and two lists and zips the lists into a single
list by taking the larger of each of the paired elements.
The length of the result is the same as the length of the shorter list.
.SCORE-HERE 3
.TVCODE* 0 "> " "(maxzip > '(1 3 5 7 9) '(9 7 5 3 1))"
.TVCODE* 0 "(9 7 5 7 9)"
.TVCODE* 0 "> " "(maxzip < '(1 3 5 7 9) '(9 7 5 3 1))"
.TVCODE* 0 "(1 3 5 3 1)"
.TVCODE* 0 "> " "(maxzip <= '(1 3 5 7 9) '(9 9))"
.TVCODE* 0 "(1 3)
.SP 0.25i
.LI
.E= Perl\(::
Write a program which uses
.V= <>
to read files and at end prints the number of characters, words, and
lines in these files.
A word is anything that matches
.V= /\[rs]S+/ .
.SCORE-HERE 2
.TVCODE* 0 "% " "wc.perl foo"
.TVCODE* 0 "4 28 149"
.SP 10i
.LI
Name the two general kinds of polymorphism,
and for each of them,
name the two sub-kinds of polymporhism into which they may be
classified.
.SCORE-HERE 1
.SP .75i
.LI
.E= Scheme\(::
Define a function
.V= exclude
which takes a count and a list and returns a list with the first
count items removed.
A negative count is the same as 0.
If more items are excluded than exist in the list,
return the empty list.
.SCORE-HERE 2
.VTCODE* 0 "> " "(exclude 2 '(1 2 3 4 5))"
.VTCODE* 0 "(3 4 5)"
.VTCODE* 0 "> " "(exclude -5 '(1 2 3 4 5))"
.VTCODE* 0 "(1 2 3 4 5)"
.VTCODE* 0 "> " "(exclude 10 '(1 2 3))"
.VTCODE* 0 "()"
.SP .3i
.LI
.E= Ocaml\(::
Define a function
.V= exclude
which does the same.
.SCORE-HERE 2
.VTCODE* 0 "# " "exclude 2 [1;2;3;4;5];;"
.VTCODE* 0 "- : int list = [3; 4; 5]"
.VTCODE* 0 "# " "exclude (-5) [1;2;3;4;5];;"
.VTCODE* 0 "- : int list = [1; 2; 3; 4; 5]"
.VTCODE* 0 "# " "exclude 10 [1;2;3];;"
.VTCODE* 0 "- : int list = []"
.SP .5i
.LI
.E= Prolog\(::
Define A function
.V= exclude/3
with the same semantics.
The first two arguments are as before,
and the third argument is the output list.
Do not consider the result of backtracking from the
.V= ?\&\&
prompt.
.SCORE-HERE 2
.VTCODE* 0 "| ?- " "exclude(2,[1,2,3,4,5],U)."
.VTCODE* 0 "U = [3,4,5] ? "
.VTCODE* 0 "yes"
.VTCODE* 0 "| ?- " "exclude(-5,[1,2,3,4,5],U)."
.VTCODE* 0 "U = [1,2,3,4,5] ? "
.VTCODE* 0 "yes"
.VTCODE* 0 "| ?- " "exclude(10,[1,2,3],U)."
.VTCODE* 0 "U = [] ? "
.VTCODE* 0 "yes"
.LI
.E= Smalltalk\(::
Define a class
.V= Find
with a single class method
.V= key:array:\&
which accepts a key and an array and returns the first position in
the array equal to the key.
If not found, return
V>= nil.
.SCORE-HERE 3
.VTCODE* 0 "st> " "Find key: 5 array: #(1 3 5 7 9)."
.VTCODE* 0 "3"
.VTCODE* 0 "st> " "Find key: 11 array: #(1 3 5 7 9)."
.VTCODE* 0 "nil"
.SP 10i
.LI
.E= Java\(::
Finish the following program by specifying the class
>V= say .
When started from the main function,
it prints the message ``hello'' and then quits.
.SCORE-HERE 2
.DS
.ft CB
class hello {
   // What goes here?
   public static void main (String[] args) {
      Thread say = new Thread (new say ());
      say.start();
   }
}
.DE
.LI
Give an example of how memory leak might occur in Java.
.SCORE-HERE 2
.SP 1.5i
.LI
.E= Smalltalk\(::
Define the class
.V= Stack .
Internally it has an array of fixed size and no attempt is made to
verify pre- or post-conditions.
It simply crashes on overflow or underflow.
Define the following methods\(::
.SCORE-HERE 6
.ALX a () "" 0
.LI
Class method
.V= new
uses
.V= new:\&
to create a stack of maximum capacity 10.
.LI
Class method
.V= new:\&
creates a stack of the size given by its argument.
.LI
Instance method
.V= init:\&
initializes the array representation and sets the top to 0
.LI
Instance method
.V= pop
removes and returns the top item on the stack.
.LI
Instance method
.V= push:\&
pushes a new item onto the top of the stack.
.LI
Instance method
.V= empty
reports on whether the stack is empty or noT.
.LE
.TVCODE* 0 "bash-3.2\[Do] " "cat stack.test.st "
.TVCODE* 0 "FileStream fileIn: 'stack.st'."
.TVCODE* 0 "s := Stack new."
.TVCODE* 0 "s push: 1; push: 5; push: 10."
.TVCODE* 0 "s inspect."
.TVCODE* 0 "[s empty not] whileTrue: ["
.TVCODE* 0 "   stdout << s pop << Character nl]."
.TVCODE* 0 "bash-3.2\[Do] " "gst <stack.test.st "
.TVCODE* 0 "An instance of Stack"
.TVCODE* 0 "  array: (1 5 10 nil nil nil nil nil nil nil )"
.TVCODE* 0 "  top: 3"
.TVCODE* 0 "10"
.TVCODE* 0 "5"
.TVCODE* 0 "1"
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
What will make Smalltalk print 
.V= 9 \(??
.CHOOSE4V "(4 + 5) value. " "(4 + 5) value:. " "[4 + 5] value. " \
"[4 + 5] value:. "
.CHOOSE-END
.CHOOSE-BEGIN
In Smalltalk, what is 1.4142135623730951\(??
.CHOOSE4V "(sqrt 2)" "2 ** .5" "2 sqrt" "sqrt (2)"
.CHOOSE-END
.CHOOSE-BEGIN
In Ocaml, what is the type of
.V= List.tl \(??
(Hint\(::
like
.V= cdr
in Scheme).
.CHOOSE4V "\&'a list * \&'a list -> \&'a list" "\&'a list -> \&'a" \
"\&'a list -> \&'a list" "\&'a list -> \&'a list -> \&'a list"
.CHOOSE-END
.CHOOSE-BEGIN
What kind of type equivalence is used to determine if two different
.V= typedef s
in C declare the same type\(??
.CHOOSE4 anonymous name structural value
.CHOOSE-END
.CHOOSE-BEGIN
A process that has exited, either by calling exit or from a signal,
but has not yet been waited for by its parent process is called a\(::
.CHOOSE4 daemon fork\~bomb init zombie
.CHOOSE-END
.ne 3i
.CHOOSE-BEGIN
In Perl, the default argument to a function requiring an argument,
when none is given, is\(::
.CHOOSE4V \[Do]! \[Do]0 \[Do]_ @_
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following functions is a higher-order function whose
arguments are a function and a list,
and whose result is a list containing the result of applying the
function to each of the elements of the list\(??
.CHOOSE4 filter foldl foldr map
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following functions can take a function, a unit, and
a list as arguments, and which applies the function between each
element of the list, along with the unit at one end,
and which can use up constant stack space\(??
.CHOOSE4 filter foldl foldr map
.CHOOSE-END
.CHOOSE-BEGIN
How might one declare an array variable in Perl with lexical scope\(??
.CHOOSE4V local\~@a; my\~@a; our\~@a; use\~@a;
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following programs will cause a dangling pointer\(??
.CHOOSE4V \
"int *f() {int i = 6; return &i; }" \
"int *f() {int i = 6; return *i; }" \
"int *f() {int i = 6; return  i; }" \
"int  f() {int i = 6; return  i; }"
.CHOOSE-END
.CHOOSE-BEGIN
In PL/I, a
.V= goto
statement had the capability of being executed in one function and
transver control to another function,
perhaps the one that called it.
The equivalent feature of Java uses what keyword\(??
.CHOOSE4V break continue throw synchronized
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
In Java,
if two functions have the same name in the same class,
but have different signatures,
this is referred to as\(::
.CHOOSE overhanging overlapping overloading overriding
.CHOOSE-END
.CHOOSE-BEGIN
In Java,
if two functions in different classes have the same signature,
but one of the classes is a subclass of another,
this is referred to as\(::
.CHOOSE overhanging overlapping overloading overriding
.CHOOSE-END
.CHOOSE-BEGIN
Allowing partial parameterization of a function in a functional
language such as Ocaml is called\(::
.CHOOSE4 currying lambda\~lifting tupling unification
.CHOOSE-END
.CHOOSE-BEGIN
In an object-oriented language like C++,
a virtual function (instance method) is called based on a\(::
.CHOOSE4 duck-typing\~response generic\~declaration \
heap-allocated\~closure virtual\~function\~table
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following data structures violates the spirit of
functional programming\(??
.CHOOSE4 array list stack tree
.CHOOSE-END
.ne 3i
.CHOOSE-BEGIN
All imperative featurs of Haskell must be isolated from the rest of the
program and contained in a\(::
.CHOOSE4 closure monad proxy thunk
.CHOOSE-END
.CHOOSE-BEGIN
Unification is an important algorithm in performing automatic type
inference in which of these languages\(??
.CHOOSE4 Java Ocaml Prolog Scheme
.CHOOSE-END
.CHOOSE-BEGIN
Given the declarations
.V= "int *p;"
and
.V= "int i;" ,
which C expression is not valid\(??
.CHOOSE4V "i + i" "i + p" "p + i" "p + p"
.CHOOSE-END
.CHOOSE-BEGIN
From what memory segment does the 
.V= malloc (3)
function allocate memory\(??
.CHOOSE4 test data heap stack
.CHOOSE-END
.CHOOSE-BEGIN
A process that sleeps in the background and wakes up whenever a request
is made on its port, then performs that service, and returns
to sleep to wait for the next request is called a\(::
.CHOOSE4 daemon fork\~bomb init zombie
.CHOOSE-END
.CHOOSE-BEGIN
The first language to be described using Backus-Naur form was\(::
.CHOOSE4 Algol\~60 Basic Cobol Fortran
.CHOOSE-END
.LE
.FINISH
