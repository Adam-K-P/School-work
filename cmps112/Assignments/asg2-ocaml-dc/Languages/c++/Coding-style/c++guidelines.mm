.so Tmac.mm-etc
.if t .Newcentury-fonts
.INITR* \n[.F]
.char \[C++] C\v'-.1v'++\v'.1v'
.TITLE CMPS-109 "\[C++] Coding Style and General Guidelines"
.RCS "$Id: c++guidelines.mm,v 1.10 2013-01-03 18:42:15-08 - - $"
.PWD
.URL
The following are general programming guidelines for \[C++].
This file should serve as a checklist for programmers.
Some of these rules are requirements and some of them
are general rules which may be ignored with suitable justification.
.H 1 Prerequisite
It is assumed that the reader has already read the CMPS-012B
coding style guidelines, available in the directory
.V= /afs/cats.ucsc.edu/courses/cmps012b-wm/Coding-style/ .
.de H1_ALX
.   H 1 \\$@
.   sp -1v
.   ALX 1 ()
..
.H 1 "Filenames"
.ALX 1 ()
.LI
Always submit a
.V= Makefile
spelled exactly that way, with a capital
.=V `` M ''.
The first target should be
.V= all
and perform the build.
.LI
On 
.V= unix.ic ,
use
.V= "g++ -g -O0 -Wall -Wextra -std=gnu++0x" .
.LI
\[C++] includes from the standard library should not contain a dot.
For example, use
.V= <iostream>
and not
.V= <iostream.h> .
Follow the includes with
.V= "using namespace std" .
.LI
For C includes, generally delete the
.V= \&.h
and put the letter
.V= c
in front.
So for example, use
.V= <cstdlib>
and not
.V= <stdlib.h> .
.LI
The only time that it is acceptable to use a standard C library
include is when the same is not available in the \[C++] include headers.
.LI
Implementation files should always end in 
.V= \&.cc 
or
.V= \&.cpp ,
as in 
.V= hello.cc
or
.V= hello.cpp .
But you must be consistent\(::
all source files you submit must end with the
.E= same
suffix.
.E= "Do not"
use any of the suffices
.V= \&.c ,
.V= \&.C ,
.V= \&.cxx ,
.V= \&.c++ ,
or
.V= \&.i .
.LI
All user-supplied header files must end with the suffix
.V= \&.h ,
as in 
.V= foo.h
as the interface to
.V= foo.cc
or
.V= foo.cpp .
.LE
.H 1 "General"
.ALX 1 ()
.LI
No one letter identifiers.
Ever.
Identifiers should be long enough or unique enough so that a 
.V= grep (1)
for an identifier should pick up only those identifiers and
specifically related identifiers, 
and possibly words in comments and strings which are spelled
in the same way.
Identifiers should always consist of words or phrases with
no unusual abbreviations.
.LI
No
.V= goto s.
Ever.
Especially no 
.V= goto s
to a pointer or to an array element\(!!
Use
.V= break ,
.V= continue ,
or throw an exception.
.LI
Do not call the function
.V= exit .
Instead, throw a special exception to be caught in
.V= main ,
so that main can 
.V= return
an exit status.
.LI
If you do use a
.V= goto ,
you will be haunted by the ghost of Edsger Dijkstra [EWD215].
On the other hand, he will probably haunt you on general principles
just for using \[C++] [EWD498].
He didn't like UCSC anyway [EWD714].
.de V=*
.   br
.   V= \\$*
.   br
..
.ds http:EWD http://www.cs.utexas.edu/\[ti]EWD
.V=* \*[http:EWD]/
.V=* \*[http:EWD]/ewd02xx/EWD215.PDF
.V=* \*[http:EWD]/ewd04xx/EWD498.PDF
.V=* \*[http:EWD]/ewd07xx/EWD714.PDF
.V=* \*[http:EWD]/transcriptions/EWD02xx/EWD215.html
.V=* \*[http:EWD]/transcriptions/EWD04xx/EWD498.html
.LI
Do not define external variables.
However, due to the legacy libraries inherited by \[C++] from C,
it is sometimes necessary to reference external variables defined by
these libraries.
An
.V= extern
declaration which refers to a global variable documented in
the C library is acceptable when there is no other way of
accessing it.
If you think you need to define an external variable, 
what you probably really need is a private static data member.
Static variables of file scope are deprecated,
but not prohibited.
.LI
Don't use
.V= <stdio.h> .
Instead, use
.V= <iostream> ,
.V= <iomanip> ,
etc.
.LI
Other C header files may be used, but in their \[C++] 
.V= #include
form\(::
.V= <cassert> ,
.V= <cctype> ,
.V= <climits> ,
.V= <cmath> ,
etc.
You probably want to include the statement
.V= "using namespace std;"
for most \[C++] code.
.LI
Never use
.V= malloc (3c)
or
.V= free (3c).
Instead, use the \[C++] operators
.V= new
and
.V= delete .
.LI
If an object was created with
.V= new ,
then it should be destroyed with
.V= delete .
If the call to
.V= new
used
.V= []
to allocate an array, then use
.V= "delete[]"
to destroy it.
.LI
Indentation must be consistent.
Anything inside of braces
.=V ( {
and
.V= } )
must be indented three spaces more than what immediately
precedes and follows the braces.
An open brace
.=V ( { )
must never be on a line by itself,
always being put at the end of a line that controls it.
A closing brace
.=V ( } )
must always be on a line by itself and aligned underneath
the keyword which introduced the construct that is being ended.
.LI
Do not use C-style casts such as
.V= (t)x .
Instead, use 
.V= static_cast<t>(x)
where possible.
Use
.V= dynamic_cast
when run time type information (RTTI) is needed.
.LI
Avoid using
.V= reinterpret_cast
unless you absolutely must.
And then be aware that its behavior is implementation dependent.
Don't use
.V= union s
either, for the same reason.
If you think you need a union, 
you probably want inheritance instead.
.LI
Use of 
.V= ++ ,
.V= -- ,
or any assignment operator,
.V= = ,
.V= += ,
.V= \-= ,
etc., inside of expressions is deprecated.
A statement should alter one object and only one object.
.LE
.H 1 "Classes"
.ALX 1 ()
.LI
All data members should be private.
There may be the occasional exception in very lightweight 
classes, but public data members are probably wrong.
Protected data members are also probably wrong.
.LI
All classes should be declared with a destructor
in order to indicate that it was not forgotten.
It may never be disabled, but its body may be just
.V= {} .
All pointer variables in a class must be
.V= delete d
from inside of the destructor in order to avoid memory leak.
That is, if a pointer is the last pointer to a particular object.
.LI
All classes should have a default constructor declared
which properly initializes all of the data members.
Default construction may be disabled by declaring the default
constructor as a private member and not implementing its body.
.LI
All classes should have a copy constructor declared.
It's single argument is a constant reference to an object of
its own class.
It may be disabled if the client should not use it.
.LI
All classes should have an
.V= operator=
declared.
The return type and
argument should both be a constant reference to its class.
It may be disabled.
If a class contains pointers, the default
.V= operator=
is certainly wrong.
.LI
An implementation of
.V= operator=
should always check if its argument is the same object as
.V= this .
.LI
A class's single-parameter constructors and
.V= operator=
should be semantically related so that the statements
.V= "T x;"
.V= "x = y;"
mean exactly the same as
.V= "T x (y);"
or
.V= "T x = y;",
although the former may be less efficient.
This must be true no matter the type of
.V= y .
.LI
All constructors which take a single parameter should be marked
.V= explicit ,
because otherwise they are also implicit conversion functions,
unless a specific decision has been made that such a conversion
is reasonable.
.LI
Data members which have identical values in all instances of
the class or which should be shared among all instances of
the class are declared
.V= static .
If they are of an integral type and their value is known at
compile time, 
they should be
.V= enum
constants instead of data members.
.LI
A class should have good cohesion.
That is, a class should have one purpose and serve it well.
The general purpose of a class should be describable in one
sentence without a long list of things.
The same is true of programs.
A text editor, for example, should not be able to read news,
read mail, or do word processing\(;;
nor should an operating system
contain a windowing system or a web browser.
.LI
A class should have minimal coupling.
That is, a class should keep as much as possible private
and away from the client.
The less that appears in the interface,
the less that the client needs to remember in order to
properly use the class.
.LI
Avoid inline functions in header files where possible.
Whenever you have a choice between putting something either
in an interface
.=V ( \&.h )
file or in an implementation
.=V ( \&.cc )
file, put it in the implementation file.
.LE
.H 1 "Operators and Friends"
.ALX 1 ()
.LI
For a class
.V= foo ,
declare\(::
.V= "friend ostream& operator<< (ostream&, const foo&)" ,
which will be able to format and print an object in some
reasonable default format.
.LI
Operators should be defined only when they will not violate the
Principle of Least Astonishment.
They should be chosen to be semantically consistent with
builtin and library uses of the operators.
.LI
The operator and assign
form of operators should be consistent with the base form.
For example,
.V= "a += b"
should always be interchangeable with
.V= "a = a + b"
the only possible differences being matters of efficiency.
Also,
.V= ++a 
should always be identical to
.V= "a += 1",
and, of course, to
.V= "a = a + 1".
And
.V= a++ 
should always be identical to
.V= "({t = a;"
.V= "a += 1;"
.V= "return t})" .
(This last expression is a Gnuism.)
Consider not implementing either the prefix nor postfix form of 
.V= ++
and
.V= -- .
.LI
Binary operators must have one parameter if implemented as member
functions and two parameters if implemented as non-member functions.
Unary operators must have zero parameters if implemented as member
functions and one parameters if implemented as non-member functions.
.LI
The operators
.V= ++
and
.V= --
are implemented as unary operators in their prefix form
and as binary operators with a spurious
.V= int
argument to indicate their postfix form.
.LI
It would be nice to use
.V= operator**
as the exponentiation operator, as is done in other languages,
but you can't, because
.V= "a ** b"
means
.V= "a * (*b)" .
And don't define
.V= operator\[ha]
as exponentiation either,
since its precedence is wrong for that and it means exclusive or.
An exponentiation operator should be a binary operator with a
higher precedence than multiply and divide, but there are none.
.LI
Relational operators are related.
After the statement
.V= "a = b" ,
it should always be the case that
.V= "a == b" .
Whenever
.V= "a == b"
is true,
.V= "a != b"
should always be false.
Similar comments apply to
.V= < ,
.V= <= ,
.V= > ,
and
.V= >= .
The relational operators and
.V= ! 
should always return a
.V= bool 
result.
.LI
If it is necessary to use an object in a boolean context,
define an
.V= "operator bool"
to implicitly convert the class to boolean.
Do not use the older style of providing an implicit converstion to
.V= void* ,
which was a hack to get the same effect before
.V= bool 
was in the language.
Better yet, 
consider member functions such as 
.V= good()
or
.V= error()
instead, for use such as\(::
.V= "if (x.good())" \|.\|.\|.
.LI
Define related operators.
For example, if
.V= "a + b"
is meaningful, then implement the reverse operator so that
.V= "b + a"
provides a meaningful result,
although the second will have to be defined via the friend
mechanism.
Side note\(::
.V= operator+
is not always commutative, as that depends on the objects
being handled\(;;
e.g.,
not all string and matrix operators are commutative.
.LE
.H 1 "Single Inheritance"
.ALX 1 ()
.LI
Any class that has any virtual function must have its
destructor declared as virtual.
.LI
If a class is involved in inheritance,
all function members probably should be virtual.
.LE
.FINISH
