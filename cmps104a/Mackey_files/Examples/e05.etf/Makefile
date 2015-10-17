# $Id: Makefile,v 1.3 2014-11-06 19:04:28-08 - - $

GCC = g++ -g -O0 -Wall -Wextra -std=gnu++11

all : etf

etf : etf.tab.cc
	${GCC} etf.tab.cc -o etf

etf.tab.cc : etf.yy
	bison etf.yy

ci :
	cid + Makefile etf.yy

spotless : clean
	- rm Listing.{ps,pdf} test?.log

clean :
	- rm etf.tab.cc etf.output etf

test : etf
	./etf "a*b+c*d" >test1.log 2>&1
	./etf "a*(b+c)" >test2.log 2>&1
	./etf "f(c)"  >test3.log 2>&1

lis : test
	mkpspdf Listing.ps etf.yy etf.output test?.log Makefile
