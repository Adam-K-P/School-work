//Adam Pinarbasi akpinarb

#include <assert.h>
#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <values.h>
#include "inssort.h"

#define MAX_SIZE 4096

int exit_status = EXIT_SUCCESS;

int doublecmp(const void *this_p, const void *that_p)
{
   double this = *((double*)(this_p));
   double that = *((double*)(that_p));
   //printf("%lf\n%lf\n", this, that);
   if(this > that) return 1;
   else return 0;
}

int main(void)
{
   double array[MAX_SIZE];
   size_t size = sizeof(array[0]);
   size_t nelem = 0;
   for(;; ++nelem)
   {
      if(nelem == MAX_SIZE) break;
      if(scanf("%lf", &(array[nelem])) == EOF) break; 
   }
   inssort((void*)array, nelem, size, doublecmp);
   for(size_t i = 0; i < nelem; ++i)
       printf("%20.15g\n", array[i]);
   return exit_status;
}

