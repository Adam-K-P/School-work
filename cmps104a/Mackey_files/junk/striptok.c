// $Id: striptok.c,v 1.4 2011-10-28 13:32:25-07 - - $

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *yytname[] = {
   "nil",
   "TOK_ONE",
   "x",
   "TOK_TWO",
   "+",
};

char *get_yytname (int symbol) {
   int size = sizeof yytname / sizeof *yytname;
   if (symbol < 0 || symbol >= size) return "$undefined";
   return yytname[symbol];
}

int main (void) {
   for (int isub = -1; isub < 8; ++isub) {
      char *tname = get_yytname (isub);
      if (strstr (tname, "TOK_") == tname) tname += 4;
      printf ("%2d -> %s\n", isub, tname);
   }
   return EXIT_SUCCESS;
}
