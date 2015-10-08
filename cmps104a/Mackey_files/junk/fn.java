class fn {
   int a;

   void f (int a) {
      int a;
      {int a;
      {int a;}}
   }
   void g (int x) {
      int a;
      {int a;
      {int a;}}
   }
   void h (int x) {
      if (x>3) {
         int y = 8;
      }else {
         int y = 90;
         while(true){int y = 20;}
      }
      int y = 8;
   }
}
