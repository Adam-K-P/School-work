class test {
   char[][] na = new char[10][];
   //error: char[][] an = new char[][10];
   char[][][][][][][][][][][][][][][][][][][][][][][][][][] m
      = new char[10][][][][][][][][][][][][][][][][][][][][][][][][][];
   public static void main (String[] args) {
      int i = 3;
      char c = 'x';
      i = c;
      //error: c = i;
      c = (char)i;
      i = i = i;
      // error: (i = i) = i;
   }
}
