// Adam Pinarbasi akpinarb
// $Id: airport.java,v 1.2 2013-01-31 17:00:19-08 - - $

//
// Starter code for the airport utility.
//

import java.io.*;
import java.util.Scanner;
import static java.lang.System.*;

class airport {
   private static final String STDIN_FILENAME = "-";
   private static boolean debug = false;

   public static treemap load_database (String database_name) {
      treemap tree = new treemap ();
      try {
         Scanner database = new Scanner (new File (database_name));
         for (int linenr = 1; database.hasNextLine(); ++linenr) {
            String line = database.nextLine();
            if (line.matches ("^\\s*(#.*)?$")) continue;
            String[] keyvalue = line.split (":");
            if (keyvalue.length != 2) {
               misc.die (database_name, linenr, "invalid line");
               continue;
            }
            tree.put (keyvalue[0], keyvalue[1]);
         }
         database.close();
      }catch (IOException error) {
         misc.kill_process();
      }
      return tree;
   } 

   private static treemap get_treemap(String[] args){
      if(args.length == 0 || args.length > 2) 
         misc.kill_process();
      if(args[0].equals("-d")){
         if(args.length != 2)
            misc.kill_process();
         else{
            treemap tree = load_database(args[1]);
            debug = true;
            return tree;
         }
      }
      else if(args.length != 1){
         misc.kill_process();
      }
      treemap tree = load_database(args[0]);
      return tree;
   }

   public static void main (String[] args) {
      treemap tree = get_treemap(args);
      Scanner stdin = new Scanner (in);
      if(debug == false){
         while (stdin.hasNextLine()) {
            String airport = stdin.nextLine().toUpperCase().trim();
            String airport_name = tree.get (airport);
            if (airport_name == null || airport.length() != 3) {
               out.printf ("%s: no such airport%n", airport);
            }
            else{
               out.printf ("%s:%s%n", airport, airport_name);
            }
         }
      }
      else{
         tree.debug_tree();
      }
      exit (misc.exit_status);
   }
}
