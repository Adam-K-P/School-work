# $Id: Makefile,v 1.36 2014-10-09 18:07:20-07 - - $

GCC    = g++ -g -O0 -Wall -Wextra -std=gnu++0x
EXEC   = expr-recdes
LIST   = ${EXEC}.cc Makefile test.in test.out

all : ${EXEC}

% : %.cc
	${GCC} $< -o $@

test.out: ${EXEC} test.in
	${EXEC} <test.in >test.out 2>&1
	if [ -f core ] ; then rm core ; fi

ci :
	checksource ${filter-out test.out, ${LIST}}
	cid + expr-recdes.cc Makefile test.in

lis : test.out
	killps gv
	mkpspdf Listing.ps ${LIST}

