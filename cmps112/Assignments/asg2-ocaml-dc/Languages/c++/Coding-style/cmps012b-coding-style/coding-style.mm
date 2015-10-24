.so Tmac.mm-etc
.if t .Newcentury-fonts
.SIZE 12 14
.INITR* \n[.F]
.TITLE "Coding Style"
.RCS "$Id: coding-style.mm,v 1.241 2014-04-03 19:43:01-07 - - $"
.PWD
.URL
.de andhalf
.   if t \\$1\[12]
.   if n \\$1\~1/2
..
.de CODE
.   VICODE* 1 \\$@
..
.de PSO-ON
.   ft CR
.   nf
.   eo
..
.de PSO-OFF
.   ec
.   fi
.   ft R
..
.de http
.   =V [ http://\\$1 ]\\$2
..
.\" .ds BASE-TITLE-LEFT \*[TITLE-LEFT]
.\" .de HY
.\" .   RI "\\n[hd*level] \\n[hd*arg1] \\$2 (\\*(}0) (\\$3)"
.\" .   ds TITLE-LEFT \\*[BASE-TITLE-LEFT] \[bu] \\*[}0]\\$3
.\" ..
.INITR* \n[.F]
.EQ
delim $$
.EN
Programs are a communication device not only from a person to a
computer,
but from a person to another person,
and should thus be readable.
Time spent in making a program readable makes it easier for
others to read your program.
.P
This document provides some general coding style guidelines.
They are necessarily incomplete and not every statement is applicable
to every programming language.
Examples are restricted to the C and Java languages,
since those are the only programming languages seen by UCSC
students in introductory courses.
.P
Most text is in Roman or
.BR Bold
font for the narrative.
In coding examples,
.V= "Courier Bold"
is mostly used to indicate what you type in exactly, and
.IR Italic
to indicate something you substituted.
In computer interaction listings,
.T= "Courier Roman"
is used to indicate what the computer displays and
.V= "Courier Bold"
to indicate what you type in yourself at the keyboard.
.P
This document is expected to be marginally comprehensible to students
at the beginning of CMPS-012A,
mostly comprehensible to students at the end of CMPS-012A or the
beginning of CMPS-012B,
and completely comprehensible to students who have completed
CMPS-012B, or any course for which it is a prerequisite.
.H 1 "General introduction"
.ALX 1 ()
.LI
The first line of every text file you submit for evaluation should
contain your personal name and
.IV username @ucsc.edu
at the top of the file.
If it is program file, this must be in a comment.
A text file is any file readable with an editor,
.V= cat (1),
.V= more (1), 
etc., be it a program source file, a
.V= Makefile ,
or a
.V= README .
In the case of a shell or Perl script, 
it must be the second line, the first line being the hash-bang
.=V ( #! )
line, as in 
.CODE "#!/bin/bash"
.LI
When resizing an 
.V= xterm
using your window manager,
look for the little box that shows its dimension.
It might say something like
.V= 80x75 .
Make sure the 
.V= xterm 
is 80 columns wide.
Choose whatever height is convenient for your screen.
Taller is better.
Taller than the screen is not good.
History\(::
The original DEC VT-100 terminal, which
.V= xterm 
emulates had 80 columns and 24 lines, which is why the default
.V= xterm
uses
.V= "-geometry 80x24" .
.LI
Messages sent in email should have
lines limited to 65 characters,
so that when quoted in a followup,
lines tend not to wrap and are still shorter than 72 characters
after several followups.
History\(::
A page is
.andhalf 8
inches wide and with 1 inch margins
leaves
.andhalf 6
inches for text.
A standard typewriter font prints 10 characters per inch,
which is 65 characters per line.
.LI
To reformat a paragraph from inside
.V= vi (1),
the 
.V= fmt (1)
command may be used in several ways, 
sometimes with the crown margin
.=V ( -c )
option.
A couple of examples follow\(::
.CODE "{!}fmt -65"
.CODE ":10,20!fmt -65
.LI
If you insist on having a signature keep it to four or fewer lines.
No one wants to see an ASCII cartoon or box of asterisks.
And, of course, a
.V= \&.gif
or
.V= \&.jpg
is quite obnoxious.
.LI
If you use
.V= vi (1),
create a file called
.V= \&.exrc
in your home directory.
A sample
.V= \&.exrc 
file is shown in the
.V= examples/
subdirectory.
Your
.V= \&.exrc
should contain at least the following lines\(::
.CODE "set number"
.CODE "set showmode"
.LE
.H 1 "File format"
.ALX 1 ()
.LI
Lines of source code should never be longer than 72 characters.
The standard
.V= xterm (1)
is 80 columns wide,
and when the 
.V= ":set number"
option is used in
.V= vi (1),
line numbers are displayed in a field of width 8 on the left side
of the screen.
Lines longer than 72 characters thus cause ugly and unreadable
wraparound.
History\(::
Punched cards were 80 columns wide, 
with 72 characters being used for data and the remaining 8 characters
used for sequence numbers (in case you dropped your deck).
.LI
Text files should contain only visible printable characters,
spaces, and newlines.
Specifically, there should
.E= never
be carriage return
.=V ( \[ha]M )
characters in a file.
If you have the extremely bad judgement to edit using bloatware
from M*cr*\[Do]*ft,
you may delete them with such programs as
.V= dos2unix (1),
by using the
.V= vi
command
.CODE ":g/\[ha]V\[ha]M/s///"
or with the shell command
.CODE "perl -pi -e 's/\[rs]r//g' " filename
.LI
Do not use tabs in files.
When used for indentation,
they cause the code to move too far to the right,
thus making lines appear longer than 72 characters.
Never use an editor command to change the length of a tab,
since that will not necessarily be the same when viewed by someone else
using a different editor.
The command
.V= expand (1)
can be used to remove tabs from files.
.LI
.E= Exception\(::
When typing in a
.V= Makefile ,
tabs are required before commands, 
but never elsewhere.
Use exactly one tab at the beginning of a shell command in a 
.V= Makefile .
Making tabs significant was a design flaw in
.V= make (1),
which
.V= gmake
follows.
.LI
The last character of every line in a text file must always be a
newline character.
This includes the last line of a file.
The
.V= vi (1)
editor automatically ensures that this is true, but
.V= emacs (1)
does not.
If you use
.V= emacs ,
make sure your home directory has a file called
.V= \&.emacs
(note the initial dot)
containing the line
.CODE "(setq require-final-newline t)"
.LI
Every file should usually contain an
.V= "RCS \[Do]Id\[Do]"
string.
This identifies a copy of any printed listing with a specific
version number.
This identifier should be the first
(after your name and username)
or last line of a file,
and,
for any given project, be consistently placed.
For a program, it usually appears in a comment,
but it may instead appear in a macro or string
in order to propagate it into an object file.
All versions of all files must be archived in an
.V= RCS ,
.V= CVS ,
.V= SVN ,
or
.V= Git
repository.
.LI
.V= SVN
users should Google for
.=V `` svn:keywords ''
to find out how to do this.
See
.http svnbook.red-bean.com/en/1.0/ch07s02.html
for a command like
.CODE "svn propset svn:keywords \[Dq]Id\[Dq] " filename
.LI
One of the following commands can be used to check for invalid
unprintable characters in a file (usually tabs and carriage returns)
and for a missing newline at end of file.
It 
.V= cat s
the file using the
.V= -vt
option which displays invisible characters visibly,
and pipes the output into
.V= diff (1)
to check it against the original.
A minus sign
.=V ( - )
argument to 
.V= diff
causes it to compare 
.V= stdin .
It also complains about missing newlines, if any.
We specifically omit the
.V= -t
option for
.V= Makefile s,
since tabs can not be avoided.
.ds filename.str \f[CB]-vt \f[P]\f[I]filename\f[P]
.ds Makefile.str \f[CB]-v  \f[P]\f[CB]Makefile\f[P]
.nr filename.wid \w'\*[filename.str]'
.nr Makefile.wid \w'\*[Makefile.str]'
.nr diffname.wid \n[filename.wid]-\n[Makefile.wid]
.ie \n[diffname.wid]<0 .as filename.str \h'-\n[diffname.wid]u'
.el                    .as Makefile.str \h'\n[diffname.wid]u'
.CODE "cat \*[filename.str] 2>&1 | diff - " filename
.CODE "cat \*[Makefile.str] 2>&1 | diff - Makefile"
.LI
The following command 
.V= cat s
a file into 
.V= expand (1),
.V= cut (1)s
the first 72 characters of the file, and 
.V= grep(1)s
for any remaining line with nine or more characters.
I.e., the line numbers and excess characters are printed.
It prints nothing if all lines are within bounds.
The
.V= grep (1)
command has 9 dots,
which will match the 8-position line number plus one character.
.CODE "cat -n " filename " | expand | cut -c1-8,81- | grep ........."
.LI
Run the program
.V= checksource
(in the
.V= bin
subdirectory of the course volume)
and see that it does not complain.
.LE
.H 1 "Filenames and identifiers"
.ALX 1 ()
.LI
Filenames should be spelled using only lower case letters,
digits, periods, and underscores or minus signs.
Upper case letters in filenames are generally to be avoided,
except for special names such as
.V= Makefile
and
.V= README ,
which must be spelled exactly that way.
Commands like
.V= ls (1)
sort filenames lexicographically and thus list capitalized names before
lower case names.
Use this as a sorting tool.
The following non-alphanumeric characters generally to not cause
problems when used in filenames\(::
.CODE "% + , - . : = @ _"
.LI
Shell metacharacters are prohibited in filenames.
A slash
.=V ( / )
is a directory separator,
so Unix will not let you use it in a filename, even if you quote it.
Following is a list of shell metacharacters\(::
.CODE "! \[Dq] # \[Do] & ' ( ) * / ; < > ? \
[ \[rs] ] \[ha] ` { | } \[ti]"
The tilde
.=V ( \[ti] )
only has special meaning when it is the first character in a filename,
in which case it causes username interpolation.
This, along with the plus
.=V ( + )
and minus
.=V ( - )
characters,
may appear in a filename, 
but never as the first character.
.LI
When Java compiles inner classes, 
it creates filenames with the dollar sign
.=V ( \[Do] ),
which is a very bad design decision,
but there is nothing you can do about it.
.LI
Never use one-letter identifiers.
Using
.V= i ,
for example,
means that when searching for the variable using an editor,
the search will stop at keywords such as
.V= if
and
.V= while .
Instead, use a name related to the variable being scanned,
as in the use of
.V= argi
as an index into
.V= argv .
Never use an identifier which is a substring of a reserved word.
.LI
On the other hand, excessively long identifiers are not a good thing
either.
Names like
.V= ArrayIndexOutOfBoundsException ,
.V= NoSuchElementException ,
.V= NullPointerException ,
.V= StringIndexOutOfBoundsException ,
are excessively long and uglier than a camel.
Kernighan & Ritchie's laconic style as used in the C library is
better, e.g., 
.V= fclose ,
.V= fopen ,
.V= printf , 
.V= strcmp .
.LI
Many Java programmers like using CamelCase.
CamelCase is ugly and unnatural because it has interior capital
letters.
When using the Java API, it is not possible to avoid CamelCase.
Generally it is better for variable,
class, and function names to be
writting entirely in lower case with underscores separating words.
.LI
Identifiers should be long enough that the command
.V= grep (1)
will print out only those lines containing those identifiers,
and few other spurious lines.
Do not use excessively long names, 
nor interior capital letters.
Use underscores to separate words when that enhances readability.
.LI
Enumeration constants, preprocessor symbols, and
.V= final
variables
in Java should be spelled in
.V= UPPER_CASE .
No other identifiers should be spelled in upper case.
.LI
It is a C convention that no name may end with the characters
.V= _t
except for symbols defined via
.V= typedef .
.LI
If an identifier consists of more than one word,
and there is no ambiguity,
such as
.V= strcmp ,
etc., just concatenate the words.
If it is difficult to see the word boundary, use an underscore
.=V ( _ )
to separate the words, as in
.V= max_incr ,
for example.
.LE
.H 1 "Indentation and layout"
.ALX 1 ()
.LI
Top level constructs should always be against the left margin.
For Java, these are
.V= import 
and
.V= class
statements.
For C, they are
.V= #include s,
global variables,
and functions.
.LI
An opening brace
.=V ( { )
should never be on a line by itself.
Always place it at the end of the line after the control construct.
The corresponding closing brace
.=V ( } )
should be in the same column as the keyword or type that opened the
block.
.LI
.E= Exception\(::
Some C programmers like putting the opening brace of a
.E= function
in the leftmost column immediately underneath the return type.
This is the only case where an opening brace may appear on a line
by itself.
.LI
All code between the braces should be indented by three spaces,
as shown in the example C and Java programs.
.LI
When using an 
.V= if \|.\|.\|.\| else
structure, the
.V= else
should be on the same line as the closing brace of the corresponding
.V= if , 
When using
.V= "else if"
the entire construct from the closing brace before the
.V= else
to the opening brace after the condition should be on the same line,
if it fits.
Following is an example of the expected layout\(::
.CODE "if (" "condition" ") {"
.CODE "   " "statements \|.\|.\|."
.CODE "}else if (" "condition" ") {"
.CODE "   " "statements \|.\|.\|."
.CODE "}else {"
.CODE "   " "statements \|.\|.\|."
.CODE "}"
.LI
An infinite loop with a 
.V= break
or
.V= return
in the middle is frequently written as an empty 
.V= for -construct, 
as in
.CODE "for (;;) {"
.CODE "   " "statements \|.\|.\|."
.CODE "   if (" "condition" ") break;"
.CODE "   " "statements \|.\|.\|."
.CODE "}"
.LI
Occasionally,
both branches of the conditional will be very short and
then may be written in a slightly different style without braces,
with each statement being aligned\(::
.CODE "if (prev == null) head = newnode;"
.CODE "             else prev.link = newnode;"
.LI
In C, always use file guards in a header file.
So, for example, if you have a file called
.V= foo.h ,
make a preprocessor symbol from the filename (upper case),
as in
.CODE "#ifndef __FOO_H__"
.CODE "#define __FOO_H__"
.CODE "" "header file declarations \|.\|.\|."
.CODE "#endif"
.LI
In C, use the preprocessor symbol
.V= NULL
and not a 0, because it is more readable.
.LI
Never omit the braces if the statements being controlled by a
construct are written on a different line than the control construct.
If the
.V= if -part
has braces then so must the
.V= else -part
and vice versa.
.LI
Never omit the braces if the statement being controlled by a 
construct is itself a control construct.
This is especially important if the keyword
.V= else
is involved.
The dangling
.V= else
can introduce hard-to-find bugs.
.LI
Parentheses should be used consistently.
Either put a space immediately outside of each parenthesis,
opening or closing,
as is illustrated in the example in this document,
and never inside\(;;
or put a space immediately inside each parenthesis,
but not outside.
Every parenthesis must have a space before it or after it but not
both.
.LI
When defining a parameterized macro in C, the language prohibits a
space in front of the open parenthesis in the left side of the
definition.
.LI
Always put a space after a semi-colon in the control part of a
.V= for
statement.
Do not put more than one statement on a line without a very good
reason.
.LI
Do not use parentheses at the top level of a
.V= return
statement.
If the 
.V= return
statement is complicated, inner parentheses might be needed.
.LI
Sometimes a statement is too long for a line.
In that case, the best place to break a line is after a comma, 
as shown here.
The next line should then be indented a little further and aligned
at a sensible spot.
.CODE "out.printf (\[Dq]value = %d, string = %s, truth = %b%n\[Dq],"
.CODE "            value, this.string, the.truth);"
.LI
For a very long assignment statement,
break just in front of a very low precedence operator and align
that operator under the equal sign.
.LI
Do not declare more than one variable per line,
except for formal parameters,
which are normally declared all on the same line.
If that line is long, break after a comma, and indent the next
line to the indentation of the first parameter.
.LE
.H 1 "Comments"
.ALX 1 ()
.LI
Every program must also contain an RCS
.V= \[Do]Id\[Do]
string in a comment, macro, or string.
When you initially type it in,
just type the four characters.
The RCS
.V= ci
operation will edit that string.
.LI
The beginning of a program containing a main function should have
a large comment in the format of a Unix 
.V= man (1)
page, so shown in the examples.
.LI
If you use 
.V= //
comments,
Each of the comment markers should be lined up at the beginning of each
line,
as is shown in the example C program.
.LI
If you use
.VI "/*" "\|.\|.\|.\|" "*/"
comments, the opening
.V= /*
and closing
.V= */
should be on lines by themselves with a column of asterisks
.=V ( * )
connecting them, as is shown in the example C program.
It is also acceptable, for short comments to put both the
.V= /*
and
.V= */
on the same line.
.LI
Comments on code or functions should precede that which they describe
and be indented to the same level as the code they describe.
.LI
If code is tricky, and a comment is short,
the comment may appear after the code on the same line,
provided that it fits.
Tricky code is usually bad.
.\" .FS
.\" .IR "\[<<]equo ne credite, Teucri."
.\" .IR "quidquid id est, timeo Danaos et dona ferentis.\[>>]"
.\" .br
.\" \[em]
.\" Publius Vergilius Maro,
.\" .IR "\[AE]neidos, liber ii."
.\" .FE
.\" but, depending on your perspective,
.\" it might occasionally be good\*F.
.LE
.H 1 "Process requirements"
.ALX 1 ()
.LI
Error messages should always be printed to
.V= stderr
.=V ( System.err ),
never to
.V= stdout
.=V ( System.out ),
and an error message (whether a warning or a fatal error)
should cause a non-zero exit code.
.LI
Debug messages and trace chatter should also be written to
.V= stderr ,
not
.V= stdout ,
since they are not properly part of the output stream of a program.
.LI
An exit status of 0 should always be returned if the program worked.
A non-zero exit status between 1 and 255 should be returned
if the program failed.
In C, use the preprocessor symbols
.V= EXIT_SUCCESS
for 0 and
.V= EXIT_FAILURE
for 1,
rather than the numbers.
.LI
In Java, the
.V= main
function is of type 
.V= void
and returns an exit status of 0 if it returns.
To return a non-zero exit status, use the function
.V= System.exit .
Define the following constants\(::
.CODE "public static final int EXIT_SUCCESS = 0;"
.CODE "public static final int EXIT_FAILURE = 1;"
.LE
.H 1 "Coding strategy"
.ALX 1 ()
.LI
Avoid confusing uses of the
.V= ++
and
.V= -- 
operators.
The following is very bad\(::
.CODE "data[++index] = other[++index];"
.LI
Never\*F use a 
.FS
Edsger W.\& Dijkstra\(::
Go To Statement Considered Harmful.
.http www.acm.org/classics/oct95/
.FE
.V= goto \*F.
.FS
Edsger W.\& Dijkstra\(::
EWD 214\(::
A Case against the GO TO Statement.
.http www.cs.utexas.edu/users/EWD/ewd02xx/EWD215.PDF
.FE
Well, almost never\*F.
.FS
Donald E. Knuth\(::
Structured Programming with go to Statements.
ACM Computing Surveys, vol.\~6, December 1974, pp.\~261\[en]301.
.http portal.acm.org/citation.cfm?id=356640
.FE
Most programmers, upon being told to go to hell\*F,
.FS
.IR "\[<<]Lasciate ogne speranza, voi ch'intrate.\[>>]" 
\[em]
Dante Alighieri,
.IR "La Divina Commedia, Inferno, canto iii."
.FE
will object more to the method than the destination.
The
.V= break ,
.V= continue ,
and
.V= return
statements make a
.V= goto 
absolutely unnecesary for well-written code.
Java has, in addition to these,
.V= try ,
.V= catch ,
and
.V= throw .
.LI
In C,
.V= gdb (1)
and
.V= valgrind (1)
to check for bad memory accesses and memory leak.
.LI
If you use
.V= gcc
to compile your programs, use the following options\(::
.CODE "gcc -g -O0 -Wall -Wextra -std=gnu99"
.LI
Study the Ten Commandments for C Programmers (Annotated Edition),
by Henry Spencer,
available at 
.http www.lysator.liu.se/c/ten-commandments.html
.LE
.H 1 "Example code"
Following are some example programs and code.
The files are all in a subdirectory 
.V= examples/ .
The line numbers are present for ease of classroom discussion,
and are not actually in the document.
The leftmost characters in the text of the programs is actually
flush against the left margin,
indented code being moved over a little.
Each example is preceded by a shell pipelines that test for basic
formatting sanity.
.P
An example
.V= Makefile
is shown at the end of this document.
but a detailed discussion is beyond the scope of this document.
Refer to the classroom presentation at the appropriate time.
In general, it is a better idea to use
.V= gmake
rather than
.V= make ,
since it is more powerful,
and has builtin as well as user-defined functions.
.SP 10i
.H 2 "An example Java program"
.TVCODE* 0 "bash-% " \
"cat -vt examples/args.java | diff - examples/args.java"
.PSO-ON
.pso cat -vt examples/args.java | diff - examples/args.java
.PSO-OFF
.TVCODE* 0 "bash-% " \
"cat -n  examples/args.java | expand | cut -c1-8,81- | grep ........."
.PSO-ON
.pso cat -n examples/args.java | expand | cut -c1-8,81- | grep .........
.PSO-OFF
.TVCODE* 0 "bash-% " "cat -nv examples/args.java | expand"
.PSO-ON
.pso cat -nv examples/args.java | expand
.PSO-OFF
.SP 10i
.H 2 "An example C program"
.TVCODE* 0 "bash-% " \
"cat -vt examples/argv.c | diff - examples/argv.c"
.PSO-ON
.pso cat -vt examples/argv.c | diff - examples/argv.c
.PSO-OFF
.TVCODE* 0 "bash-% " \
"cat -n  examples/argv.c | expand | cut -c1-8,81- | grep ........."
.PSO-ON
.pso cat -n examples/argv.c | expand | cut -c1-8,81- | grep .........
.PSO-OFF
.TVCODE* 0 "bash-% " "cat -nv examples/argv.c | expand"
.PSO-ON
.pso cat -nv examples/argv.c | expand
.PSO-OFF
.SP 10i
.H 2 "An example \f[CB]Makefile\f[P]"
Note that tabs only appear in the left margin to indent commands,
not comments, macro definitions, or dependency specifications.
When displayed at a terminal or on paper,
tabs appear to be eight spaces.
.P
.TVCODE* 0 "bash-% " \
"cat -v  examples/Makefile | diff - examples/Makefile"
.PSO-ON
.pso cat -v examples/Makefile | diff - examples/Makefile
.PSO-OFF
.TVCODE* 0 "bash-% " \
"cat -n  examples/Makefile | expand | cut -c1-8,81- | grep ........."
.PSO-ON
.pso cat -n examples/Makefile | expand | cut -c1-8,81- | grep .........
.PSO-OFF
.TVCODE* 0 "bash-% " "cat -nv examples/Makefile | expand"
.PSO-ON
.pso cat -nv examples/Makefile | expand
.PSO-OFF
.SP 10i
.H 2 "An example \f[CB].exrc\f[P]"
Note the output of the invalid character checking shell command.
As a special case, the
.V= set
commands in the
.V= \&.exrc
need to actually terminate with a carriage return character.
In input mode,
they can be typed in with
.V= \[ha]V\[ha]M
(Ctrl/V,\~Ctrl/M).
The leading quote
.=V ( \[Dq] )
is a comment marker.
The command
.V= "set showmatch"
is useful for typing in programs when you need to see matching
parentheses, brackets, and braces as you type them in.
.P
.TVCODE* 0 "bash-% " "cat -nv examples/.exrc | expand"
.PSO-ON
.pso cat -nv examples/.exrc | expand
.PSO-OFF
.SP 10i
.H 2 "A format-checking script \f[CB]check.sh\f[P]
Following is a script that performs basic format checking.
.P
.TVCODE* 0 "bash-% " "cat -nv examples/check.sh"
.PSO-ON
.pso cat -nv examples/check.sh
.PSO-OFF
.SP 10i
.H 2 "A file format fixing script \f[CB]fixfile.sh\f[P]
A script that removes carriage returns, expands tabs,
and adds a trailing newline if necessary.
.P
.TVCODE* 0 "bash-% " "cat -nv examples/fixfile.sh"
.PSO-ON
.pso cat -nv examples/fixfile.sh
.PSO-OFF
.FINISH
