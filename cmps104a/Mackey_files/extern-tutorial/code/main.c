// This is an example of a module accessing an external variable.
#include <stdio.h>
#include <stdlib.h>
#include "ext.h"
int main (void) {
   print_ext_var();
   ext_var = 56;
   print_ext_var();
   return EXIT_SUCCESS;
}
