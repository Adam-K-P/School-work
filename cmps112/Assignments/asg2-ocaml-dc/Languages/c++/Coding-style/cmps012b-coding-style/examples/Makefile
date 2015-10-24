# $Id: Makefile,v 1.1 2009-12-17 18:04:46-08 - - $

SOURCES = Makefile args.java argv.c
LINTOPT = -D__EXTENSIONS__ -Xa -fd -m -u -x -errchk=%all,no%longptr64
CCOPT   = -D__EXTENSIONS__ -Xc -v -g -xO0
CHECKIN = LOGNAME=- ci -m- -q -s- -t- -u -zLT ${1} ; \
          rcs -q -U ${1} ; chmod u+w ${1}

all : args argv

args : args.class
	echo Main-class: args >Manifest
	jar cvfm args Manifest args.class
	- rm Manifest
	chmod +x args

args.class : RCS args.java
	${call CHECKIN, args.java}
	javac args.java

argv : argv.o
	cc ${CCOPT} argv.o -o argv

argv.o : RCS argv.c
	${call CHECKIN, argv.c}
	cc ${CCOPT} -c argv.c

lint : argv.c
	lint ${LINTOPT} argv.c

ci : RCS ${SOURCES}
	${call CHECKIN, ${SOURCES}}

RCS :
	mkdir RCS

ident : ${SOURCES}
	ident ${SOURCES}

clean :
	- rm args.class argv.o

spotless : clean
	- rm args argv

