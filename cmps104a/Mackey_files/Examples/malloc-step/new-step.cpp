// $Id: new-step.cpp,v 1.4 2015-05-07 18:15:30-07 - - $

#include <iostream>
using namespace std;

int main (void) {
   char* prev = 0;
   for (int i = 0; i < 16; ++i) {
      char* curr = new char;
      cout << (void*) curr << " " << (curr - prev) << endl;
      prev = curr;
   }
   return 0;
}

//TEST// new-step >new-step.out 2>&1
//TEST// more new-step.cpp new-step.out >new-step.lis </dev/null
//TEST// mkpspdf new-step.ps new-step.lis

