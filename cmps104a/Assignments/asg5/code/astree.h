// $Id: astree.h,v 1.9 2015-07-09 18:25:23-07 - - $

#ifndef __ASTREE_H__
#define __ASTREE_H__

#include <string>
#include <vector>
using namespace std;

#include "syslib.h"
#include "symbol_table.h"

struct location {
   size_t filenr;
   size_t linenr;
   size_t offset;
};

struct astree {

   // Fields.
   int symbol;               // token code
   location lloc;            // source location
   const string* lexinfo;    // pointer to lexical information
   vector<astree*> children; // children of this n-way node
   attr_bitset attributes;
   symbol_table* table;
   struct symbol* this_symbol;
   size_t blocknr;
   const char* struct_name;
   int reg_num; //stores the register number

   // Functions.
   astree (int symbol, const location&, const char* lexinfo);
   ~astree();
   astree* adopt (astree* child1, astree* child2 = nullptr);
   astree* change_sym (int symbol);
   astree* adopt_sym (astree* child, int symbol);
   void dump_node (FILE*, int);
   void dump_tree (FILE*, int depth = 0, int token = 0);
   static void dump (FILE* outfile, astree* tree, int token = 0);
   static void print (FILE* outfile, astree* tree, int depth = 0);
};

void destroy (astree* tree1, astree* tree2 = nullptr);

void errllocprintf (const location&, const char* format, const char*);

#endif

