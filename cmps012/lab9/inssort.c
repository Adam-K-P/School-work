//Adam Pinarbasi akpinarb
#include <alloca.h>
#include <assert.h>
#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <values.h>
#include "inssort.h"

void inssort(void *base, size_t nelem, size_t size, 
             int (*compar)(const void*, const void*))
{
   void *temp = alloca(size);
   void *temp_1 = base;
   for(size_t i = 1; i < nelem; ++i)
   {
      if(compar(base, (void*)((double*)(base)+1)))
      {
         void *base_1 = (void*)((double*)(base)+1);
         temp = memmove(temp, base, size);
         base = memmove(base, base_1, size);
         base_1 = memmove(base_1, temp, size);
         base = temp_1;
         i = 0;
         continue;
      }
      base = (void*)((double*)(base) + 1);
   }
}


