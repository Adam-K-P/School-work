// Adam Pinarbasi akpinarb
// $Id: jxref.java,v 1.8 2013-10-16 17:10:32-07 - - $

import java.io.*;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NoSuchElementException;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import static java.lang.System.*;

class jxref {
   private static final String STDIN_FILENAME = "-";
   private static final String REGEX = "\\w+([-'.:/]\\w+)*";
   private static final Pattern PATTERN = Pattern.compile(REGEX);

   private static void print_colons(){
      for(int i = 0; i<=31; i++)
         out.printf(":");
      out.printf("\n");
   }

   private static void xref_file (String filename, Scanner file){
      print_colons();
      out.printf("%s\n", filename);
      print_colons();
      listmap map = new listmap();
      intqueue queue = new intqueue();
      for (int linenr = 1; file.hasNextLine(); ++linenr) {
         String line = file.nextLine();
         Matcher match = PATTERN.matcher (line);
         while (match.find()) {
            String word = match.group();
            map.insert(word, linenr);
         }
      }
      for (Entry<String, intqueue> entry: map) {
         queue = entry.getValue();
         out.printf("%s [%d] ", entry.getKey(), 
                     queue.getcount());
         for(int i = 1; i<queue.getcount(); ++i)
            out.printf("%d ", queue.getLinenr());
         out.printf("%d\n", queue.getLinenr());
      }
   }
   
   // For each filename, open the file, cross reference it,
   // and print.
   private static void xref_filename (String filename) {
      if (filename.equals (STDIN_FILENAME)) {
         xref_file (filename, new Scanner (System.in));
      }else {
         try {
            Scanner file = new Scanner (new File (filename));
            xref_file (filename, file);
            file.close();
         }catch (IOException error) {
            misc.warn (error.getMessage());
         }
      }
   }
     
   // Main function scans arguments to cross reference files.
   public static void main (String[] args) {
      if (args.length == 0) {
         xref_filename (STDIN_FILENAME);
      }else {
         for (String filename: args) {
            xref_filename (filename);
         }
      }
      exit (misc.exit_status);
   }
}

