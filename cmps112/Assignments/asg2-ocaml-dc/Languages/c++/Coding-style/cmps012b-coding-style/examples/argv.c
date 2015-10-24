// Author:  Your Name, username@ucsc.edu
// $Id: argv.c,v 1.1 2009-12-17 18:04:46-08 - - $
//
// NAME
//    argv - print out the strings in argv
//
// SYNOPSIS
//    argv [string...]
//
// DESCRIPTION
//    Print out the strings from the command line argument vector.
//

#include <stdio.h>
#include <stdlib.h>

int main (int argc, char **argv) {
   int argi;
   for (argi = 0; argi < argc; ++argi) {
      printf ("argv[%d]=\"%s\"\n", argi, argv[argi]);
   }
   return EXIT_SUCCESS;
}

