// Adam Pinarbasi akpinarb
// $Id: lsort.c,v 1.1 2011-04-29 19:46:42-07 - - $
#include <string.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <assert.h>
#include <libgen.h>

typedef struct node node;
struct node{
   char *string;
   node *link;
};

bool debug_form = false;
node *head = NULL;

void free_nodes(void){
   node *curr = head;
   while(curr != NULL){
      node *temp = curr->link;
      free(curr->string);
      free(curr);
      curr = temp;
   }
}

void print(void){
   for(node *curr = head; curr != NULL; curr = curr->link)
      printf("%s\n", curr->string);
}

void handle_debug(void){
   for(node *curr = head; curr != NULL; curr = curr->link)
      printf("%p\n", curr);
}

void insert(char *gotline){
   node *curr = malloc(sizeof(node));
   char *newline = strdup(gotline);
   node *prev = NULL;
   curr->string = newline;
   curr->link = NULL;
   if(head == NULL){
      head = curr;
      return;
   }
   for(node *temp = head; temp != NULL; temp = temp->link){
      int new_length = strlen(newline);
      int temp_length = strlen(temp->string);
      for(int i = 0; i < (new_length>temp_length?
                          temp_length : new_length); ++i){
         if(newline[i] > temp->string[i]) break;
         else if(newline[i] < temp->string[i]){
            curr->link = temp;
            if(prev == NULL) head = curr;
            else prev->link = curr;
            return;
         }
         /*else if(temp->link == NULL){
            temp->link = curr;
            return;*/
         }
      if(temp->link == NULL){
         temp->link = curr;
         return;
      }
      prev = temp;
   }
}

int main (int argc, char **argv) {
   if(argc>2) return EXIT_FAILURE;
   if(argc == 2){
      if(argv[1][0] == '-' &&
         argv[1][1] == 'd'   )
      {debug_form = true;}
      else return EXIT_FAILURE;
   }
   char *progname = basename(argv[0]);
   char buffer[256];
   int linenr;
   for(linenr = 1; ;++linenr){
      char *gotline = fgets(buffer, sizeof buffer, stdin);
      if(gotline == NULL) break;

      char *nlpos = strchr(buffer, '\n');
      if(nlpos != NULL) *nlpos = '\0';
      else
         fprintf(stderr, "%s: %d: unterminated line: %s\n",
                 progname, linenr, buffer);
      insert(gotline);
   }
   if(debug_form == true) handle_debug();
   else print();
   free_nodes();
   return EXIT_SUCCESS;
}

