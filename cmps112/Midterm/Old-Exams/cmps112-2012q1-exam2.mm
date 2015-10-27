.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-112 "Programming Languages" Winter\~2012 Test\~#2
.RCS "$Id: cmps112-2012q1-exam2.mm,v 1.75 2012-02-24 18:40:26-08 - - $"
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
.E= Haskell\(::
Define the function
.V= map
whose first argument is a unary function, and second argument list.
The result is a list of the function applied to each element of the
argument list.
The definition is a one-liner using a list comprehension.
.SCORE-HERE 1
.TVCODE* 0 "Prelude> " "map (+2) [1,3,5,6]"
.TVCODE* 0 "[3,5,7,8]"
.TVCODE* 0 "Prelude> " "map (3-) [1,2,5,6]"
.TVCODE* 0 "[2,1,-2,-3]"
.LI
.E= Ocaml\(::
Define the function
.V= mapf
whose first argument is a unary function, and second argument list.
The result is a list of the function applied to each element of the
argument list.
Write a one-liner using
.V= fold_right ,
and not a recursive function.
.SCORE-HERE 2
1 point.
.TVCODE* 0 "# " "fold_right;;"
.TVCODE* 0 "- : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b = <fun>"
.TVCODE* 0 "# " "mapf (fun x -> x + 2) [1;3;5;6];;"
.TVCODE* 0 "- : int list = [3; 5; 7; 8]"
.TVCODE* 0 "# " "mapf ((-)3) [1;2;5;6];;"
.TVCODE* 0 "- : int list = [2; 1; -2; -3]"
.LI
.E= Ocaml\(::
Define the function
.V= mapr
having exactly the functionality in the previous questions,
except do not use any higher order functions.
Use recursion.
.SCORE-HERE 2
.SP 1i
.LI
.E= Ocaml\(::
Define the functions
.V= car
and
.V= cdr
in Ocaml so that they work in the expected way.
Use pattern matching.
Neither function may call any other.
Use
.V= failwith
for a
.V= []
argument.
.SCORE-HERE 2
.TVCODE* 0 "# " "car;;"
.TVCODE* 0 "- : 'a list -> 'a = <fun>"
.TVCODE* 0 "# " "cdr;;"
.TVCODE* 0 "- : 'a list -> 'a list = <fun>"
.TVCODE* 0 "# " "car [1;2;3;4];;"
.TVCODE* 0 "- : int = 1"
.TVCODE* 0 "# " "cdr [1;2;3;4];;"
.TVCODE* 0 "- : int list = [2; 3; 4]"
.LI
.E= Perl\(::
Write a program in Perl which reads words and keeps track of their
lengths.
At end of file,
print out a table of two columns,
with each line consisting of the length of a word and the number of
words of that length. 
Use 
.V= <>
to read lines.
A word is any sequence of characters that matches the regex
.V= m/\[rs]w+/ .
The example output shows that for this input,
there is 1 word of length 1,
4 words of length 3,
and 3 words of length 5.
.SCORE-HERE 3
.DS
.TS
tab(|); |l |l |, |lfCB |lfCB |.
_
example input|example output
_
foo bar baz x|     1     1
hello world  |     3     4
qux quuux    |     5     3
_
.TE
.DE
.SP 10i
.LI
.E= Ocaml\(::
Define a function 
.V= zipwith
whose first argument is a curried function of two arguments,
second argument is a single value, and whose third and fourth
arguments are lists.
It merges the lists into a single list by applying the function
in a pairwise manner,
using the single value if one list runs out first.
.SCORE-HERE 3
.TVCODE* 0 "# " "zipwith;;"
.TVCODE* 0 \
"- : ('a -> 'a -> 'b) -> 'a -> 'a list -> 'a list -> 'b list = <fun>"
.TVCODE* 0 "# " "(+);;"
.TVCODE* 0 "- : int -> int -> int = <fun>"
.TVCODE* 0 "# " "zipwith (+) 0;;"
.TVCODE* 0 "- : int list -> int list -> int list = <fun>"
.TVCODE* 0 "# " "zipwith (+) 0 [1; 2; 3] [4; 5; 6; 7; 8];;"
.TVCODE* 0 "- : int list = [5; 7; 9; 7; 8]"
.TVCODE* 0 "# " "zipwith (\[ha]) \[Dq]**\[Dq] [\[Dq]foo\[Dq]] \
[\[Dq]bar\[Dq]; \[Dq]baz\[Dq]];;"
.TVCODE* 0 "- : string list = [\[Dq]foobar\[Dq]; \[Dq]**baz\[Dq]]"
.TVCODE* 0 "# " "zipwith (\[ha]) \[Dq]**\[Dq] [\[Dq]foo\[Dq]; \
\[Dq]bar\[Dq]] [\[Dq]baz\[Dq]];;"
.TVCODE* 0 "- : string list = [\[Dq]foobaz\[Dq]; \[Dq]bar**\[Dq]]"
.SP 0.5i
.LI
.E= Ocaml\(::
Define a function
.V= max
such that given a function of two arguments giving a
.V= bool
and a list,
it returns
.V= Some
maximum element of the list, 
and
.V= None
otherwise.
.SCORE-HERE 3
.TVCODE* 0 "# " "type 'a opt = None | Some of 'a;;"
.TVCODE* 0 "type 'a opt = None | Some of 'a"
.TVCODE* 0 "# " "max;;"
.TVCODE* 0 "- : ('a -> 'a -> bool) -> 'a list -> 'a opt = <fun>"
.TVCODE* 0 "# " "(>);;"
.TVCODE* 0 "- : 'a -> 'a -> bool = <fun>"
.TVCODE* 0 "# " "max (>) [3; 1; 4; 1; 5; 9];;"
.TVCODE* 0 "- : int opt = Some 9"
.TVCODE* 0 "# " "max (<) [3; 1; 4; 1; 5; 9];;"
.TVCODE* 0 "- : int opt = Some 1"
.TVCODE* 0 "# " "max (>) [];;"
.TVCODE* 0 "- : 'a opt = None"
.SP 0.5i
.LI
.E= Scheme\(::
Define the function
.V= zipwith
in Scheme.
Note that for both of these programs, 
if the first list is shorter, the value is used as the first argument,
and if the second list is shorter, the value is the second argument
to the function.
.SCORE-HERE 4
.TVCODE* 0 "> " "(zipwith - 5 '(9 8 7) '(5 4 3 2 1))"
.TVCODE* 0 "(4 4 4 3 4)"
.TVCODE* 0 "> " "(zipwith string-append \[Dq]**\[Dq]"
.TVCODE* 0 "  " "'(\[Dq]hello\[Dq] \[Dq]foo\[Dq] \[Dq]qux\[Dq] \
\[Dq]goto\[Dq]) '(\[Dq] world\[Dq] \[Dq] bar\[Dq]))"
.TVCODE* 0 "(\[Dq]hello world\[Dq] \[Dq]foo bar\[Dq] \
\[Dq]qux**\[Dq] \[Dq]goto**\[Dq])"
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
The type signature of
.V= (/.)
is\(::
.CHOOSE4V "float * float * float" "float * float -> float" \
"float -> float * float" "float -> float -> float"
.CHOOSE-END
.CHOOSE-BEGIN
Assuming a competent implemention in Ocaml,
which function takes up the most stack space\(??
.CHOOSE4V List.find List.fold_left List.fold_right List.length
.CHOOSE-END
.CHOOSE-BEGIN
In Smalltalk, the expression
.V= 3-4/5-6
is equivalent to\(::
.CHOOSE4V ((3-4)/5)-6 (3-(4/5))-6 (3-4)/(5-6) 3-((4/5)-6)
.CHOOSE-END
.CHOOSE-BEGIN
If you have a function
.V= not
.=V ( "bool->bool" )
and a function
.V= even 
.=V ( "int->bool" ),
which higher-order function would be useful in combining them to
make a function called
.V= odd \(??
.CHOOSE4V compose filter fold_left map
.CHOOSE-END
.CHOOSE-BEGIN
A closure is\(::
.CHOOSE 
A special field of a structure or class used to point at a base class
when implementing shared multiple inheritance.
.CHOOSE 
A special type declaration in Ocaml used to distinguish sum types from
product types.
.CHOOSE 
A structure on the heap, used to hold variables of an outer function
when referenced by an inner function.
.CHOOSE 
A table used to dynamically dispatch virtual functions in an
object-oriented environment.
.CHOOSE-END
.CHOOSE-BEGIN
After the following open statement,
what can be used to read one line from the file\(??
.VTCODE* 1 "open my \[Do]file, \[Dq]<\[Do]filename\[Dq]"
.CHOOSE4V "\[Do]line = '\[Do]file';" "\[Do]line = <\[Do]file>;" \
"\[Do]line = \[Dq]\[Do]file\[Dq];" "\[Do]line = `\[Do]file`;"
.CHOOSE-END
.CHOOSE-BEGIN
In a lazy language, unevaluated arguments are passed into functions by
means of a\(::
.CHOOSE4 closure curry thunk tuple
.CHOOSE-END
.CHOOSE-BEGIN
The type of
.V= "[1; 2; 3; 4]"
is\(::
.CHOOSE4V \&'a\~list int\~list list<Object> list<int>
.CHOOSE-END
.CHOOSE-BEGIN
Which of the following is not part of the local stack frame in ANSI
C\(??
.CHOOSE4 "register save area" "access (static) link" \
"dynamic (control) link" "return address"
.CHOOSE-END
.CHOOSE-BEGIN
The following prints the number 6 in which language\(??
.VTCODE* 1 "stdout << 6 << Character nl."
.CHOOSE4 Ocaml Perl Scheme Smalltalk
.CHOOSE-END
.CHOOSE-BEGIN
.ds Fmark \v'-.3v'\[dg]\v'+.3v'
The classic paper\*[Fmark]
\&``Go To Statement Considered Harmful'', CACM, 1968,
was written by\(::
.CHOOSE4 John\~Backus Edsger\~Dijkstra Grace\~Hopper Donald\~Knuth
.CHOOSE-END
.LE
.FD 5
.FS \*[Fmark]
.in 1m
.S -0 -2
He also said\(::
.ALX \[bu] 0 2 0 0
.LI
``FORTRAN, the infantile disorder,
by now nearly 20 years old,
is hopelessly inadequate for whatever computer application you have in
mind today\(::
it is now too clumsy,
too risky, and too expensive to use.''
.LI
``PL/I, the fatal disease,
belongs more to the problem set than to the solution set.''
.LI
``It is practically impossible to teach good programming to students
that have had a prior exposure to BASIC\(::
as potential programmers they are mentally mutilated beyond hope of
regeneration.''
.LI
``The use of COBOL cripples the mind; its teaching should,
therefore, be regarded as a criminal offence.''
.LI
``In the good old days physicists repeated each other's experiments,
just to be sure.
Today they stick to FORTRAN,
so that they can share each other's programs, bugs included.''
.LE
.br
.S +0 +2
.FE
.FINISH
