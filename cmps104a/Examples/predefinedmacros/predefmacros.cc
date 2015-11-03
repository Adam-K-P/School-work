// $Id: predefmacros.cc,v 1.4 2013-09-20 14:47:05-07 - - $

//
// Print out the valuas of various macros and test whether some
// compiler and operating system flags are present.
//
// References:
// http://sourceforge.net/apps/mediawiki/predef/
// See links to Compilers and Operating Systems
//

#include <string>
#include <vector>
using namespace std;

#include <errno.h>
#include <libgen.h>
#include <stdio.h>
#include <stdlib.h>

char *progname = NULL;
int exit_status = EXIT_SUCCESS;


#ifdef __unix__

const vector<string> uname_opts = {
   "--all",
   "--kernel-name", 
   "--nodename", 
   "--kernel-release", 
   "--kernel-version", 
   "--machine", 
   "--processor", 
   "--hardware-platform", 
   "--operating-system", 
};

void run_program (const char *program) {
   printf ("%s = ", program);
   FILE *command = popen (program, "r");
   if (command == NULL) {
      fprintf (stderr,  "%s: %s: %s\n", progname,
               program, strerror (errno));
      exit_status = EXIT_FAILURE;
   }else {
      char buffer[0x10000];
      for (;;) {
         char *eof = fgets (buffer, sizeof buffer, command);
         if (eof) break;
         printf ("%s", buffer);
      }
      pclose (command);
   }
}

void print_unames () {
   system ("date\n");
   const char *const *end = uname_opts + uname_size;
   for (auto citor = uname_opts.cbegin();
        citor != uname_opts.cend(); ++citor) {
      string uname_buffer = "echo -n uname " + *itor
                          + "' = '; uname " + *itor;
      system (uname_buffer);
   }
}

#else

void print_unames () {
   throw "Praeterea, censeo Microflaccidem esse delendam.";
}

#endif


#define PRINTS(ID) printf (#ID " = \"%s\"\n", ID);
#define PRINTD(ID) printf (#ID " = %d\n", ID);

int main (int argc, char **argv) {
   progname = basename (argv[0]);
   print_unames ();

   PRINTS (__FILE__);
   PRINTD (__LINE__);
   PRINTS (__DATE__);
   PRINTS (__TIME__);
   PRINTD (__STDC__);
   PRINTS (__func__);

   #ifdef __cplusplus
   PRINTD (__cplusplus);
   #endif

   #ifdef __unix__
   PRINTD (__unix__);
   #endif

   #ifdef __linux__
   PRINTD (__linux__);
   #endif

   #ifdef __x86_64__
   PRINTD (__x86_64__);
   #endif

   #ifdef __GNUC__
   PRINTD (__GNUC__);
   PRINTD (__GNUC_MINOR__);
   PRINTD (__GNUC_PATCHLEVEL__);
   #endif

   #ifdef _POSIX_VERSION
   PRINTS (_POSIX_VERSION);
   #endif

   #ifdef _XOPEN_VERSION
   PRINTS (_XOPEN_VERSION);
   #endif

   return exit_status;
}

//TEST// runprogram.perl -x predefmacros.lis ./predefmacros
//TEST// mkpspdf predefmacros.ps predefmacros.cc* predefmacros.lis

