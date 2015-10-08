
#define _GNU_SOURCE

#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main (void) {
   for (int32_t bits = 1; bits != 0; bits <<= 1) {
      printf ("0x%08X -> %2d\n", bits, ffs (bits));
   }
   return EXIT_SUCCESS;
}
