.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-112 "Comparative Programming Languages" Fall\~2014 Test\~#2
.RCS "$Id: cmps112-2014q4-exam2.mm,v 1.96 2014-11-12 15:45:13-08 - - $"
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
.ds Fdagger \v'-.1v'\[dg]\v'+.1v'
.ALX 1 . 3
.LI
For each language described here,
fill in the name of the language.
Choose from among the following languages\(::
Algol\~60,
AWK,
Basic,
C++,
C,
COBOL,
FORTRAN,
Haskell,
Intercal,
Java,
Lisp,
ML,
OCaml,
Pascal,
Perl,
PL/I,
Prolog,
Python,
Scheme,
Simula\~67.
(Grading\(::
Deduct 1/2 point for each wrong or missing answer,
but do not assign a score less than 0.)
.SCORE-HERE 2
.DS
.TS
allbox tab(|); lw(90p) lw(334p).
|T{
.fi
Language which uses primarily lazy evaluation,
based on the $lambda$-calculus.
T}
|T{
.fi
Kemeny and Kurtz designed this language included in the IBM PC ROM
in 1980.
T}
|T{
.fi
Scripting language designed by
${ size 11 bold A } under bar$ho,
${ size 11 bold W } under bar$einberger, and
${ size 11 bold K } under bar$ernighan.
T}
|T{
.fi
Van Rossum designed this scripting language named after
Monty's Flying Circus.
T}
|T{
.fi
Steele and Sussman designed this functional language with
lexical scoping rules.
T}
\f[FOLIO]Intercal\f[P]\*[Fdagger]|T{
.fi
Parody language with the
.V= come
.V= from ,
.V= maybe ,
and
.V= forget 
control structures.
T}
.TE
.fi
.in 1n
.sp .2v
.S -2 -2
\*[Fdagger]
``Abandon All Sanity, Ye Who Enter Here.''
\[em]
.V= http://catb.org/esr/intercal/
.S +2 +2
.sp -.5v
.DE
.LI
.E= Perl.
Write a program in Perl which will use
.V= <>
to read in lines.
At end of file, print the number of characters, words, and lines.
A word is any sequence of characters delimited by white space.
.SCORE-HERE 2
.SP 1i
.LI
.E= Smalltalk.
Extend class
.V= Object 
with the message
.V= fibonacci: ,
which returns an array filled with the first $n$ Fibonacci numbers.
.SCORE-HERE 3
.DS
.TS
tab(|); l |l.
T{
.fi
Expected output.
.TVCODE* 0 "st> " "a := Object new."
.TVCODE* 0 "an Object"
.TVCODE* 0 "st> " "a fibonacci: 10."
.TVCODE* 0 "(0 1 1 2 3 5 8 13 21 34 )"
T}|T{
Your answer.
.ft CB
Object extend [
   fibonacci: n [
.SP 1.1i
T}
.TE
.DE
.LI
.E= Scheme.
Define the function
.V= merge
which takes two lists of numbers sorted in ascending order
and returns a list of these numbers sorted into ascending order.
.SCORE-HERE 3
.DS
.TS
tab(|); l |l.
T{
.fi
Expected output.
.TVCODE* 0 ">" "(merge '(1 3 5) '(2 4 6 8))"
.TVCODE* 0 "(1 2 3 4 5 6 8)"
.TVCODE* 0 ">" "(merge '(0 1 1 2 3) '(1 4 9))"
.TVCODE* 0 "(0 1 1 1 2 3 4 9)"
T}|T{
Your answer.
.V= "(define (merge list1 list2)"
.SP 1.1i
T}
.TE
.DE
.SP 10i
.LI
.E= Scheme.
Write the function
.V= product
in tail recursive accumulator style so that
it computes the product of a list of numbers.
.SCORE-HERE 1
.SP .75i
.LI
.E= Scheme.
Define the higher-order function
.V= foldl
whose arguments are a binary function,
an identity element,
and a list in that order.
It folds them from left to right into a single value.
.SCORE-HERE 2
.DS
.ft CB
(define (foldl fn unit list)
.SP .75i
)
.DE
.LI
.E= Scheme.
Using
.V= foldl ,
define the function
.V= product ,
which computes the product of a list of numbers.
.SCORE-HERE 1
.SP .5i
.LI
.E= Scheme.
Using
.V= foldl ,
define the function
.V= length ,
which returns the length of a list.
.SCORE-HERE 1
.SP .5i
.LI
.E= Smalltalk.
Define a block called
product so that when given a vector as its
.V= value:\&
argument,
it returns the product of the vector.
.SCORE-HERE 2
.DS
.ft CB
product := [
.SP .75i
].
product value: #(1 2 3 4 5).
120
.DE
.LI
.E= Perl.
Write a line of code that uses 
.V= map
to compute the product of an array.
.SCORE-HERE 1
.SP 1i
.LI
.E= Scheme.
Define the function
.V= reverse ,
which reverses a list.
Do not use any higher-order functions.
Do not use
.V= append.
.SCORE-HERE 2
.DS
.ft CB
(define (reverse list)
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
.char \[QQ] \s+2'\s-2\h'-1p'
.CHOOSE-BEGIN
A thunk is\(::
.CHOOSE
A heap allocated value yet to be initialized.
.CHOOSE
A pointer to a virtual function table used in dynamic dispatch.
.CHOOSE
An unevaluated expression passed into a function which may be evaluated
by the function if needed.
.CHOOSE
The sound of dead code dropping.
.CHOOSE-END
.CHOOSE-BEGIN
What is
.V= 2 \(??
.CHOOSE4V "(caar \[QQ](1 2 3))" "(cadr \[QQ](1 2 3))" \
"(cdar \[QQ](1 2 3))" "(cddr \[QQ](1 2 3))"
.CHOOSE-END
.CHOOSE-BEGIN
What is
.V= "((lambda (x) x) (+ 2 3))" \(??
.CHOOSE4V (+\~2\~3) + 5 x
.CHOOSE-END
.CHOOSE-BEGIN
What is the parenthesized equivalent of the Smalltalk expression
.V= "a b c: d" \(??
.CHOOSE4V "((a b) c: d)" "(a (b c: d))" "(a b) (c: d)" "a ((b c:) d)"
.CHOOSE-END
.CHOOSE-BEGIN
In the \[*l]-calculus expression $ ( lambda x . ^ + ^ x ^ y ) $\(::
.CHOOSE
$x$ is bound and $y$ is bound.
.CHOOSE
$x$ is bound and $y$ is free.
.CHOOSE
$x$ is free and $y$ is bound.
.CHOOSE
$x$ is free and $y$ is free.
.CHOOSE-END
.ne 2i
.CHOOSE-BEGIN
Java supports\(::
.CHOOSE
single inheritance only.
.CHOOSE
multiple (mixin) inheritance of functions (methods) but not fields.
.CHOOSE
multiple inheritance of functions (methods)
and shared inheritance of fields.
.CHOOSE
multiple inheritance of functions (methods)
and repeated inheritance of fields.
.CHOOSE-END
.CHOOSE-BEGIN
What is
.V= "((lambda (x) x) \[QQ](+ 2 3))" \(??
.CHOOSE4V (+\~2\~3) + 5 x
.CHOOSE-END
.CHOOSE-BEGIN
Static type checking in C and C++ is done\(::
.CHOOSE4 "by the preprocessor" "by the compiler" "by the linker" \
"at run time"
.CHOOSE-END
.CHOOSE-BEGIN
Which of these functions can be written in a tail-recursive style\(??
.CHOOSE4V append fold_right map reverse
.CHOOSE-END
.CHOOSE-BEGIN
In Smalltalk, how does one compute $ sqrt 2 $\(??
.CHOOSE4V "2 **: 0.5" "2 sqrt" "Number sqrt: 2" "sqrt 2"
.CHOOSE-END
.CHOOSE-BEGIN
In Smalltalk and Scheme, type checking is\(::
.CHOOSE
strong and dynamic.
.CHOOSE
strong and static.
.CHOOSE
weak and dynamic.
.CHOOSE
weak and static.
.CHOOSE-END
.CHOOSE-BEGIN
Lisp was designed when, by whom, and where\(??
.CHOOSE
1953, John Backus, IBM.
.CHOOSE
1958, John McCarthy, MIT.
.CHOOSE
1959, Grace Hopper,
.IR et\~al. ,
Department of Defense.
.CHOOSE
1964, John Kemeny & Thomas Kurtz, Dartmouth College.
.CHOOSE-END
.LE
.FINISH
