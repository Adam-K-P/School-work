#include <stdio.h>
#include <stdlib.h>

int main()
{
   extern char **environ;
   int i = 0;
   while(environ[i] != NULL)
      printf("%s\n", environ[i++]);
   return 0;
}
