/* Adam Pinarbasi
 * akpinarb
 * main.cpp
 * asg1 */

#include <iomanip>
#include <iostream>
#include <unordered_set>

#include "stringset.h"

using namespace std;

#include <unistd.h>

int main (int argc, char** argv) {

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
            return EXIT_FAILURE;

         default:
            cerr << "oops, default in switch" << endl;
            abort();
      }
   }

   if (optind != (argc - 1)) {
      for (int i = optind; i < (argc - 1); ++i) 
         cerr << "Non-option argument: " << argv[i] << endl;
      return EXIT_FAILURE;
   }

   const char* test = "hello, world!";
   const string* rand = intern_stringset(test);
   ostream outfile(argv[argc - 1];

   return EXIT_SUCCESS;
}
