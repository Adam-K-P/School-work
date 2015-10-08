class undef {
   static int a = f();
   static int f() {
      return a;
   }
   public static void main (String[] args) {
      System.out.println (a);
   }
}
