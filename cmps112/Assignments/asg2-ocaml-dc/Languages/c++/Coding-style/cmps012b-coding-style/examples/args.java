// Author:  Your Name, username@ucsc.edu
// $Id: args.java,v 1.1 2009-12-17 18:04:46-08 - - $
//
// NAME
//    args - print out the class path and the value of args
//
// SYNOPSIS
//    args [string...]
//
// DESCRIPTION
//    The class path is printed, followed by each of the arguments
//    given in the command line vector.  When a Java program is run
//    from a jar, the classpath is the name of the jar.
//

import static java.lang.System.*;

class args {

   public static void main (String[] args) {
      String classpath = getProperty ("java.class.path");
      out.printf ("classpath=\"%s\"%n", classpath);
      for (int argi = 0; argi < args.length; ++argi) {
         out.printf ("args[%d]=\"%s\"%n", argi, args[argi]);
      }
   }

}

