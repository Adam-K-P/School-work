//$Id: main.cpp,v 1.8 2015-04-28 19:23:13-07 - - $

#include <cerrno>
#include <cstdlib>
#include <exception>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <stdexcept>
#include <string>
#include <typeinfo>
#include <unistd.h>
using namespace std;

#include "listmap.h"
#include "xpair.h"
#include "util.h"

using str_str_map = listmap<string,string>;
using str_str_pair = str_str_map::value_type;

str_str_map map;

void scan_options (int argc, char** argv) {
   opterr = 0;
   for (;;) {
      int option = getopt (argc, argv, "@:");
      if (option == EOF) break;
      switch (option) {
         case '@':
            traceflags::setflags (optarg);
            break;
         default:
            complain() << "-" << (char) optopt << ": invalid option"
                       << endl;
            break;
      }
   }
}

void trim (string& input) {
   size_t pos_0 = input.find_first_not_of(" ");
   size_t pos_1 = input.find_last_not_of (" ");
   if (pos_0 == (size_t)-1) {
      while (not input.empty()) input.pop_back();
      return;
   }
   input = input.substr(pos_0, pos_1 - pos_0 + 1);
}

void remove_equals (string& input) {
   trim(input);
   input.pop_back();
   trim(input);
}

void remove (string& input) {
   remove_equals(input);
   str_str_map::iterator found = map.find(input);
   if (found.is_null()) return;
   map.erase(found);
}

void insert_pair (string& input, size_t eq_pos) {
   if (input.empty()) return;
   string key = input.substr(0, eq_pos);
   string value = input.substr(eq_pos + 1);
   trim(key); trim(value);
   str_str_pair pair (key, value);
   map.insert(pair);
}


void handle_input (string& input) {
   trim(input);
   if (input.empty() or input.at(0) == '#') return;
   size_t eq_pos   = input.find_first_of("=");
   if (eq_pos == (size_t)-1) { //no '=' in string
      str_str_map::iterator found = map.find(input);
      if (found.is_null()) 
         cerr << "key not found" << endl; return; 
      cout << (*found).first  << " = " 
           << (*found).second << endl;
      return;
   }
   else if (eq_pos == input.length() - 1)   
      input.length() == 1 ? map.print_all() : remove(input);
   else if (eq_pos == 0) { 
      string value = input.substr(eq_pos + 1); 
      trim(value);
      map.find_val(value);
   }
   else insert_pair(input, eq_pos); 
}

void do_all (int argc, char** argv) {
   if (argc > 1) {
      for (int i = 1; i < argc; ++i) {
         ifstream file(argv[i]);
         if (not file.is_open()) syscall_error(argv[i]);
         string input;
         for (size_t j = 1; getline(file, input); ++j) {
            cout << argv[i] << ": " << j << ": " << input << endl;
            handle_input(input);
         }
      }
   }
   else {
      string input;
      for (size_t i = 1; getline(cin, input); ++i) {
         cout << "-: " << i << ": " << input << endl;
         handle_input(input);
      }
   }
}

int main (int argc, char** argv) {
   sys_info::set_execname(argv[0]);
   scan_options(argc, argv);
   do_all(argc, argv);
   map.erase_all();
   return EXIT_SUCCESS;
}

