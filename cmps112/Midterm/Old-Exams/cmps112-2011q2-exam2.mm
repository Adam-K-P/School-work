.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-112 "Comparative Programming Languages" \
Spring\~2011 Test\~#2
.RCS "$Id: cmps112-2011q2-exam2.mm,v 1.53 2011-05-17 14:12:09-07 - - $"
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
.ALX 1 . 4
.LI
Some fragmentary examples of polymorphism are given in each
entry in the following table.
Identify the general category by writing
.E= universal
or
.E= ad\~hoc
beside each.
Further identify them with one of the terms
.E= conversion \(;;
.E= generic \(;;
.E= inclusion \(;;
or
.E= overloading .
.SCORE-HERE 2
.DS
.TS
tab(&) allbox; lew(211.5p)fCB lefCB.
T{
let rec len = function
  | [] -> 0
  | _::cdr -> 1 + len cdr
T}&T{
template <typename item_t>
class stack { };
stack<int> si;
T}
T{
class foo {
   foo () {}
   foo (int a) {}
T}&T{
double sqrt (double);
n = sqrt (6);
T}
.TE
.DE
.LI
.E= Scheme\(::
Define a function that will return the largest number in a list
of numbers.
Return
.V= \&'undef
if the list is empty.
The function
.V= max
will return the largest of its arguments.
You must either use an inner tail-recursive function,
or correctly use
.V= apply .
.SCORE-HERE 2
.VTCODE* 0 "(define (maxlist list)"
.SP 1i
.LI
.E= Scheme\(::
Define a function to reverse a list.
Your solution must be tail-recursive.
Hint\(::
You will need an internal helper function.
.SCORE-HERE 3
.VTCODE* 0 "(define (rev list)"
.SP 1.5i
.LI
.E= Smalltalk\(::
Assuming a class
.V= Complex
has instance fields
.V= real
and
.V= imag ,
and methods of the same name that may be used to
enquire of another object,
define two methods\(::
.ALX a () ""
.LI
.V= real:imag:
will replace the real and imaginary fields of the receiver.
.SCORE-HERE 1
.SP 1i
.LI
The binary message
.V= +
will return a new object with the sum of the reciever and its
argument.
(Add the real fields, add the imaginary fields.)
Assume a class method
.V= real:imag: .
.SCORE-HERE 2
.LE
.SP 10i
.LI
.E= Ocaml\(::
Define a function
.V= contains
which accepts a predicate and a list and returns true if the predicate
is true for some element in the list.
.SCORE-HERE 2
.TVCODE* 0 "# " "contains ((=)3) [1;2;3;4];;"
.TVCODE* 0 "- : bool = true"
.TVCODE* 0 "# " "contains ((<)9) [1;2;3;4];;"
.TVCODE* 0 "- : bool = false"
.SP 1.5i
.LI
.E= Ocaml\(::
Define a function
.V= merge
whose arguments are a binary predicate returning a relative ordering
and two lists that are assumed sorted.
Return a merged with combining the two lists into a single sorted list.
.SCORE-HERE 3
.TVCODE* 0 "# " "merge (<=) [1;5;7;9] [2;4;6;88];;"
.TVCODE* 0 "- : int list = [1; 2; 4; 5; 6; 7; 9; 88]"
.TVCODE* 0 "# " "merge (>) [9;5;3;1] [100;13];;"
.TVCODE* 0 "- : int list = [100; 13; 9; 5; 3; 1]"
.SP 1.5i
.LI
.E= Ocaml\(::
Define a function
.V= zip
which takes two lists and returns a list of tuples,
pairing each corresponding element.
If the lists are of different lengths,
ignore excess elements in the longer list.
.SCORE-HERE 2
.TVCODE* 0 "# " "zip [1;2;3] ['a';'b';'c';'d'];;"
.TVCODE* 0 "- : (int * char) list = [(1, 'a'); (2, 'b'); (3, 'c')]"
.SP 1.5i
.LI
.E= Ocaml\(::
Define a function
.V= unzip
which takes a list of tuples and returns a tuple of lists,
the first list containing the first item in each tuple,
and the second list, the second item.
.SCORE-HERE 3
.TVCODE* 0 "# " "let l1, l2 = unzip [(1, 'a'); (2, 'b'); (3, 'c')];;"
.TVCODE* 0 "val l1 : int list = [1; 2; 3]"
.TVCODE* 0 "val l2 : char list = ['a'; 'b'; 'c']"
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
Lazy evaluation of functions is the default in which language\(??
.CHOOSE4 Fortran Haskell Ocaml Scheme
.CHOOSE-END
.CHOOSE-BEGIN
In Smalltalk, $ sqrt 2 $ can be computed with the following
expression\(::
.CHOOSE4FT CB (sqrt\~2) 2\~sqrt sqrt\~(2) sqrt\~2.0;;
.CHOOSE-END
.CHOOSE-BEGIN
In Smalltalk, an expression to which the
.V= value
message may be sent in order to retrieve the value
.V= 9
is\(::
.CHOOSE4FT CB (4\~+\~5) <4\~+\~5> [4\~+\~5] {4\~+\~5}
.CHOOSE-END
.CHOOSE-BEGIN
In a language with garbage collection,
where the function
.V= free
is unavailable,
which of the following is impossible\(??
.CHOOSE4 dangling\~pointers memory\~leak null\~pointer\~exception \
segmentation\~fault
.CHOOSE-END
.CHOOSE-BEGIN
A function which accepts a unit value,
a function,
and a list,
and which produces a single value in an eager language using
$ O ( 1 ) $
stack space is\(::
.CHOOSE4FT CB filter fold_left fold_right map
.CHOOSE-END
.CHOOSE-BEGIN
What is the type of the Ocaml expression
.VTCODE* 1 "map ((+)3)"
.CHOOSE4FT CB "('a -> 'b) -> 'a list -> 'b list" \
"int list -> (int -> int) list" "int list -> int list" "int list"
.CHOOSE-END
.CHOOSE-BEGIN
How would the first element
(the element with the smallest subscript)
of a Smalltalk array be set\(??
.CHOOSE4FT CB "(set! a 1 6)." "a at:1 put:6." "a put:6 at:1." \
"a[1] := 6."
.CHOOSE-END
.CHOOSE-BEGIN
What is the value of
.VTCODE* 1 "(cdr (car (cons '(1 2 3) '(4 5 6))))"
.CHOOSE4FT CB "((1 2 3) 4 5 6)" "(1 2 3)" "(2 3)" \
"(cons '(1 2 3) '(4 5 6))"
.CHOOSE-END
.CHOOSE-BEGIN
The Ocaml function
.V= List.tl
functions like 
.V= cdr
in Scheme.
Its type is\(::
.CHOOSE4FT CB "\&'a list -> 'a" "\&'a list -> 'a list -> 'a list" \
"\&'a list -> 'a list" "\&'a list -> int"
.CHOOSE-END
.CHOOSE-BEGIN
The style of programming in Smalltalk is\(::
.CHOOSE4 functional imperative logic object-oriented
.CHOOSE-END
.CHOOSE-BEGIN
Smalltalk was originally designed at\(::
.CHOOSE4 Bell\~Labs INRIA MIT\~AI\~Lab Xerox\~PARC
.CHOOSE-END
.LE
.if dPSPIC \{
.   sp -1.5v
.   DS
.   PSPIC jpgs/antikythera-0140x125.ps 2.5i
.   DE
.\}
.br
.S -2 -4
The Antikythera mechanism,
built ca.\~150\[en]100 \s[-2]BCE\s[+2],
is the oldest known complex scientific calculator,
and is sometimes called the first known analog computer,
with operational instructions written in Greek.
.T= http://en.wikipedia.org/wiki/Antikythera_mechanism
.br
.S +2 +4
.FINISH
