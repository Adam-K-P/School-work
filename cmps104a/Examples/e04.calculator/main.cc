/* $Id: main.cc,v 1.7 2014-10-24 16:32:04-07 - - $ */


#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include "extern.h"

map<string,double> symtab; 
const double NAN = 0.0 / 0.0;

double sym_get (const string& symbol) { 
   auto entry = symtab.find (symbol);
   if (entry != symtab.end()) return entry->second;
   error ("variable is uninitialized", symbol);
   return NAN;
}

double sym_put (const string& symbol, double value) {
   symtab[symbol] = value;
   return value;
}

void sym_dump() {
   for (auto iter = symtab.cbegin(); iter != symtab.cend(); ++iter) {
      printf ("symtab[%s] = %.10g\n",
              iter->first.c_str(), iter->second);
   }
}

void scan_options (int argc, char** argv) {
   yy_flex_debug = yydebug = 0;
   for(;;) {
      int option = getopt (argc, argv, "ly");
      switch (option) {
         case EOF: return;
         case 'l': yy_flex_debug = 1; break;
         case 'y': yydebug       = 1; break;
      }
   }
}

void error (const string& message, const string& data) {
   yyerror (message + " (" + data + ")");
}

void yyerror (const string& message) {
   printf (" ... [[%s]]\n", message.c_str());
}

int main (int argc, char** argv) {
   scan_options (argc, argv);
   int parse_rc = yyparse ();
   sym_dump();
   return parse_rc;
}

