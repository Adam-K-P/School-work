// This is an example of a module exporting an external variable.
#include <stdio.h>
#include "ext.h"
int ext_var = 44;
void print_ext_var (void) {
   printf ("ext_var = %d\n", ext_var);
}
