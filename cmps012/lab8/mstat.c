//Adam Pinarbasi akpinarb
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

int exit_status = EXIT_SUCCESS;
struct stat buf;
char *filename;
bool year = false;

char *format_time(time_t this_time)
{
   const double secs_in_year = 155520000;
   struct tm *mod_time;
   struct tm *curr;
   time_t current;
   current = time(NULL);
   double seconds;
   char string[30];
   mod_time = localtime(&this_time);
   curr = localtime(&current);
   seconds = difftime(current, this_time);
   if(seconds >= secs_in_year)
      strftime(string, sizeof string, "%Y %h %e %H:%M", mod_time);
   else
      strftime(string, sizeof string, "%h %e %H:%M", mod_time);
   char *ret = strdup(string);
   //gets rid of compiler warning
   curr = curr;
   return ret; 
}

void print(void)
{
   char *time = format_time(buf.st_atime);
   printf("%d       %d %s %s\n", buf.st_mode, buf.st_size, time, 
           filename);
   free(time);
}

int main(int argc, char **argv)
{
   if(argc == 1) 
   {
      filename = ".";
      if(lstat(filename, &buf) == -1)
      {
         fprintf(stderr, "Usage: mstat [filename]\n");
         exit_status = EXIT_FAILURE;
      }
      print();
   }
   for(int i = 1; i < argc; ++i)
   {
      filename = argv[i];
      if(lstat(argv[i], &buf) == -1)
      {
         fprintf(stderr, "Usage: mstat [filename]\n");
         exit_status = EXIT_FAILURE;
         break;
      }
      print();
   }
   return exit_status;
}

         
