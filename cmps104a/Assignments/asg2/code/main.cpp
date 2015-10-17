/* Adam Pinarbasi
 * akpinarb
 * main.cpp
 * asg1 */

#include <fstream>
#include <iomanip>
#include <iostream>
#include <unordered_set>

using namespace std;

#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>

#include "stringset.h"
#include "auxlib.h"

const string CPP = "/usr/bin/cpp";
const size_t LINESIZE = 1024;


static void chomp (char* string, char delim) {
   size_t len = strlen(string);
   if (len == 0) return;
   char* nlpos = string + len - 1;
   if (*nlpos == delim) *nlpos = '\0';
}

static void cpplines (FILE* pipe, char* filename, ostream& out) {
   int linenr = 1;
   char inputname[LINESIZE];
   strcpy (inputname, filename);
   for (;;) {
      char buffer[LINESIZE];
      char* fgets_rc = fgets (buffer, LINESIZE, pipe);
      if (fgets_rc == NULL) break;
      chomp (buffer, '\n');
      //printf ("%s:line %d: [%s]\n", filename, linenr, buffer);
      // http://gcc.gnu.org/onlinedocs/cpp/Preprocessor-Output.html
      int sscanf_rc = sscanf (buffer, "# %d \"%[^\"]\"",
                              &linenr, filename);
      if (sscanf_rc == 2) {
         //printf ("DIRECTIVE: line %d file \"%s\"\n", linenr, filename);
         continue;
      }
      char* savepos = NULL;
      char* bufptr = buffer;
      for (int tokenct = 1;; ++tokenct) {
         char* token = strtok_r (bufptr, " \t\n", &savepos);
         bufptr = NULL;
         if (token == NULL) break;
         intern_stringset(token);
         /*printf ("token %d.%d: [%s]\n",
                 linenr, tokenct, token);*/
      }
      ++linenr;
   }
}

static void perform_op (int argc, char **argv) {
   for (int option = 0; (option = getopt(argc, argv, "ly@:D:")) != -1; ) {
      switch (option) {
         case 'l':
            printf("read in l\n");
            break;

         case 'y':
            printf("read in y\n");
            break;

         case '@': case 'D':
            printf("read in %s\n", optarg);
            break;

         case '?':
            if (optopt == '@' || optopt == 'D')
               cerr << "Option -" << optopt << " requires an argument" << endl;
            else if (!isprint(optopt))
               cerr << "Unknown option character " << optopt << endl;
            abort();

         default:
            cerr << "oops, default in switch" << endl;
            abort();
      }
   }

   if (optind != (argc - 1)) {
      for (int i = optind; i < (argc - 1); ++i)
         cerr << "Non-option argument: " << argv[i] << endl;
      exit(EXIT_FAILURE);
   }
}

static string check_suffix (int argc, char** argv) {
   string filename(basename(argv[argc - 1]));
   string suffix = filename.substr(filename.length() - 3, 3);
   string compare_str(".oc");
   if (suffix.compare(compare_str) != 0) {
      cerr << "Usage: oc [-ly] [-@ flag...] [-D string] program.oc" << endl;
      exit(EXIT_FAILURE);
   }
   string outfile_name = filename.substr(0, filename.length() - 3) + ".str"; 
   return outfile_name;
}

static void insert_set (ifstream& infile, ofstream& outfile, 
                                          char* infile_name) {
   string command = CPP + " " + infile_name;
   FILE* pipe = popen(command.c_str(), "r");
   if (pipe == NULL) {
      cerr << "Could not perform: " << command << endl;
      exit(EXIT_FAILURE);
   }
   else {
      cpplines(pipe, infile_name, outfile);
      int pclose_rc = pclose(pipe);
      //eprint_status(command.c_str(), pclose_rc);
   }
}

int main (int argc, char** argv) {
   perform_op(argc, argv);
   string outfile_name = check_suffix(argc, argv);

   ifstream infile(argv[argc - 1]);
   ofstream outfile(outfile_name);
   insert_set(infile, outfile, argv[argc - 1]);
   dump_stringset(outfile);
   infile.close();
   outfile.close();
   return EXIT_SUCCESS;
}
