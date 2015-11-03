// $Id: main.cc,v 1.5 2014-10-10 14:48:42-07 - - $

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "extern.h"

int status = EXIT_SUCCESS;

void scan_options (int argc, char** argv) {
   yy_flex_debug = yydebug = 0;
   for (;;) {
      int opt = getopt (argc, argv, "ly");
      if (opt == EOF) break;
      switch (opt) {
         case 'l': yy_flex_debug = 1; break;
         case 'y': yydebug = 1; break;
         default : status = EXIT_FAILURE;
      }
   }
}

void yyerror (const char *message) {
   status = EXIT_FAILURE;
   fflush (NULL);
   fprintf (stderr, "%s\n", message);
   fflush (NULL);
}

void printchar (char byte) {
   putchar (byte);
   fprintf (stderr, "Debug: printchar ('");
   fprintf (stderr, isprint (byte) ? "%c" : "\\x%02X", byte);
   fprintf (stderr, "')\n");
}

void scanerror (void) {
   static char message[] = "Invalid input character ";
   static char buffer[sizeof message + 16];
   sprintf (buffer, isprint (*yytext) ? "%s'%c'\n" : "%s'\\%03o'\n",
            message, *yytext);
   yyerror (buffer);
}

int main (int argc, char** argv){
   scan_options (argc, argv);
   yyparse();
   return status;
}

