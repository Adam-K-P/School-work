//Adam Pinarbasi akpinarb
//$Id: cmatch.c,v 1.1 2015-02-08 20:37:58-08 akpinarb - $

#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <libgen.h>
#include <stdbool.h>

char *program_name = NULL;
int exit_status = EXIT_SUCCESS;
#define STDIN_NAME "-"

typedef struct options{
   bool ignore_case;
   bool filenames_only;
   bool number_lines;
} options;

void error_two(char *program_name){
   exit_status = EXIT_FAILURE;
   fflush(NULL);
   fprintf(stderr, "Usage: %s [iln] string [filename...]\n", 
           program_name);
   fflush(NULL);
}

void scan_options(int argc, char **argv, options *opts){
   for(;;){
      int opt = getopt(argc, argv, "iln");
      if(opt == EOF) break;
      switch(opt){
         case 'i':
            opts->ignore_case = true;
            break;
         case 'l':
            opts->filenames_only = true;
            break;
         case 'n':
            opts->number_lines = true;
            break;
         default:
            error_two(program_name);
            break;
      }
   }
}

void catbyline(FILE *input, char *filename, 
               const char* string_cmp, options *opts){
   char buffer[1024];
   for(int linenr = 1;; ++linenr){
      char *buf = fgets(buffer, sizeof buffer, input);
      if(buf == NULL) break;
      if(opts->filenames_only == true){
         if(strstr(buf, string_cmp) != NULL){
            printf("%s\n", filename);
            return;
         }
         continue;
      }
      if(opts->ignore_case == true){
         if(strcasestr(buf, string_cmp) != NULL){
            if(opts->number_lines == true)
               printf("%d: ", linenr);
            printf("%s", buf);
         }
         continue;
      }
      if(strstr(buf, string_cmp) != NULL){
         if(opts->number_lines == true)
            printf("%d:", linenr);
         printf("%s", buf);
      }
   }
}

void error_one(char *program_name, char *filename){
   exit_status = EXIT_FAILURE;
   fflush(NULL);
   fprintf(stderr, "%s: %s: %s\n", program_name,
           filename, strerror(errno));
   fflush(NULL);
}

void handle_file(int argc, char **argv, char *program_name, 
                 options *opts, const char* string_cmp, 
                 int argi){
   if(argc == 2)
      catbyline(stdin, STDIN_NAME, string_cmp, opts);
   for(;argi < argc; ++argi){
      char *filename = argv[argi];
      if(strcmp(filename, STDIN_NAME) == 0)
         catbyline(stdin, STDIN_NAME, string_cmp, opts);
      else{
         FILE *input = fopen(filename, "r");
         if(input != NULL){
            catbyline(input, filename, string_cmp, opts);
            fclose(input);
         }else
            error_one(program_name, filename);
      }
   }
}

int main(int argc, char **argv){
   program_name = basename(argv[0]);
   if(argc < 2){
      error_two(program_name);
      return exit_status;
   }
   int argi = 2;
   struct options opts = {false, false, false};
   const char* string_cmp;
   if(argv[1][0] == '-'){
      if(argc < 3){
         error_two(program_name);
         return exit_status;
      }
      //argc is set to 2 here so that it will read stdin
      //inside of function catbyline
      if(argc == 3) argc = 2;
      scan_options(argc, argv, &opts);
      string_cmp = argv[2];
      argi = 3;
   }
   else string_cmp = argv[1];
   handle_file(argc, argv, program_name, &opts,
               string_cmp, argi);
   return exit_status;
}
