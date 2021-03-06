/* Adam Pinarbasi
 * akpinarb
 * main.cpp
 * asg1 */

#include <fstream>
#include <iomanip>
#include <iostream>
#include <locale>
#include <unordered_set>

using namespace std;

#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>

#include "astree.h"
#include "emitter.h"
#include "stringset.h"
#include "auxlib.h"
#include "utils.h"
#include "yylex.h"
#include "symbol_table.h"

#define YYEOF 0

FILE* astfile;
FILE* oilfile;
bool flags = false;
string cpp_flags = "";
const string CPP = "/usr/bin/cpp";
const size_t LINESIZE = 1024;
bool yy_debug = false;
extern int yy_flex_debug;

static void chomp (char* string, char delim) {
   size_t len = strlen(string);
   if (len == 0) return;
   char* nlpos = string + len - 1;
   if (*nlpos == delim) *nlpos = '\0';
}

static void cpplines (FILE* pipe, char* infile_name) {
   int linenr = 1;
   char inputname[LINESIZE];
   strcpy (inputname, infile_name);
   for (;;) {
      char buffer[LINESIZE];
      char* fgets_rc = fgets (buffer, LINESIZE, pipe);
      if (fgets_rc == NULL) break;
      chomp (buffer, '\n');
      // http://gcc.gnu.org/onlinedocs/cpp/Preprocessor-Output.html
      int sscanf_rc = sscanf (buffer, "# %d \"%[^\"]\"",
                              &linenr, infile_name);
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
   for (int option = 0; 
           (option = getopt(argc, argv, "ly@:D:")) != -1; ) {
      switch (option) {
         case 'l':
            yy_flex_debug = 1;
            break;

         case 'y':
            yydebug = 1;
            break;

         case '@': break;
         case 'D': cpp_flags = optarg; flags = true; break;

         case '?':
            if (optopt == '@' || optopt == 'D')
               cerr << "Option -" << optopt << " requires an argument" 
                    << endl;
            else if (!isprint(optopt))
               cerr << "Unknown option character " << optopt << endl;
            abort();

         default:
            cerr << "error parsing options" << endl;
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
      cerr << "Usage: oc [-ly] [-@ flag...] [-D string] program.oc" 
           << endl;
      exit(EXIT_FAILURE);
   }
   string outfile_name = filename.substr(0, filename.length() - 3); 
   return outfile_name;
}

static void insert_set (char* infile_name) {
   string command = CPP + " " + (flags ? ("-D" + cpp_flags + " ") : "") 
                              + infile_name;
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

static void generate_set (char* infile_name, string& base_out_name) {
   string outfile_name = base_out_name + ".str";
   ifstream infile(infile_name);
   ofstream outfile(outfile_name);
   insert_set(infile_name);
   dump_stringset(outfile);
   infile.close();
   outfile.close();
}

static void open_yyin (char* infile_name) {
   string command = CPP + " " + infile_name;
   yyin = popen(command.c_str(), "r");
   if (yyin == NULL) {
      syserrprintf(command.c_str());
      exit(EXIT_FAILURE);
   }
}

static void perform_flex (const char* outfile_name) {
   FILE* outfile = fopen(outfile_name, "w");
   for (;;) {
      int token = yylex();
      if (token == YYEOF) return;
      else if (token == DIRECTIVE) fprintf(outfile, "%s\n", yytext);
      else yylval->dump_node(outfile, token);
   }
}

static void scan_file (char* infile_name, string& outfile_name) {
   ifstream infile(infile_name);
   ofstream outfile(outfile_name);
   open_yyin(infile_name);
   perform_flex(outfile_name.c_str());
}

int main (int argc, char** argv) {
   yy_flex_debug = 0;
   perform_op(argc, argv);
   char* infile_name  = argv[argc - 1];
   string base_out_name = check_suffix(argc, argv);
   generate_set(infile_name, base_out_name);
   string outfile_name = base_out_name + ".tok";
   string astfile_name = base_out_name + ".ast";
   string symfile_name = base_out_name + ".sym";
   string oilfile_name = base_out_name + ".oil";
   astfile = fopen (astfile_name.c_str(), "w");
   oilfile = fopen (oilfile_name.c_str(), "w");
   FILE* symfile = fopen (symfile_name.c_str(), "w");
   scan_file(infile_name, outfile_name);
   pclose(yyin);
   open_yyin(infile_name);
   int parse_rc = yyparse();
   maintain_symbol_tables (parser::root, symfile);
   astree::print (astfile, parser::root);
   if (parse_rc) fprintf (stderr, "parse failed (%d)\n", parse_rc);
   emit (parser::root);
   yylex_destroy();
   return EXIT_SUCCESS;
}
