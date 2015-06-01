// Adam Pinarbasi akpinarb
// $Id: treemap.java,v 1.1 2012-02-07 15:43:17-08 - - $

// Development version of treemap.
// To be deleted and replaced by an actual implementation that
// does *NOT* use java.util.TreeMap.

import static java.lang.System.*;

class treemap {

   class tree {
      String key;
      String value;
      tree left;
      tree right;
   }
   tree root = null;

   public String get (String key) {
      tree curr = root;
      while(curr!=null) {
         if(key.compareTo(curr.key)<0) {
            if(curr.left == null) return null;
            else curr = curr.left;
            continue;
         }
         else if(key.compareTo(curr.key)>0) {
            if(curr.right == null) return null;
            else curr = curr.right;
            continue;
         }
         else break;
      }
      return curr.value;
   }

   public void put (String key, String value) {
      if(root == null) {
         root = make_tree(key, value);
         return;
      }
      for(tree curr = root; curr != null;) {
         if(key.compareTo(curr.key)<0) {
            if(curr.left == null) {
               curr.left = make_tree(key, value);
               return;
            }
            else curr = curr.left;
            continue;
         }
         if(key.compareTo(curr.key)>0) {
            if(curr.right == null) {
               curr.right = make_tree(key, value);
               return;
            }
            else curr = curr.right;
            continue;
         }
         if(key.compareTo(curr.key) == 0) 
            curr.value = value;
      }
   }

   public tree make_tree (String key, String value) {
      tree insert = new tree();
      insert.key = key;
      insert.value = value;
      insert.right = null;
      insert.left = null;
      return insert;
   }

   public void debug_tree () {
      debug_tree_recur (root, 0);
   }

   private void debug_tree_recur (tree node, int depth) {
      if(node == null) return;
      debug_tree_recur(node.left, ++depth);
      out.printf("%3d \"%s\" \"%s\" ", depth, 
                  node.key, node.value);
      if(node.left != null) 
         out.printf("%s ", node.left);
      if(node.right != null)
         out.printf("%s", node.right);
      out.printf("\n");
      debug_tree_recur(node.right, ++depth);
   }
}
