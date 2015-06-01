// Adam Pinarbasi akpinarb
// $Id: nsort.c,v 1.1 2011-04-29 19:46:42-07 - - $
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <libgen.h>

typedef struct node node;
struct node 
{
   double item;
   node *link;
};

node *head = NULL;
bool debug_form = false;
int exit_status = EXIT_SUCCESS;

void print(void){
   for(node *curr = head; curr != NULL; curr = curr->link)
      printf("%24.15g\n", curr->item);
}

void handle_debug(void){
   for(node *curr = head; curr != NULL; curr = curr->link)
      printf("%p\n", curr);
}

void free_nodes(void){
   node *curr = head;
   while(curr != NULL){
      node *temp = curr->link;
      free(curr);
      curr = temp;
   }
}

void insert(double item){
   node *curr = malloc(sizeof(node));
   node *prev = NULL;
   curr->item = item;
   curr->link = NULL;
   if(head == NULL){
      head = curr;
      return;
   }
   for(node *temp = head; temp != NULL; temp = temp->link){
      if(curr->item < temp->item){
         curr->link = temp;
         if(prev == NULL) head = curr;
         else prev->link = curr;
         return;
      }
      else if(temp->link == NULL)
      {
         temp->link = curr;
         return;
      }
      prev = temp;
   }
}

int main(int argc, char **argv){
   if(argc > 2) return EXIT_FAILURE;
   if(argc == 2){
      if(argv[1][0] == '-' &&
         argv[1][1] == 'd'   ) 
      {debug_form = true;}
      else return EXIT_FAILURE;
   }
   char err_buffer[256];
   char err_buf_fmt[16];
   char *progname = basename(argv[0]);
   for (;;)
   {
      double number;
      int scancount = scanf("%lg", &number);
      if(scancount == EOF) break;
      else if(scancount==1) { insert(number); }
      else
      {
         scancount = scanf(err_buf_fmt, err_buffer);
         assert(scancount == 1);
         printf("%s: bad number \"%s\"\n", progname, err_buffer);
      }
   }
   if(debug_form == true) handle_debug();
   else print();
   free_nodes();
   return exit_status;
}


      
         


