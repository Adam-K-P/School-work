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
#include "stringset.h"
#include "auxlib.h"
#include "utils.h"
#include "yylex.h"

#define YYEOF 0

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
   for (int option = 0; (option = getopt(argc, argv, "ly@:D:")) != -1; ) {
      switch (option) {
         case 'l':
            yy_flex_debug = 1;
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
   string outfile_name = filename.substr(0, filename.length() - 3); 
   return outfile_name;
}

static void insert_set (char* infile_name) {
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
      else if (token == RESERVED) { 

         string res_name;
         if (strcmp(yytext, "void") == 0)   res_name = "TOK_KW_VOID";
         if (strcmp(yytext, "bool") == 0)   res_name = "TOK_KW_BOOL";
         if (strcmp(yytext, "char") == 0)   res_name = "TOK_KW_CHAR";
         if (strcmp(yytext, "int") == 0)    res_name = "TOK_KW_INT";
         if (strcmp(yytext, "string") == 0) res_name = "TOK_KW_STRING";
         if (strcmp(yytext, "struct") == 0) res_name = "TOK_KW_STRUCT";
         if (strcmp(yytext, "if") == 0)     res_name = "TOK_KW_IF";
         if (strcmp(yytext, "else") == 0)   res_name = "TOK_KW_ELSE";
         if (strcmp(yytext, "while") == 0)  res_name = "TOK_KW_WHILE";
         if (strcmp(yytext, "return") == 0) res_name = "TOK_KW_RETURN";
         if (strcmp(yytext, "false") == 0)  res_name = "TOK_KW_FALSE";
         if (strcmp(yytext, "true") == 0)   res_name = "TOK_KW_TRUE";
         if (strcmp(yytext, "null") == 0)   res_name = "TOK_KW_NULL";
         if (strcmp(yytext, "ord") == 0)    res_name = "TOK_KW_ORD";
         if (strcmp(yytext, "chr") == 0)    res_name = "TOK_KW_CHR";
         if (strcmp(yytext, "new") == 0)    res_name = "TOK_KW_NEW";

         fprintf(outfile, "%4lu  %2lu.%.3lu %3d %-16s (%s)\n", 
                 yylval->lloc.filenr, yylval->lloc.linenr, yylval->lloc.offset, 
                 token, res_name.c_str(), yytext);
      }
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
   scan_file(infile_name, outfile_name);
   return EXIT_SUCCESS;
}
