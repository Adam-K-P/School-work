# $Id: Makefile,v 1.13 2014-10-10 14:53:15-07 - - $

#
# Define programs and options to be used.
#

MKFILE   = Makefile
DEPFILE  = ${MKFILE}.dep
NOINCL   = ci clean spotless
NEEDINCL = ${filter ${NOINCL}, ${MAKECMDGOALS}}
GMAKE    = ${MAKE} --no-print-directory

GCC      = g++ -g -O0 -Wall -Wextra -std=gnu++11
GCCDEP	 = g++ -MM

#
# Define set of files to be processed.
#

SOURCES	 = parser.y scanner.l main.cc extern.h parser.h ${MKFILE}
GENS	 = parser.h parser.cc parser.log scanner.cc scanner.log
OBJECTS	 = parser.o scanner.o main.o
EXECBIN	 = infixtorpn
CSOURCES = ${filter %.cc, ${SOURCES} ${GENS}}
OUTPUTS  = scanner.log parser.log test1.lis test2.lis

#
# General recipes for building software.
#

all : ${EXECBIN}

infixtorpn : ${OBJECTS}
	${GCC} -o infixtorpn ${OBJECTS}

%.cc : %.l
	flex -o$@ $< >$*.log 2>&1
	- cat lex.backup >> $*.log
	- rm lex.backup

%.cc : %.y
	bison -dtv -o$@ $<
	mv parser.hh parser.h
	- mv $*.output $*.log

%.o : %.cc
	${GCC} -c $<


#
# Other miscellaneous actions.
#

test1.lis : test1.in ${DEPFILE} ${EXECBIN}
	infixtorpn -ly <test1.in >test1.out 2>test1.err
	morecat ${DEPFILE} test1.in test1.out test1.err >test1.lis
	rm test1.out test1.err

test2.lis : test2.in ${DEPFILE} ${EXECBIN}
	infixtorpn -ly <test2.in >test2.out 2>test2.err
	morecat ${DEPFILE} test2.in test2.out test2.err >test2.lis
	rm test2.out test2.err

lis : ${SOURCES} ${OUTPUTS}
	mkpspdf Listing.ps ${SOURCES} ${OUTPUTS}

ci : ${SOURCES}
	cid + ${SOURCES}

clean : 
	- rm ${OBJECTS} ${GENS} core

spotless : clean
	- rm ${EXECBIN} Listing.ps Listing.pdf ${DEPFILE}

again :
	${GMAKE} spotless ci all lis

deps : ${CSOURCES}
	@ echo "# ${DEPFILE} created `LC_TIME=C date`" >${DEPFILE}
	${GCCDEP} ${CSOURCES} >>${DEPFILE}

${DEPFILE} :
	@ touch ${DEPFILE}
	${GMAKE} deps

ifeq (${NEEDINCL},)
include ${DEPFILE}
endif
