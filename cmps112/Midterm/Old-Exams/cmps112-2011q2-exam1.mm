.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-112 "Comparative Programming Languages" \
Winter\~2011 Test\~#1
.RCS "$Id: cmps112-2011q2-exam1.mm,v 1.45 2011-04-22 19:59:45-07 - - $"
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
Fill in the blank with a lambda expression so that 
.V= mul
behaves as shown here.
.SCORE-HERE 1
.br
The answer, in Perl, would be\(::
.br
.ft CB
my \[Do]mul = sub {my \[Do]x = \[Do]_[0]; sub {\[Do]x * \[Do]_[0]}};
print \[Do]mul->(3)->(4), \[Dq]\[rs]n\[Dq];
.ft P
.DS
.TVCODE* 0 "> " "(define mul (\l'3i'))"
.TVCODE* 0 "> " "((mul 3) 4)"
.TVCODE* 0 "12"
.DE
.LI
Fill in the following table.
Answers (in alphabetical order) are\(::
John Backus\(;;
Grace Hopper \f[I]et.al.\f[P]\(;;
John Kemeny & Thomas Kurtz\(;;
John McCarthy.
.SCORE-HERE 1
.DS
.TS
box tab(|); |lew(98.5p) |le |le |le |.
FORTRAN (1957)|LISP (1958)|COBOL (1959)|BASIC (1964)
.SP
.TE
.DE
.LI
Write an expression in Java using the operator
.V= &&
which will return a result because
.V= &&
is a lazy operator,
but which would throw an exception if it were evaluated eagerly.
.SCORE-HERE 1
.SP 0.5i
.LI
Write a Perl program that will read 
.V= STDIN
and print the number of characters, words, and lines in the file.
A word is any sequence of non-whitespace characters.
.SCORE-HERE 2
.DS
.TVCODE* 0 "% " "cat t"
.TVCODE* 0 "this is a test"
.TVCODE* 0 "second line"
.TVCODE* 0 "last line in the file"
.TVCODE* 0 "% " "wc.perl  <t"
.TVCODE* 0 "      3      11      49"
.DE
.LI
Define a function in Scheme whose first argument is a predicate
(a function of one argument which returns either
.V= #t
or
.V= #f )
and whose second argument is a list.
If the predicate returns
.V= #t
for any element of the list,
.V= contains
returns
.V= #t ,
otherwise it returns
.V= #f .
.SCORE-HERE 2
.DS
.TVCODE* 0 "> " "(contains (lambda (x) (= x 3)) '(1 2 3 4))"
.TVCODE* 0 "#t"
.TVCODE* 0 "> " "(contains (lambda (x) (> x 9)) '(1 2 3 4))"
.TVCODE* 0 "#f"
.DE
.LI
Write a program in Perl which reads either the standard input or all of
the files whose names are given on the command line
and prints out each word followed by the number of times it appears in
the file.
Words are printed in lexicographic order.
A word matches
.V= \[rs]w+ 
and each word is printed only once.
Your program must
.V= "use strict; use warnings;" .
.SCORE-HERE 3
.DS
.TVCODE* 0 "% " "./count.perl f1 f2"
.TVCODE* 0 "a 4"
.TVCODE* 0 "file 10"
.TVCODE* 0 "second 2"
.TVCODE* 0 "test 4"
.TVCODE* 0 "the 10"
.DE
.SP 10i
.LI
Define a Scheme function
.V= map2
whose arguments are a binary function and two lists.
It returns a list whose length is the same as the shorter list
consisting of elements by using the function to combine corresponding
elements of the list.
.SCORE-HERE 3
.DS
.TVCODE* 0 "> " "(map2 * '(1 2 3) '(4 5 6))"
.TVCODE* 0 "(4 10 18)"
.TVCODE* 0 "> " "(map2 = '(1 2 3) '(1 4 3 8 9))"
.TVCODE* 0 "(#t #f #t)"
.DE
.SP 1i
.LI
Define a function
.V= foldl
which takes a function, a unit value, and a list,
and returns a single value by applying the function between each member
of the list.
It must be tail recursive.
.SCORE-HERE 2
.DS
.TVCODE* 0 "> " "(foldl + 0 '(4 10 18))"
.TVCODE* 0 "27"
.TVCODE* 0 "> " "(foldl cons '() '(1 2 3))"
.TVCODE* 0 "(((() . 1) . 2) . 3)"
.DE
.SP 1i
.LI
Define a function
.V= ip
which computes the inner product of two lists by using 
.V= map2
and
.V= foldl .
Elements of the two lists are pair-wise multiplied together,
and the sum is taken.
.SCORE-HERE 1
.DS
.TVCODE* 0 "> " "(ip '(1 2 3) '(4 5 6))"
.TVCODE* 0 "32"
.DE
.SP 0.5i
.LI
Explain the difference between static and dynamic scope,
and give an example of each.
.SCORE-HERE 2
.SP 1.25i
.LI
Draw a picture of the following Scheme expression.
For each cell, draw a rectangular box with two fields in it,
and draw a pointer from inside the box to the thing being pointed at.
Atoms are drawn outside of all of these boxes.
.SCORE-HERE 2
.VTCODE* 0 "((a b c) (d ((e)) f 6))"
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
Which of the following Java operators uses lazy evaluation\(??
.CHOOSE4FT CB && ++ == >>
.CHOOSE-END
.CHOOSE-BEGIN
Which Scheme expression will evaluate to the atom
.V= 2 \(??
.CHOOSE4FT CB "(caar '(1 2 3))" "(cadr '(1 2 3))" "(cdar '(1 2 3))" \
"(cddr '(1 2 3))"
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following is a higher-order function whose arguments are a
function and a list,
and whose result is a list containing the results of having applied the
function to each element of the list\(??
.CHOOSE4FT CB filter foldl lambda map
.CHOOSE-END
.CHOOSE-BEGIN
For a list of length $n$,
.V= foldr ,
which does not use tail recursion,
will take up how much stack space\(??
.CHOOSE
$ O ( 1 ) $
.CHOOSE
$ O ( log n ) $
.CHOOSE
$ O ( n ) $
.CHOOSE
$ O ( n log n ) $
.CHOOSE-END
.CHOOSE-BEGIN
When is a static variable in C bound to a specific virtual address\(??
.CHOOSE
When the compiler produces an object file.
.CHOOSE
When the linker produces an executable image.
.CHOOSE
When the program is loaded via the
.V= exec
system call.
.CHOOSE
When the main function is called.
.CHOOSE-END
.CHOOSE-BEGIN
A variable declared inside a C or Java function has\(::
.CHOOSE
Dynamic scope and dynamic lifetime.
.CHOOSE
Dynamic scope and static lifetime.
.CHOOSE
Static scope and dynamic lifetime.
.CHOOSE
Static scope and static lifetime.
.CHOOSE-END
.CHOOSE-BEGIN
With respect to Java,
the term ``overloading'' refers to\(::
.CHOOSE
Automatic type conversion when the argument does not match the declared
type of the parameter.
.CHOOSE
Generic classes with type parameterization.
.CHOOSE
Multiple functions with the same name and different signatures,
defined in the same class.
.CHOOSE
Multiple functions with the same name and signature,
defined in different classes.
.CHOOSE-END
.CHOOSE-BEGIN
Perl and Scheme are languages whose type checking is\(::
.CHOOSE
Strong and dynamic.
.CHOOSE
Strong and static.
.CHOOSE
Weak and dynamic.
.CHOOSE
Weak and static.
.CHOOSE-END
.CHOOSE-BEGIN
After a Perl program has executed a subprocess,
the completion status of that process is available in what
variable\(??
.CHOOSE4FT CB \[Do]! \[Do]& \[Do]? \[Do]_
.CHOOSE-END
.CHOOSE-BEGIN
Which expression will cause the empty list to be passed into
.V= f \(??
.CHOOSE4FT CB "(f '())" "(f ())" "(f null?)" "f (null)"
.CHOOSE-END
.CHOOSE-BEGIN
Which of these languages was designed for use in business, finance,
and administrative systems for companies and governments.
.CHOOSE4 BASIC COBOL FORTRAN LISP
.CHOOSE-END
.LE
.SP
.FS *
.fi
.S -1 -3
From
.T= http://community.schemewiki.org/?scheme-fortune-cookies \(::
.P
``Around here, arguing that Java is better than C++ is like arguing that
grasshoppers taste better than tree bark.''
--- Thant Tessman <thant@acm.org> in comp.lang.scheme.
.P
``Functional programming is like describing your problem to a
mathematician.
Imperative programming is like giving instructions to
an idiot.''
--- arcus, #scheme on Freenode.
.br
.S +1 +3
.FE
.FINISH
