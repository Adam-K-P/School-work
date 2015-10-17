int main (int argc, char **argv) {
   for (int i = 0; argv[i]; ++i) {
      printf ("argv[%d]=\"%s\"\n", i, argv[i]);
   }
}
