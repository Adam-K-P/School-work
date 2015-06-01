# $Id: Makefile,v 1.11 2015-02-03 18:27:45-08 - - $

MKFILE    = Makefile
NOINCLUDE = ci clean spotless
NEEDINCL  = ${filter ${NOINCLUDE}, ${MAKECMDGOALS}}

GCC       = gcc -g -O0 -Wall -Wextra -std=gnu11
MKDEPS    = gcc -MM

CSOURCE   = mstat.c 
OBJECTS   = ${CSOURCE:.c=.o} 
EXECBIN   = mstat
SOURCES   = ${CSOURCE} ${MKFILE}
LISTING   = Listing.ps

all : ${EXECBIN}

${EXECBIN} : ${OBJECTS}
	${GCC} -o $@ ${OBJECTS}

%.o : %.c
	${GCC} -c $<

ci : ${SOURCES}
	cid + ${SOURCES}
	checksource ${SOURCES}

lis : ${SOURCES} 
	mkpspdf ${LISTING} ${SOURCES} 

clean :
	- rm  ${OBJECTS}  core

spotless : clean
	- rm ${EXECBIN} ${LISTING} ${LISTING:.ps=.pdf}


ifeq "${NEEDINCL}" ""
endif

