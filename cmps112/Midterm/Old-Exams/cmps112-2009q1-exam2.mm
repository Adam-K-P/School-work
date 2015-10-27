.so Tmac.mm-etc
.RCS "$Id: cmps112-2009q1-exam2.mm,v 9.21 2009-03-13 20:17:40-07 - - $"
.EXAM 3 CMPS-112 "Comparative Programming Languages" Winter\~2009 \
Test\~#2
.nr SPACE_FOR_ANSWERS 1
.DS
.PS
examboxes(3,30)
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
.E= Scheme\(::
The following function by filius Bonacci
takes $ O ( 2 sup n ) $ time and $ O ( n ) $ stack.
Recode it using a helper function so that it takes $ O ( n ) $ time
and $ O ( 1 ) $ stack.
.SCORE_HERE 2
.VCODE* 0 "(define (f n) (if (< n 2) n (+ (f (- n 1)) (f (- n 2)))))"
.SPACE 1i
.LI
.E= Scheme\(::
Define the function
.V= foldl ,
which has three arguments in this order\(::
a function, a unit, and a list.
A single result is returned such that the function is applied
to the unit and the
.V= car
of the list, sending that down as the next unit,
and the
.V= cdr
of the list is sent in on each recursive call.
It is tail recursive.
.SCORE_HERE 2
.P
Using
.V= foldl ,
define the function
.V= length ,
which returns the length of a list.
.SCORE_HERE 1
.SPACE 1.5i
.LI
.E= Scheme\(::
Without using any higher-order functions,
define the function
.V= map
whose first argument is a function,
which is applied to each element of its second argument, a list.
The result returned as a new list.
.SCORE_HERE 2
.DS
.ft CB
> (map (lambda (x) (* x x)) '(1 2 3 4 5))
(1 4 9 16 25)
.DE
.SPACE 1i
.LI
.E= C++\(::
Define a function 
.V= print
whose argument is a
.V= vector<string> ,
and which uses an iterator to print out all of the elements,
one per line.
.SCORE_HERE 2
.P
.E= Instead ,
for an extra point,
make it a template function whose type can be anything for which
.V= operator<<
is properly defined.
.SCORE_HERE 1
.SPACE 10i
.LI
.E= Scheme\(::
Assuming you have a hash table named
.V= hash ,
which contains pointers to binary functions,
Write code to evaluate an expression tree.
The tree is represented as three element lists,
where
.V= car
is the function,
.V= cadr
is the left operand,
and
.V= caddr
is the right operand.
Leaf nodes are symbols whose values are in the table
.V= symtab ,
also a hash.
You need not do error checking\(::
all variables and operators are valid,
all leaf nodes are symbols,
and all interior nodes have exactly three elements.
.SCORE_HERE 3
.DS
.ft CB
(define (evaltree tree)
.DE
.SPACE 1.5i
.LI
.E= Perl\(::
Define a function 
.V= fold ,
which uses a loop to join all elements of an array
into a single value.
Its first argument is a reference to a binary function,
it second argument is a unit value,
and its third argument is a reference to an array.
.SCORE_HERE 2
.DS
.ft CB
print fold sub{\[Do]_[0]+\[Do]_[1]}, 0, [1, 2, 3, 4, 5, 6];
21
.DE
.SPACE 1i
.LI
.E= Scheme\(::
Define a function 
.V= split
that takes a single list argument and returns a list of two elements,
with the
.V= car
of the result containing the odd numberd elements (counting from 1)
.V= cdr
the even numbered elements.
The elements remain in the same relative order.
.SCORE_HERE 3
.DS
.ft CB
> (split '(1 2 3 4 5 6 7 8 9))
((1 3 5 7 9) (2 4 6 8))
.DE
.SPACE 1.5i
.LI
.E= Scheme\(::
Without using any higher order functions,
code
.V= reverse ,
which reverses a list.
Hint\(::
Think about two stacks.
Use tail recursive form and a helper function that uses accumulator
style.
.SCORE_HERE 2
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
.=E ` Z '
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
What expression will print
.V= (3) \(??
.CHOOSE4FT CB "(caar '(1 2 3))" "(cadr '(1 2 3))" "(cdar '(1 2 3))" \
"(cddr '(1 2 3))"
.CHOOSE_END
.CHOOSE_BEGIN
What variable in a command in a
.V= Makefile
has as its value the target of the recipe\(??
.CHOOSE4FT CB \[Do]* \[Do]< \[Do]? \[Do]@
.CHOOSE_END
.CHOOSE_BEGIN
What might cause a dangling pointer in C++?
.CHOOSE4FT CB catch delete new throw
.CHOOSE_END
.CHOOSE_BEGIN
In Ocaml, what is the type of the function
.V= (+) \(??
.CHOOSE4FT CB "int * int * int" "int * int -> int" "int -> int * int" \
"int -> int -> int"
.CHOOSE_END
.CHOOSE_BEGIN
Fold right
.=V ( foldr )
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
.if t .SPACE 10
.CHOOSE_BEGIN
In the following statement,
.V= continue
goes to what part \(??
.VCODE* 2 "for (i = 0; i < n; ++i) {"
.VCODE* 2 "   f (); continue; g ();
.VCODE* 2 "} h ();"
.CHOOSE4FT CB "++i" "h ();" "i < n" "i = 0"
.CHOOSE_END
.CHOOSE_BEGIN
What declares a variable
.V= m
of type
.V= map
whose keys are
.V= string s
and whose values are
.V= int s\(??
.CHOOSE4FT CB "m: (string, int) map;" "map <string, int> m;" \
"map [int, string] m;" "map m <string, int>;"
.CHOOSE_END
.CHOOSE_BEGIN
Both Perl and Scheme have type systems which are\(::
.CHOOSE4 "strong and dynamic." "strong and static." \
"weak and dynamic." "weak and static."
.CHOOSE_END
.CHOOSE_BEGIN
For which function will C++ say\(::
.IR "Warning\(::"
.IR "Returning a reference to a local variable or temporary."
.CHOOSE4FT CB \
"int &f (int &i) {int j; return j; }" \
"int f (int &i) {int j; return j; }" \
"int f (int i) {int j; return j; }" \
"int f (int i) {int &j; return j; }"
.CHOOSE_END
.CHOOSE_BEGIN
In C++, which of these operators is ``lazy''\(??
.CHOOSE4FT CB && ++ << ==
.CHOOSE_END
.CHOOSE_BEGIN
In Perl, the default variable acted on when nothing is specified,
e.g.,
for
.V= chomp
or pattern matching, is\(::
.CHOOSE4FT CB \[Do]! \[Do]0 \[Do]_ @_
.CHOOSE_END
.DS
.SCORE_END
.DE
