// $Id: insertion-sort.c,v 1.10 2015-05-28 19:45:20-07 - - $

#include <stdio.h>
#include <string.h>

void sort (void* a, size_t n, size_t w, int (*cmp) (void*, void*)) {
   char e[w];
   for (size_t s = 1; s < n; ++s) {
      size_t h = s;
      memcpy (e, a + h * w, w);
      while (h > 0) {
         int c = cmp (a + (h - 1) * w, e);
         if (c < 0) break;
         memcpy (a + h * w, a + (h - 1) * w, w);
         h = h - 1;
      }
      memcpy (a + h * w, e, w);
   }
}

void print (int* a, size_t n) {
   for (size_t i = 0; i < n; ++i) printf (" %d", a[i]);
   printf ("\n");
}

int cmp (void* p1, void* p2) {
   int q1 = *(int*) p1;
   int q2 = *(int*) p2;
   return (q1 > q2) - (q1 < q2);
}

int main() {
   static int a[] = {13, 91, 41, 22, 67, 48, 11, 16, 55, 30};
   size_t w = sizeof *a;
   size_t n = sizeof a / w;
   print (a, n);
   sort (a, n, w, cmp);
   print (a, n);
}

