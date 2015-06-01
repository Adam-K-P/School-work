# Adam Pinarbasi akpinarb

GCC      = gcc -g -O0 -Wall -Wextra -std=gnu11
MKDEPS   = gcc -MM

EXECBINS = numsort linesort 
LIBSRC   = inssort.c inssort.h 
OBJECTS  = ${EXECBINS:=.o} 
SOURCES  = ${LIBSRC} ${EXECBINS:=.c} Makefile README
DEPFILE  = Makefile.deps
LISFILES = ${SOURCES} ${DEPFILE}
LISTING  = Listing.ps

all: ${EXECBINS}

%: %.o inssort.o
	${GCC} -o $@ $^ -lm

%.o: %.c
	${GCC} -c $<

ci: ${SOURCES}
	checksource ${SOURCES}
	cid + ${SOURCES}

submit : ${SOURCES}
	sub12b lab9 ${SOURCES}


