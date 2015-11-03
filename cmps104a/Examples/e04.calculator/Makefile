# $Id: Makefile,v 1.12 2014-10-24 16:28:32-07 - - $

GPP      = g++ -g -O0 -Wall -Wextra -std=gnu++0x
GPPNW    = g++ -g -O0 -std=gnu++0x
GPPDEP   = g++ -MM

TXTS	= README
HDRS	= extern.h
SRCS	= main.cc scanner.l parser.y
GENS	= parser.h scanner.cc parser.cc
OBJS	= main.o scanner.o parser.o
BINS	= calculator
LOGS	= scanner.log parser.log

OUT1	= test1.out test1.err
OUT2	= test2.out test2.err
OUTS	= ${OUT1} ${OUT2}
IN1	= test1.in ${OUT1}
IN2	= test2.in ${OUT2}
INS	= ${IN1} ${IN2}
OUTPUT  = test1.lis test2.lis
LISTS	= Listing.pdf Listing.ps
MAKES	= Makefile Makefile.deps
DEPS    = ${filter %.cc, ${SRCS} ${GENS}}
NOINCL  = ${filter ci clean spotless, ${MAKECMDGOALS}}

LISTING	= ${TXTS} ${HDRS} parser.h ${SRCS} ${MAKES} ${OUTPUT}
CLEAN	= core ${OBJS} ${GENS} ${LOGS} ${OUTS} ${LISTS}
RCS	= ${TXTS} ${HDRS} ${SRCS} Makefile test*.in

define MORE
MORE() { \
   LIS=$$1; shift; \
   for i in $$*; do \
      echo ::::::::::::::::; \
      echo $$i; \
      echo ::::::::::::::::; \
      cat -nv $$i; \
   done >$$LIS; \
}
endef


all: ${BINS}

clean:
	- rm ${CLEAN}

spotless: clean
	- rm ${GENS} ${BINS} Makefile.deps ${OUTPUT}

deps:
	- rm Makefile.deps
	${MAKE} --no-print-directory Makefile.deps

out: ${OUTS}

lis: out
	mkpspdf Listing.ps ${LISTING}

calculator: ${OBJS}
	${GPP} -o calculator ${OBJS}

%.o: %.cc
	${GPP} ${CFLAGS} $< -c

scanner.cc: scanner.l
	flex -oscanner.cc scanner.l >scanner.log 2>&1
	- cat lex.backup >>scanner.log
	- rm lex.backup

parser.cc parser.h: parser.y
	bison -o parser.cc parser.y
	- mv parser.hh parser.h
	- mv parser.output parser.log

test1.lis test1.out test1.err: ${BINS} test1.in
	./calculator <test1.in >test1.out 2>test1.err
	${MORE}; MORE test1.lis test1.in test1.out test1.err

test2.lis test2.out test2.err: ${BINS} test2.in
	./calculator -ly <test2.in >test2.out 2>test2.err
	${MORE}; MORE test2.lis test2.in test2.out test2.err

ci : ${RCS}
	cid + ${RCS}

Makefile.deps: Makefile ${GENS}
	${GPP} -MM ${DEPS} >Makefile.deps

again :
	${MAKE} --no-print-directory spotless ci all lis

ifeq (${NOINCL},)
include Makefile.deps
endif

