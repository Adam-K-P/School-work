// Adam Pinarbasi akpinarb
// $Id: intqueue.java,v 1.15 2015-02-02 21:25:20-08 - - $

import java.util.Iterator;
import java.util.NoSuchElementException;

class intqueue implements Iterable<Integer> {
   private class node{ 
      int linenr;
      node link;
   }

   private node front = null;
   private node rear = null;
   private node line;
   private int count = 0;

   public int getLinenr(){
      if(line == null)
         line = front;
      node temp = line;
      if(line.link == null)
         return line.linenr;
      line = line.link;
      return temp.linenr;
   }

   public void insert (int linenr) {
      ++count;
      node curr = new node();
      if(front == null) {
         curr.linenr = linenr;
         curr.link = null;
         front = curr;
         rear = curr;
      }
      else{
         curr.linenr = linenr;
         rear.link = curr;
         rear = curr;
      }
   }

   public boolean empty() {
      return count == 0;
   }

   public int getcount() {
      return count;
   }

   public Iterator<Integer> iterator() {
      return new iterator();
   }

   private class iterator implements Iterator<Integer> {
      node curr = front;

      public boolean hasNext() {
         return curr != null;
      }

      public Integer next() {
         if (curr == null) throw new NoSuchElementException();
         Integer next = curr.linenr;
         curr = curr.link;
         return next;
      }

      public void remove() {
         throw new UnsupportedOperationException();
      }
   }

}

