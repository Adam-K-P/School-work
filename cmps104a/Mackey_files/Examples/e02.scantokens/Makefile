# $Id$

GPP     = g++ -g -O0 -std=gnu++11 -Wall -Wextra

SOURCES = lexer.l tokens.h main.cc Makefile
EXECBIN = scantokens
OBJECTS = lexer.o main.o

all : ${EXECBIN}

${EXECBIN} : ${OBJECTS}
	${GPP} ${OBJECTS} -o ${EXECBIN}

%.o : %.cc tokens.h
	${GPP} -c $<

lexer.o : lexer.l
	flex -olexer.cc lexer.l
	${GPP} -c lexer.cc -o lexer.o

clean :
	- rm lexer.cc ${OBJECTS} test.out

spotless : clean
	- rm ${EXECBIN} Listing.ps Listing.pdf

ci : ${SOURCES}
	- checksource ${SOURCES}
	cid + ${SOURCES}

test : ${EXECBIN}
	(echo '# This is a comment.' \
	;echo '12.3 12.0 .3 1123.4e4 ;' \
	;echo 'hello = world +.1234;' \
	;echo 'this * that + foo / bar;' \
	;echo '+ - * /' \
        ;echo 'Errors . : ( )' \
	) | ${EXECBIN} >test.out 2>&1

lis : test
	mkpspdf Listing.ps ${SOURCES} test.out

again :
	gmake spotless ci all lis

