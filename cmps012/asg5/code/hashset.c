// Adam Pinarbasi akpinarb
// $Id: hashset.c,v 1.9 2014-05-15 20:01:08-07 - - $

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "debug.h"
#include "hashset.h"
#include "strhash.h"

#define HASH_NEW_SIZE 15

typedef struct hashnode hashnode;
struct hashnode {
   char *word;
   hashnode *link;
};

struct hashset {
   size_t size;
   size_t load;
   hashnode **chains;
};

hashnode **new_array(hashset *this){
   size_t sizeof_chains = this->size * sizeof(hashnode *);
   hashnode **this_chains = malloc(sizeof_chains);
   assert(this_chains != NULL);
   memset(this_chains, 0, sizeof_chains);
   return this_chains;
}

hashset *new_hashset (void) {
   hashset *this = malloc (sizeof (struct hashset));
   assert (this != NULL);
   this->size = HASH_NEW_SIZE;
   this->load = 0;
   this->chains = new_array(this);
   DEBUGF ('h', "%p -> struct hashset {size = %zd, chains=%p}\n",
                this, this->size, this->chains);
   return this;
}

hashnode *new_hashnode (void) {
   hashnode *this = malloc (sizeof (hashnode));
   assert (this != NULL);
   this->link = NULL;
   return this;
}

void free_hashset (hashset *this) {
   DEBUGF ('h', "free (%p)\n", this);
   for(size_t i = 0; i < this->size; ++i){
      for(hashnode *curr = this->chains[i]; curr != NULL;){
         free(curr->word);
         hashnode *temp = curr;
         curr = curr->link;
         free(temp);
      }
   }
   free(this->chains);
   free(this);
}

void change_size(hashset *this){
   size_t last_size = this->size;
   this->size = this->size * 2 + 1;
   hashnode **that_chains = new_array(this);
   hashnode **these_chains = this->chains;
   this->chains = that_chains;
   this->load = 0;
   for(size_t i = 0; i < last_size; ++i){
      for(hashnode *curr = these_chains[i]; curr != NULL;){
         put_hashset(this, curr->word);
         hashnode *temp = curr;
         curr = curr->link;
         free(temp);
      }
   }
   free(these_chains);
}

void put_hashset (hashset *this, const char *item) {
   size_t hash_index = strhash(item) % this->size;
   hashnode *this_node = new_hashnode();
   this_node->word = (char*)item;
   if(this->chains[hash_index] == NULL){
      this->chains[hash_index] = this_node;
      ++(this->load);
      return;
   }
   this_node->link = this->chains[hash_index];
   this->chains[hash_index] = this_node;
   ++(this->load);
   if(this->load * 2 > this->size) change_size(this);
}

bool has_hashset (hashset *this, const char *item) {
   size_t hash_index = strhash(item) % this->size;
   for(hashnode *curr = this->chains[hash_index]; curr != NULL;
                 curr = curr->link){
      assert(curr->word != NULL);
      if(strcmp(curr->word, item) == 0) return true;
   }
   return false;
}

void handle_sizes(size_t one_x, size_t two_x, size_t three_x,
                  size_t four_x, size_t five_x, size_t six_x,
                  size_t seven_x                             ){
   if(one_x > 0)
      printf("|%10lu chains of size   1            |\n", one_x);
   if(two_x > 0)
      printf("|%10lu chains of size   2            |\n", two_x);
   if(three_x > 0)
      printf("|%10lu chains of size   3            |\n", three_x);
   if(four_x > 0)
      printf("|%10lu chains of size   4            |\n", four_x);
   if(five_x > 0)
      printf("|%10lu chains of size   5            |\n", five_x);
   if(six_x  > 0)
      printf("|%10lu chains of size   6            |\n", six_x);
   if(seven_x > 0)
      printf("|%10lu chains of size   7            |\n", seven_x);
}

   

void handle_first(hashset *this){
   printf("test\n");
   size_t words   = 0;
   size_t one_x   = 0;
   size_t two_x   = 0;
   size_t three_x = 0;
   size_t four_x  = 0;
   size_t five_x  = 0;
   size_t six_x   = 0;
   size_t seven_x = 0;
   for(size_t i = 0; i < this->size; ++i){
      size_t j = 0;
      for(hashnode *curr = this->chains[i]; curr != NULL;
                    curr = curr->link){
         ++j;
         ++words;
      }
      if(j == 1) ++one_x; 
      if(j == 2) ++two_x; 
      if(j == 3) ++three_x; 
      if(j == 4) ++four_x;
      if(j == 5) ++five_x;
      if(j == 6) ++six_x;
      if(j == 7) ++seven_x; 
   }
   printf("+-----------------------------------------+\n"
          "|%10lu words in the hash set         |\n"
          "|%10lu size of the hash array        |\n",
          words, this->size);
   handle_sizes(one_x, two_x, three_x, four_x, five_x, six_x,
                seven_x);
   printf("|                                         |\n"
          "+------------------------------------------+\n" );


}

bool used = false;
void handle_x(hashset *this){
   if(used == false){
      used  = true;
      handle_first(this);
      return;
   }
   //handle_second(this) would be here
}


