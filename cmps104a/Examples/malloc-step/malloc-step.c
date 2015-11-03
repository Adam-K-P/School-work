// $Id: malloc-step.c,v 1.5 2015-05-08 14:33:22-07 - - $

#include <stdio.h>
#include <stdlib.h>

int main (void) {
   char* prev = 0;
   for (int i = 0; i < 16; ++i) {
      char* curr = malloc (1);
      printf ("%p %ld 0x%02lX\n", curr, curr - prev, curr - prev);
      prev = curr;
   }
   return 0;
}

//TEST// malloc-step >malloc-step.out 2>&1
//TEST// more malloc-step.c malloc-step.out >malloc-step.lis </dev/null
//TEST// mkpspdf malloc-step.ps malloc-step.lis

