# $Id: Makefile,v 1.13 2014-10-09 18:25:05-07 - - $

GCC    = g++ -g -O0 -Wall -Wextra -std=gnu++11

all : wordcount

wordcount : wordcount.cc
	${GCC} wordcount.cc -o wordcount

wordcount.cc : wordcount.l
	flex -owordcount.cc wordcount.l 2>&1

clean :
	- rm wordcount wordcount.cc test.log

spotless : clean
	- rm wordcount Listing.ps Listing.pdf

lis : wordcount.l Makefile test.log
	mkpspdf Listing.ps wordcount.l Makefile test.log
	- rm test.log

ci : wordcount.l Makefile
	cid + wordcount.l Makefile

test.log : wordcount
	(echo This is a small test file.; LC_TIME=C date) >test.in
	./wordcount -L <test.in 1>test.out 2>test.err
	catnv test.in test.out test.err >test.log
	- rm test.in test.out test.err
	
again :
	gmake spotless ci all lis

