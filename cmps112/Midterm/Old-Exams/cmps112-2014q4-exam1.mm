.so Tmac.mm-etc
.INITR* \n[.F]
.GETST* SCORE-TOTAL-END SCORE-TOTAL-END
.TITLE CMPS-112 "Comparative Programming Languages" Fall\~2014 Test\~#1
.RCS "$Id: cmps112-2014q4-exam1.mm,v 1.90 2014-10-23 16:14:52-07 - - $"
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
Simula\~67.
(Grading\(::
deduct 1/2 point for each wrong or missing answer,
but do not score less than 0.)
.SCORE-HERE 3
.DS
.TS
allbox tab(|); lw(90p) lw(334p).
|Bjarne Stroustrup's most noted contribution to language design.
|Business data processing language, designers included Grace Hopper.
|Designed in Europe to express algorithms in a structured way.
|First version of Unix was 9000 lines of this language \
(plus some assembly code).
|List processing language typically used in artificial intelligence.
|Numeric and scientific computation language developed at IBM.
|Simulation language that influenced the design of C++.
|Small language for structured programming designed by Niklaus Wirth.
|Sun Microsystems claimed this language is ``write once, run anywhere''.
.TE
.DE
.LI
Write a program in perl which reads in lines using
.V= <> .
Each line consists of three numbers.
At end of file print out the totals of each of the three columns
of numbers.
.SCORE-HERE 3
.SP 1.75i
.LI
Define a Smalltalk class
.V= Complex .
.SCORE-HERE 4
.ALX a () 3 0
.LI
It has two instance fields
.V= real
and
.V= imag .
.LI
Define the instance methods
.V= real: 
(sets
.V= imag
to 0),
.V= imag:
(sets
.V= real
to 0),
and
.V= real:imag:
(sets both).
.LI
Define the binary operator
.V= + ,
which assumes the operand is another
.V= Complex
and returns the sum.
.LE
.SP 10i
.LI
Using a loop, not recursion,
write a function whose single argument is a number
and which returns the factorial of that number.
Return 1 for any number less-equal 0.
Do not consider what happens when the result is very large.
.ALX a ()
.LI
In Perl,
write a
.V= sub .
.SCORE-HERE 1
.SP 0.75i
.LI
In Smalltalk,
extend the class
.V= Number
with the unary selector
.V= fac .
.V= 
.SCORE-HERE 2
.SP 1.25i
.LE
.LI
Name two kinds if
.E= "universal polymorphism"
and give an extremely brief example of each in Java or C++.
.SCORE-HERE 2
.SP 1.5i
.LI
Name two kinds if
.E= "ad hoc polymorphism"
and give an extremely brief example of each in Java or C++.
.SCORE-HERE 2
.SP 1.5i
.LI
Using Perl,
write a program that reads lines from files using
.V= <> ,
and splits each line into words.
A word is any sequence of characters delimited by
.V= m/\[rs]W+/ ,
that is non-alphanumeric characters.
Count the frequency of occurrence of each word.
At end of file,
print out the ten most frequently occurring words in descending order,
along with the number of times each appeared in the input.
.SCORE-HERE 3
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
.CHOOSE-BEGIN
Which of the following C operators uses lazy evaluation\(??
.CHOOSE4V != *= >> ?\0:
.CHOOSE-END
.CHOOSE-BEGIN
The Perl variable equivalent to
.V= strerror(errno)
is\(::
.CHOOSE4V \[Do]! \[Do]0 \[Do]? \[Do]_
.CHOOSE-END
.CHOOSE-BEGIN
In Smalltalk, 
.V= a-b*c+d
is equivalent to\(::
.CHOOSE4V ((a-b)*c)+d (a-(b*c))+d (a-b)*(c+d) a-(b*(c+d))
.CHOOSE-END
.CHOOSE-BEGIN
In Smalltalk, what produces
.V= 13 \(??
.CHOOSE4V \&'4+9'\~value (4+9)\~value [4+9]\~value {4+9}\~value
.CHOOSE-END
.CHOOSE-BEGIN
Assuming pure Java code with no native methods written in C,
if M = memory leaks and D = dangling references,
then which are possible\(??
.CHOOSE
D is possible, but not M.
.CHOOSE
M is possible, but not D.
.CHOOSE
both M and D.
.CHOOSE
neither M nor D.
.CHOOSE-END
.CHOOSE-BEGIN
In C and C++,
when is an external variable bound to a particular address\(??
.CHOOSE
When the preprocessor is run.
.CHOOSE
When the program is compiled.
.CHOOSE
When the program is linked.
.CHOOSE
When the main function is called.
.CHOOSE-END
.CHOOSE-BEGIN
In Perl,
to apply a block to every element of an array,
what function is used\(??
.CHOOSE4V grep join map split
.CHOOSE-END
.CHOOSE-BEGIN
If
.V= \[Do]p
is a
.E= reference
to a Perl hash and
.V= \[Do]k 
is a key whose corresponding value is a scalar,
how is the value extracted\(??
.CHOOSE4V \[Do]p->{\[Do]k} \[Do]p{\[Do]k} %p->{\[Do]k} %p{\[Do]k} 
.CHOOSE-END
.CHOOSE-BEGIN
If we define the block
.V= "sum := [:i :j| i + j]"
in Smalltalk,
how might we obtain the number 7\(??
.CHOOSE4V "3 4 sum" "3 sum: 4" "sum 3 value 4 value" \
"sum value: 3 value: 4"
.CHOOSE-END
.CHOOSE-BEGIN
What is not false in Perl\(??
.CHOOSE4V 0 0.0/0.0 \[Dq]\[Dq] undef
.CHOOSE-END
.CHOOSE-BEGIN
What does the static link in a stack frame point at\(??
.CHOOSE
The call instruction that activated this function.
.CHOOSE
The heap allocated closure in which escaping variables are stored.
.CHOOSE
The stack frame of the function in which this function is nested.
.CHOOSE
The stack frame of the function that called this function.
.CHOOSE-END
.CHOOSE-BEGIN
.ds Fmark \v'-.3v'\[dg]\v'+.3v'
Structured programming\s-2\*[Fmark]\s+2
demands the elimination of what statement\(??
.CHOOSE4V goto switch throw while
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
