.so Tmac.mm-etc
.RCS "$Id: cmps112-2009q1-exam1.mm,v 9.38 2009-01-29 19:51:02-08 - - $"
.EXAM 3 CMPS-112 "Comparative Programming Languages" Winter\~2009 Test\~#1
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
.ALX 1 . 4
.LI
In the following table,
there are fragmentary examples of various kinds of polymorphism.
In each box, identify the example by writing one of the words\(::
.E= ad\~hoc \(;;
.E= universal .
Then further identify them by writing one of the words\(::
.E= conversion \(;;
.E= inheritance \(;;
.E= overloading \(;;
.E= template .
.SCORE_HERE 2
.DS
.TS
tab(|) allbox; lw(212p)efCB lefCB.
T{
class foo {void f(); }
class bar: public foo {
void f(); }
T}|T{
class stack<item_t> {
void push (item_t); }
\0
T}
T{
int add (int x, int y);
double add (double x,
double y);
T}|T{
double f (double x);
f (6);
\0
T}
.TE
.DE
.LI
Write a Perl program which reads in a sequence of lines using
.V= <> .
Each line consists of a key and a value separated by an equal
.=V ( = )
sign.
Strip off leading and trailing whitespace from each key and value.
Put the key and value into a hash.
Print an error message if any line does not have an equal sign,
but ignore any line containing only whitespace.
At end of file, print out each key and value pair in lexicographic
order.
You need not 
.V= "use strict"
or
.V= "use warnings" .
.SCORE_HERE 4
.SPACE 2i
.LI
Write a function in Perl which takes a filename as an argument
and prints out a lexicographically sorted list of words in the
file.
Each word is printed only once, followed by a list of line numbers
where they occur.
A word is any sequence of characters that match
.V= \[rs]S+
(Note the capital S, meaning non-whitespace.)
.SCORE_HERE 4
.DS
.TS
tab(|); lfCB l lfCB.
sub makexref ($) {|Example output\(::|bar 7 7 88 88 9
   my ($filename) = @_;||foo 3 44 98
   open my $file, "<$filename" or die "$0: $filename: $!\[rs]n";
.TE
.DE
.SPACE 10i
.LI
Write the prototypes for the four default members of class
.V= box
that are automatically added to a class if not explicitly overriden.
.SCORE_HERE 2
.DS
.ft CB
class box {
.SPACE .5i
.DE
.LI
In perl, lexical scope is introduced by the
.V= my
declaration,
while dynamic scope is introduced via a
.V= local
declaration.
Lacking a declaration implies global scope.
What is the output of running this program with each of the statements
on the right\(??
.SCORE_HERE 2
.DS
.TS
allbox tab(|); lfCB lfCB, ^ lw(136p)fCB.
T{
%fn = ("0" => sub {print "0=$var."},
       "d" => sub {local $var = "dyn"; yes(); print "d=$var. "},
       "s" => sub {my $var = "stat"; yes(); print "s=$var. "},
       "g" => sub {$var = "foo"; yes(); print "f=$var. "},
      );
sub yes {$var = "yes"}
$var = "glo"; $fn{$ARGV[0]}(); print "//$var\[rs]n";
T}|T{
scope.perl 0
.SP .875v
T}
|T{
scope.perl s
.SP .875v
T}
|T{
scope.perl d
.SP .875v
T}
|T{
scope.perl g
.SP .875v
T}
.TE
.DE
.LI
Inheritance in C++.
Your answers should be as minimal as possible,
provided the question is answered.
You don't need to provide a main function nor any constructors.
.ALX a ()
.LI
Define a base class
.V= base
with an abstract function
.V= void\~print() .
Define a class 
.V= dstr
which is derived form
.V= base
with a private
.V= string
field and which overrides the base's function
.V= print .
Define a class
.V= dint
which does the same, but with an 
.V= int
field.
Show only what goes in
.V= base.h
and do not define any inline functions.
If we have a variable
.V= base\~*p ,
then
.V= p->print();
should print the string or integer field, as appropriate.
.SCORE_HERE 3
.SPACE 2.5i
.LI
Show the implementation of both 
.V= print
functions as they would appear in 
.V= base.cc .
.SCORE_HERE 3
.LE
.LE
.SPACE 10i
.if t .2C
.\".nr Ds 0
.EQ
delim $$
.EN
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
Which expression is not valid,
given the following two declarations\(??
.VCODE* 1 "int *p; int i;"
.CHOOSE4FT CB "i + i" "i + p" "p + i" "p + p"
.CHOOSE_END
.CHOOSE_BEGIN
C++ is primarily thought of as an example of what kind of language\(??
.CHOOSE4 functional imperative logic object\~oriented
.CHOOSE_END
.CHOOSE_BEGIN
The address of a static variable in C++ is determined at what time\(??
.CHOOSE4 compile during\~a\~function\~call link program\~exec
.CHOOSE_END
.CHOOSE_BEGIN
What time is the address returned by
.V= new
determinaed\(??
.CHOOSE4 compile during\~a\~function\~call link program\~exec
.CHOOSE_END
.CHOOSE_BEGIN
What is the name of the C++ variable used to print error messages\(??
.CHOOSE4FT CB STDERR System.err cerr stderr
.CHOOSE_END
.CHOOSE_BEGIN
The following two declarations are examples of\(::
.VCODE* 0 "ostream &operator<< (ostream &,"
.VCODE* 0 "            const string &);"
.VCODE* 0 "template <typename item_t>"
.VCODE* 0 "ostream &operator<< (ostream &,"
.VCODE* 0 "            const vector<item_t> &);"
.CHOOSE4 overhanging overlapping overloading overriding
.CHOOSE_END
.CHOOSE_BEGIN
In C++, a 
.V= protected
field of a class
.V= foo
is visible only to functions which are members\(::
.CHOOSE
of foo, and any class that inherits from foo.
.CHOOSE
of foo, any class that inherits from foo,
and any class that foo names as a friend
.CHOOSE
of foo, any class that inherits from foo,
and any class that names foo as a friend
.CHOOSE
only of foo.
.CHOOSE_END
.CHOOSE_BEGIN
Of the following languages, which is oldest\(??
.CHOOSE4 Algol\~60 C++ Fortran Java
.CHOOSE_END
.CHOOSE_BEGIN
Which of these is a C++ keyword that might cause a pointer to
become dangling\(??
.CHOOSE4FT CB delete free malloc new
.CHOOSE_END
.CHOOSE_BEGIN
In C++, if we have a call of the form
.V= a.f(x,y) ,
inside the function 
.V= f ,
how is a field
.V= x
in the object
.V= a
referred to\(??
.CHOOSE4FT CB this->*x this->x this.x this[x]
.CHOOSE_END
.CHOOSE_BEGIN
A Case against the GO TO Statement.
.CHOOSE4 Edsger\~Dijkstra Grace\~Hopper Donald\~Knuth Niklaus\~Wirth
.CHOOSE_END
.DS
.SCORE_END
.DE
