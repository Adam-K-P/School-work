// Adam Pinarbasi akpinarb
// $Id: bigint.c,v 1.15 2015-02-03 18:11:58-08 - - $

#include <assert.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "bigint.h"
#include "debug.h"

#define MIN_CAPACITY 16

struct bigint {
   size_t capacity;
   size_t size;
   bool negative;
   char *digits;
};

void trim_zeros (bigint *this) {
   while (this->size > 0) {
      size_t digitpos = this->size - 1;
      if (this->digits[digitpos] != 0) break;
      --this->size;
   }
}

bigint *new_bigint (size_t capacity) {
   bigint *this = malloc (sizeof (bigint));
   assert (this != NULL);
   this->capacity = capacity;
   this->size = 0;
   this->negative = false;
   this->digits = calloc (this->capacity, sizeof (char));
   assert (this->digits != NULL);
   DEBUGS ('b', show_bigint (this));
   return this;
}

bigint *new_string_bigint (const char *string) {
   assert (string != NULL);
   size_t length = strlen (string);
   bigint *this = new_bigint (length > MIN_CAPACITY
                            ? length : MIN_CAPACITY);
   const char *strdigit = &string[length - 1];
   if (*string == '_') {
      this->negative = true;
      ++string;
   }
   char *thisdigit = this->digits;
   while (strdigit >= string) {
      assert (isdigit (*strdigit));
      *thisdigit++ = *strdigit-- - '0';
   }
   this->size = thisdigit - this->digits;
   trim_zeros (this);
   DEBUGS ('b', show_bigint (this));
   return this;
}

bigint *do_add (bigint *this, bigint *that, bigint *sum) {
   DEBUGS ('b', show_bigint (this));
   DEBUGS ('b', show_bigint (that));
   int carry = 0;
   int digit;
   unsigned int size = (this->size > that->size? 
                        this->size : that->size) + 1;
   sum->size = size;
   for(unsigned int index = 0; index <= size; index++) {
      digit = this->digits[index] + that->digits[index] + carry;
      sum->digits[index] = digit % 10;
      carry = digit / 10;
   }
   trim_zeros(sum);
   return sum;
}

bigint *do_sub (bigint *this, bigint *that, bigint *diff) {
   DEBUGS ('b', show_bigint (this));
   DEBUGS ('b', show_bigint (that));
   diff->size = this->size + 1;
   int borrow = 0;
   int digit;
   for(unsigned int index = 0; index <= diff->size; ++index) {
      digit = this->digits[index] - that->digits[index] - borrow + 10;
      diff->digits[index] = digit % 10;
      borrow = 1 - digit/10;
   }
   trim_zeros(diff);
   return diff;
}

void free_bigint (bigint *this) {
   free (this->digits);
   free (this);
}

void print_bigint (bigint *this) {
   DEBUGS ('b', show_bigint (this));
   int index = this->size - 1;
   if(this->negative) printf("-");
   for(unsigned int i = 0; i < this->size; ++i) 
      printf("%d", this->digits[index--]);
   printf("\n");
}

bigint *handle_same_size(bigint *this, bigint *that, bigint *result) {
   int index = this->size - 1;
   for(unsigned int i = 0; i < this->size; ++i) {
      if(this->digits[index] > that->digits[index]) {
         result->negative = this->negative;
         return do_sub(this, that, result);
      }
      if(that->digits[index] > this->digits[index]) {
         result->negative = that->negative;
         return do_sub(that, this, result);
      }
      --index;
   }
   result->negative = false;
   return do_sub(this, that, result);
}

bigint *add_bigint (bigint *this, bigint *that) {
   DEBUGS ('b', show_bigint (that));   
   bigint *sum = new_bigint((this->capacity > that->capacity ?
                             this->capacity : that->capacity) + 1);
   if(this->negative == that->negative) {
      sum->negative = this->negative;
   }
   else {
      if(this->size > that->size) {
         sum->negative = this->negative;
         return do_sub(this, that, sum);
      }
      if(that->size > this->size) {
         sum->negative = that->negative;
         return do_sub(that, this, sum);
      }
      return handle_same_size(this, that, sum);
   }
   return do_add(this, that, sum);
}

bigint *sub_bigint (bigint *this, bigint *that) {
   if(this->negative != that->negative || 
      this->negative || !that->negative  ) {

      if(that->negative) that->negative = false;
      else that->negative = true;
      return add_bigint(this, that);
   }
   bigint *diff = new_bigint(this->capacity);
   that->negative = false;
   DEBUGS ('b', show_bigint (this));
   DEBUGS ('b', show_bigint (that));
   return do_sub(this, that, diff);
}

bigint *mul_bigint (bigint *this, bigint *that) {
   DEBUGS ('b', show_bigint (this));
   DEBUGS ('b', show_bigint (that));
   bigint *product = new_bigint(this->capacity + that->capacity);
   bool sign = (this->negative == that->negative? false : true);
   product->negative = sign;
   product->size = this->size + that->size;
   int digit;
   for(unsigned int i = 0; i < this->size; ++i) {
      int index = i;
      int carry = 0;
      for(unsigned int j = 0; j < that->size; ++j) {
         digit = this->digits[i] * that->digits[j] + carry;
         product->digits[index] += (digit % 10);
         product->digits[index + 1] += (product->digits[index] / 10);
         product->digits[index] %= 10;
         carry = digit / 10;
         ++index;
     }
     product->digits[index] += carry;
     product->digits[index] %= 10;
     product->digits[index + 1] += product->digits[index] / 10;
   }
   trim_zeros(product);
   return product;
}

void show_bigint (bigint *this) {
   fprintf (stderr, "bigint@%p->{%lu,%lu,%c,%p->", this,
            this->capacity, this->size, this->negative ? '-' : '+',
            this->digits);
   for (char *byte = &this->digits[this->size - 1];
        byte >= this->digits; --byte) {
      fprintf (stderr, "%d", *byte);
   }
   fprintf (stderr, "}\n");
}

