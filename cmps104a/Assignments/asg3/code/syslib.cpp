// $Id: syslib.cpp,v 1.5 2015-07-09 18:10:52-07 - - $

#include <assert.h>
#include <errno.h>
#include <libgen.h>
#include <limits.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <wait.h>

#include "syslib.h"

string exec::execname;
int exec::exit_status = EXIT_SUCCESS;
void exec::set_status (int status) {
   status &= 0xFF;
   if (exec::exit_status < status) exec::exit_status = status;
}

void errprintf (const char* format, ...) {
   exec::exit_status = EXIT_FAILURE;
   fflush (nullptr);
   va_list args;
   va_start (args, format);
   fprintf (stderr, "%s: ", exec::execname.c_str());
   vfprintf (stderr, format, args);
   va_end (args);
   fflush (nullptr);
}

void syserrprintf (const char* object) {
   errprintf ("%s: %s\n", object, strerror (errno));
}


static void eprint_signal (const char* kind, int signal) {
   fprintf (stderr, ", %s %d", kind, signal);
   const char* sigstr = strsignal (signal);
   if (sigstr != NULL) fprintf (stderr, " %s", sigstr);
}

void eprint_status (const char* command, int status) {
   if (status == 0) return; 
   fprintf (stderr, "%s: status 0x%04X", command, status);
   if (WIFEXITED (status)) {
      fprintf (stderr, ", exit %d", WEXITSTATUS (status));
   }
   if (WIFSIGNALED (status)) {
      eprint_signal ("Terminated", WTERMSIG (status));
      #ifdef WCOREDUMP
      if (WCOREDUMP (status)) fprintf (stderr, ", core dumped");
      #endif
   }
   if (WIFSTOPPED (status)) {
      eprint_signal ("Stopped", WSTOPSIG (status));
   }
   if (WIFCONTINUED (status)) {
      fprintf (stderr, ", Continued");
   }
   fprintf (stderr, "\n");
}

