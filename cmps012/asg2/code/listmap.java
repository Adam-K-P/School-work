// Adam Pinarbasi akpinarb
// $Id: listmap.java,v 1.18 2015-01-31 19:08:36-08 - - $

import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NoSuchElementException;
import static java.lang.System.*;

class listmap implements Iterable<Entry<String,intqueue>> {

   private class node implements Entry<String,intqueue> {
      String key;
      intqueue queue = new intqueue();
      node link;
      public String getKey() {
         return key;
      }
      public intqueue getValue() {
         return queue;
      }
      public intqueue setValue (intqueue queue) {
         throw new UnsupportedOperationException();
      }
   }
   private node head = null;

   public listmap() {
      // Not needed, since head defaults to null anyway.
   }

   public void insert (String key, int linenr) {
      node prev = null;
      node curr = head;
      if(curr == null){
         node insrt = new node();
         insrt.key = key;
         head = insrt;
         head.queue.insert(linenr);
         return;
      }
      make_new_node(key, prev, curr, linenr);
   }

   public void make_new_node(String key, node prev,
                              node curr, int linenr){
      while (curr != null){
         if(key.compareTo(curr.key) == 0){
            curr.queue.insert(linenr);   
            return;
         }
         if(key.compareTo(curr.key)<0){
            handle_node(key, curr, prev, linenr);
            return;
         }
         prev = curr;
         curr = curr.link;
      }
         node insrt = new node();
         insrt.key = key;
         insrt.queue.insert(linenr);
         prev.link = insrt;
   }

   public void handle_node(String key, node curr, 
                           node prev, int linenr){
      node insrt = new node();
      insrt.key = key;
      insrt.link = curr;
      insrt.queue.insert(linenr);
      if(prev == null) head = insrt;
      else prev.link = insrt;
      return;
   }  

   public Iterator<Entry<String,intqueue>> iterator() {
      return new iterator();
   }

   private class iterator
           implements Iterator<Entry<String,intqueue>> {
      node curr = head;

      public boolean hasNext() {
         return curr != null;
      }

      public Entry<String,intqueue> next() {
         if (curr == null) throw new NoSuchElementException();
         node next = curr;
         curr = curr.link;
         return next;
      }

      public void remove() {
         throw new UnsupportedOperationException();
      }

   }

}
