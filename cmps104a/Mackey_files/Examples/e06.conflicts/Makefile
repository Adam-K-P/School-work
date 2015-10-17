# $Id: Makefile,v 1.7 2011-10-28 19:14:54-07 - - $

SOURCES  = ambiguous-else.y unambiguous-else.y \
           reduce-reduce.y notlalr1.y
STDOUTS  = ${SOURCES:.y=.stdout}
STDERRS  = ${SOURCES:.y=.stderr}
TAB_C    = ${SOURCES:.y=.tab.c}
OUTPUTS  = ${SOURCES:.y=.output}
LOGFILES = ${SOURCES:.y=.logfile}
LISTING  = Listing.ps

all : ${LOGFILES}

%.logfile : %.output

%.logfile : %.y
	cid + $<
	echo bison -v $< >$*.logfile
	bison -v $< 1>$*.stdout 2>$*.stderr
	more $*.stdout $*.stderr $*.output >>$*.logfile
	rm $*.tab.c $*.stdout $*.stderr $*.output

clean :
	- rm ${STDOUTS} ${STDERRS} ${TAB_C} ${OUTPUTS}

spotless : clean
	- rm ${LOGFILES} ${LISTING} ${LISTING:.ps=.pdf}

ci : ${SOURCES} Makefile
	cid + $^

lis : all
	cid + Makefile
	mkpspdf ${LISTING} ${foreach src, ${SOURCES}, \
	        ${src} ${patsubst %.y, %.logfile, ${src}}}

