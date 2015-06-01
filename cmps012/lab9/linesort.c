//Adam Pinarbasi akpinarb

#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>
#include <values.h>
#include "inssort.h"

size_t max_size = 4096;
int exit_status = EXIT_SUCCESS;

int charcmp(const void *this_p, const void *that_p)
{
   char *this = (char*)(this_p);
   char *that = (char*)(that_p);
   if(strcmp(this, that)) return 1;
   else return 0;
}


int main(void)
{
   char *array[max_size];
   size_t size = sizeof(array[0]);
   size_t nelem = 0;
   for(;;++nelem)
   {
      char buffer[max_size];
      if(nelem == max_size) break;
      char *ret_val = fgets(buffer, 100, stdin);
      if(ret_val == NULL || *(ret_val) == EOF) break;
      size_t length = strlen(buffer) - 1;
      if(buffer[length] == '\n') buffer[length] = '\0';
      char *temp = strdup(buffer);
      array[nelem] = temp;
      //for(size_t i = 0; i <= nelem; ++i)
         //printf("%s\n", array[i]);
   }
   inssort((void*)array, nelem, size, charcmp);
   for(size_t i = 0; i < nelem; ++i)
      printf("%s\n", array[i]);
   return exit_status;
}
