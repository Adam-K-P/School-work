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
#include "yylex.h"

const string CPP = "/usr/bin/cpp";
const size_t LINESIZE = 1024;
bool yy_debug = false;
bool yy_flex_debug = false;

static void chomp (char* string, char delim) {
   size_t len = strlen(string);
   if (len == 0) return;
   char* nlpos = string + len - 1;
   if (*nlpos == delim) *nlpos = '\0';
}

static void cpplines (FILE* pipe, const char* filename) {
   int linenr = 1;
   char inputname[LINESIZE];
   strcpy (inputname, filename);
   for (;;) {
      char buffer[LINESIZE];
      char* fgets_rc = fgets (buffer, LINESIZE, pipe);
      if (fgets_rc == NULL) break;
      chomp (buffer, '\n');
      // http://gcc.gnu.org/onlinedocs/cpp/Preprocessor-Output.html
      int sscanf_rc = sscanf (buffer, "# %d \"%[^\"]\"",
                              &linenr, filename);
      if (sscanf_rc == 2) {
         continue;
      }
      char* savepos = NULL;
      char* bufptr = buffer;
      for (int tokenct = 1;; ++tokenct) {
         char* token = strtok_r (bufptr, " \t\n", &savepos);
         bufptr = NULL;
         if (token == NULL) break;
         intern_stringset(token);
      }
      ++linenr;
   }
}

static void perform_op (int argc, char **argv) {
   for (int option = 0; (option = getopt(argc, argv, "ly@:D:")) != -1; ) {
      switch (option) {
         case 'l':
            yy_flex_debug = true;
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

static void insert_set (const char* infile_name) {
   string command = CPP + " " + infile_name;
   FILE* pipe = popen(command.c_str(), "r");
   if (pipe == NULL) {
      cerr << "Could not perform: " << command << endl;
      exit(EXIT_FAILURE);
   }
   else {
      cpplines(pipe, infile_name);
      int pclose_rc = pclose(pipe);
      if (pclose_rc < 0) 
         cerr << "error closing pipe: " << command << endl;
   }
}

static void generate_set (string infile_name, string outfile_name) {
   ifstream infile(infile_name);
   ofstream outfile(outfile_name);
   insert_set(infile_name.c_str());
   dump_stringset(outfile);
   infile.close();
   outfile.close();
}

static void perform_flex (const char* infile_name) {
   cout << "sync_lex called" << endl;
   string command = CPP + " " + infile_name;
   yyin = popen(command.c_str(), "r");
   if (yyin == NULL) {
      syserrprintf(command.c_str());
      exit(EXIT_FAILURE);
   }
   else {
      if (yy_flex_debug) {
         cerr << "-- popen " << command <<", fileno(yyin = " << fileno(yyin) 
                                                             << endl;
      }
      //lexer::newfilename(command);
   }
}


static void scan_file (string infile_name, string outfile_name) {
   ifstream infile(infile_name);
   ofstream outfile(outfile_name);
   perform_flex(infile_name.c_str());
}

int main (int argc, char** argv) {
   perform_op(argc, argv);
   string infile_name  = argv[argc - 1];
   string outfile_name = check_suffix(argc, argv);
   generate_set(infile_name, outfile_name);
   scan_file(infile_name, outfile_name);
   return EXIT_SUCCESS;
}
