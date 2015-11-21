//Adam Pinarbasi
//akpinarb

#include <bitset>
#include <iostream>
#include <string>
#include <unordered_map>

#include "astree.h"
#include "utils.h"
#include "symbol_table.h"
#include "stringset.h"

using namespace std;

void add_attributes (astree *node) {

}

void set_attributes (astree* node) {
   vector<astree*> children = node->children;
   for (auto i = children.begin(); i != children.end(); ++i) 
      set_attributes (*i);
   add_attributes (node);
}
   
