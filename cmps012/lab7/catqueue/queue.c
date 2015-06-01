// Adam Pinarbasi akpinarb
// $Id: queue.c,v 1.46 2015-02-26 19:10:25-08 - - $

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "queue.h"

#define STUBPRINTF(...) fprintf (stderr, __VA_ARGS__);

typedef struct queue_node queue_node;
struct queue_node {
   queue_item_t item;
   queue_node *link;
};

typedef struct queue queue;
struct queue {
   queue_node *front;
   queue_node *rear;
   queue_node *curr;
};

queue *new_queue (void) {
   queue *this = malloc(sizeof(queue));
   this->front = NULL;
   this->rear = NULL;
   this->curr = NULL;
   return this;
}

void free_queue (queue *this) {
   assert (isempty_queue (this));
   for(queue_node *curr = this->front; curr != NULL;){
      queue_node *temp = curr->link;
      free(curr->item);
      free(curr);
      curr = temp;
   }
   free (this);
}

void insert_queue (queue *this, queue_item_t item) {
   queue_node *this_node = malloc(sizeof(queue_node));   
   this_node->item = item;
   this_node->link = NULL;
   if(this->front == NULL)
      this->front = this->curr = this_node;
   else this->rear->link = this_node;
   this->rear = this_node;
}

queue_item_t remove_queue (queue *this) {
   queue_item_t temp = this->curr->item;
   this->curr = this->curr->link;
   return temp;
}

bool isempty_queue (queue *this) {
   return this->curr == NULL;
}

bool isempty_queue_front (queue *this) {
   return this->front == NULL;
}

