.so Tmac.mm-etc
.if t .Newcentury-fonts
.SIZE 12 14
.INITR* \n[.F]
.TITLE "Tutorial\(:) the \f[CB]extern\f[P] keyword"
.RCS "$Id: extern-tutorial.mm,v 1.67 2014-10-10 17:13:03-07 - - $"
.PWD
.URL
.nr SHELLCNT 0 1
.de COMMAND
.   P
.   ft CR
.   nop -bash-\\n+[SHELLCNT]$
.   ft CB
.   nop \\$*
.   ft CR
.   br
.   nf
.   pso \\$* | expand | groffify | fmt -80 -s
.   br
.   ft R
.   fi
..
This is a short tutorial on the use of the
.V= extern
keyword in C.
Each brief item comments on a shell command,
the output of which is shown after the command.
User input is shown in 
.V= Courier-Bold
and computer output is shown in plain
.V= Courier .
.ALX 1 ()
.LI
All of these commands are being run on a Unix server.
First, let's look at some of the server's properties.
.COMMAND hostname
.COMMAND uname --kernel-name --kernel-release --kernel-version
.COMMAND uname --nodename --operating-system
.COMMAND uname --machine --processor --hardware-platform
.LI
The program was built with the simple script
.V= mk .
.COMMAND cat code/mk
.COMMAND cd code; mk
.LI
Using the command
.V= file (1),
we examine the types of the files in the 
.V= code/
subdirectory.
.COMMAND file code/*
.LI
The files in
.V= code/
are listed as follows.
.COMMAND ls -goad code/*
.LI
The file
.V= code/main.c
uses an external variable exported from another module.
.COMMAND cat code/main.c
.LI
The file
.V= code/ext.c
exports an external variable.
.COMMAND cat code/ext.c
.LI
The file
.V= code/ext.h
is included in both and links the two.
Note the file guards.
.COMMAND cat code/ext.h
.LI
When run, the program produces the following output.
.COMMAND code/a.out
.LI
Every module that accesses an external variable must declare it
using the
.V= extern
keyword.
In order to ensure consistency of declaration,
this should be placed in a header file.
The module exporting the variable, and only that module,
then redeclares that same variable without the
.V= extern
keyword.
Every external variable must be declared without the 
.V= extern
keyword in exactly one module.
.LI
If not declared at all,
one gets an undefined external reference error at link time.
If declared more than once,
then the error is a duplicate declaration error at link time.
If not declared as
.V= extern
in a header file,
then the variables are local to the file and not related.
.LI
Now consider the output of running
.V= nm (1)
on each of the object files.
The 
.V= extern
keyword in the header file marks the variable as external,
that is global to both modules.
It is redeclared in the file
.V= ext.c
without the
.V= extern keyword, so
.V= "nm code/ext.o"
produces the following output.
.COMMAND nm code/ext.o
.LI
On the other hand, running
.V= "nm code/main.o"
shows that
.V= external_variable
is undefined in that module.
.COMMAND nm code/main.o
.LI
Looking at the executable image
.V= a.out
with
.V= "nm code/a.out"
we see that each symbol has a specific address assigned to it.
It also has references included from the library.
The letter shows whether the object is Undefined,
or belongs to the Text, Data, or BSS segment,
or if it is Absolute.
See
.V= nm (1)
for a complete explanation.
.COMMAND nm code/a.out
.LI
The sizes of the segments in the object files and executable binary
can be obtained via 
.V= size (1).
.COMMAND cd code; size *.o a.out
.LE
.FINISH
