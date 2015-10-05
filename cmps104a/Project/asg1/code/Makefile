# $Id: Makefile,v 1.8 2014-10-07 17:37:02-07 - - $

GPP   = g++ -g -O0 -Wall -Wextra -std=gnu++11
GRIND = valgrind --leak-check=full --show-reachable=yes

all : oc

teststring : main.o stringset.o
	${GPP} main.o stringset.o -o teststring

%.o : %.cpp
	${GPP} -c $<

ci :
	cid + Makefile stringset.h stringset.cpp main.cpp

spotless : clean
	- rm oc Listing.ps Listing.pdf test.out test.err

clean :
	-rm oc.o main.o

test : oc
	${GRIND} oc * * * >test.out 2>test.err

lis : test
	mkpspdf Listing.ps stringset.h stringset.cpp main.cpp \
	        Makefile test.out test.err

# Depencencies.
main.o: main.cpp stringset.h
stringset.o: stringset.cpp stringset.h

