// $Id: interp.c,v 341.3 2010-11-23 18:40:08-08 - - $

#include <stdio.h>
#include <stdlib.h>

int main (int argc, char **argv) {
   for (int argi = 0; argi < argc; ++argi) {
      printf ("argv[%d]=%s\n", argi, argv[argi]) ;
   }
   return EXIT_SUCCESS;
}
