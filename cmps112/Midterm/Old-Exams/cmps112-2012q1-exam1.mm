.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-112 "Programming Languages" Winter\~2012 Test\~#1
.RCS "$Id: cmps112-2012q1-exam1.mm,v 1.18 2012-02-03 19:10:14-08 - - $"
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
.de LIQ
.   LI
..
.ALX 1 . 4
.LI
Define a function
.V= grep
in Scheme whose first argument is a predicate and second argument a
list.
It returns a new list of all of the elements of the argument list
for which the predicate is true.
Do not use a higher-order function.
.SCORE-HERE 2
.SP 1i
.LI
Define a function
.V= positives
which uses
.V= grep
(above)
to accept a list of numbers and return only the positive ones.
Use a lambda expression, not a function name, as one of its arguments.
.SCORE-HERE 1
.SP 1i
.LI
Define a function
.V= sum
which returns the sum of all elements of a list.
Do not use any higher-order functions.
Use constant ($ O ( 1 ) $) stack space.
.SCORE-HERE 2
.SP 1i
.LI
Define the same function
.V= sum
using the higher-order function
.V= foldleft ,
whose arguments are a unit value, a binary function,
and a list.
.SCORE-HERE 1
.SP 1i
.LI
Name the two kinds of
.E= "universal polymorphism"
and give an example of each.
.SCORE-HERE 2
.SP 1i
.LI
Name the two kinds of
.E= "ad hoc polymorphism"
and give an example of each.
.SCORE-HERE 2
.SP 10i
.LI
Write a complete program in Perl that reads in words from all of the
filenames specified in
.V= @ARGV ,
and after end of file of the last file,
prints out each word, one per line, sorted lexicographically,
with each word followed by a count of the number of times it occurred.
Exit status is 0 for success and 1 if any file could not be opened.
Print suitable error messaages for files that could not be opened.
If no files are specified, read the standard input.
Do not use the
.V= <>
operator.
Use
.V= /\[rs]w+/
to match words or
.V= /\[rs]W+/
to split delimiters.
If
.V= @ARGV 
is empty,
use
.V= \[Dq]-\[Dq]
(standard input).
.SCORE-HERE 5
.DS
.ft CB
#!/usr/bin/perl
use strict;
use warnings;
\[Do]0 =~ s|.*/||;
.DE
.SP 2i
.LI
Define the function
.V= zip
in Scheme.
It takes a function and a pair of lists and
returns a list having pairwise applied the function to corresponding
pairs of elements in the list.
If the lists are of unequal length,
the function stops when the shorter list runs out.
.SCORE-HERE 2
.br
Example\(::
.V= "(zip + '(1 2 3) '(4 5 6 7))"
.br
Returns\(::
.V= "(5 7 9)"
.SP 1.5i
.LI
Define the same function in Perl.
It takes a reference to a function of two arguments, followed by
.E= references
to two arrays and applies the function pairwise to the arrays,
returning an array of the shorter length.
.SCORE-HERE 2
.br
Example\(::
.V= "@y = zip sub{\[Do]_[0]+\[Do]_[1]}, [1, 2, 3], [4, 5, 6, 7];"
.V= "print \[Dq]@y\[rs]n\[Dq];"
.br
Prints\(::
.V= "5 7 9" 
.SP 1.5i
.LI
Write a program in Perl
which prints out all of the command line
arguments (but not the program name) on one line,
each separated from the next with one space,  
but does not print a space in the front or at the end.
It finishes by printing a newline character.
.SCORE-HERE 1
.DS
.ft CB
#!/usr/bin/perl
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
Which of these languages evaluates expressions in a lazy manner by
default\(??
.CHOOSE4 Haskell Lisp Perl Scheme
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following C operators is ``lazy''\(??
.CHOOSE4V && ++ == >>
.CHOOSE-END
.CHOOSE-BEGIN
What is the running time of the following function\(??
.VTCODE* 1 "(define (f n)"
.VTCODE* 1 "   (if (< n 2) n"
.VTCODE* 1 "       (+ (f (- n 1)) (f (- n 2)))))"
.CHOOSE
$ O ( n ) $
.CHOOSE
$ O ( log sub 2 n ) $
.CHOOSE
$ O ( n sup 2 ) $
.CHOOSE
$ O ( 2 sup n ) $
.CHOOSE-END
.CHOOSE-BEGIN
What amount of stack space is taken up by evaluating that
same function\(??
.CHOOSE
$ O ( n ) $
.CHOOSE
$ O ( log sub 2 n ) $
.CHOOSE
$ O ( n sup 2 ) $
.CHOOSE
$ O ( 2 sup n ) $
.CHOOSE-END
.CHOOSE-BEGIN
What is the value of\(::
.VTCODE* 1 "(cadr '((1 2 3) (4 5 6) (7 8 9)))"
.CHOOSE4V "1" "(4 5 6)" "(2 3)" "((7 8 9))" 
.CHOOSE-END
.CHOOSE-BEGIN
In C, 
when is a
.V= static
local variable bound to a particular virtual address\(??
.CHOOSE
When the program is compiled.
.CHOOSE
When the program is linked.
.CHOOSE
When the program is loaded into execution by the
.V= exec
system call.
.CHOOSE
When the function in which it is declared is called.
.CHOOSE-END
.CHOOSE-BEGIN
Data types in Perl and Scheme are\(::
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
A static link in a stack frame points at\(::
.CHOOSE
the address of the call instruction that activated this function.
.CHOOSE
the stack frame of the calling function.
.CHOOSE
the stack frame of the function in which this function is nested.
.CHOOSE
the top of the function call stack.
.CHOOSE-END
.CHOOSE-BEGIN
Assuming only pure Java code with no sneaky tricks written in C,
If M = memory leaks,
D = dangling references,
and
U = unsafe type conversions or casting,
which of the following are possible in Java\(??
.CHOOSE
all of them.
.CHOOSE
none of them.
.CHOOSE
only D, but neither M nor U.
.CHOOSE
only M, but neither D nor U.
.CHOOSE-END
.CHOOSE-BEGIN
Given the C declaration
.V= char\~**p; ,
which expression is invalid\(??
.CHOOSE4V &(&p) &(*p) *(&p) *(*p)
.CHOOSE-END
.CHOOSE-BEGIN
John Backus, 1953, IBM 704.
.CHOOSE4FT CR ALGOL COBOL FORTRAN LISP
.CHOOSE-END
.LE
.FINISH
