//Adam Pinarbasi
//akpinarb

#ifndef __SYMBOL_TABLE_H
#define __SYMBOL_TABLE_H

#include <bitset>
#include <string>
#include <unordered_map>
#include <vector>

#include "auxlib.h"
#include "astree.h"

enum { ATTR_void, ATTR_bool, ATTR_char, ATTR_int, ATTR_null,
       ATTR_string, ATTR_struct, ATTR_array, ATTR_function,
       ATTR_variable, ATTR_field, ATTR_typeid, ATTR_param,
       ATTR_lval, ATTR_const, ATTR_vreg, ATTR_vaddr,
       ATTR_bitset_size,
};
using attr_bitset = bitset<ATTR_bitset_size>;

struct symbol;
using symbol_table = unordered_map<string*, symbol*>;
using symbol_entry = symbol_table::value_type;

struct symbol {
   attr_bitset attributes;
   symbol_table* fields;
   size_t filenr, linenr, offset;
   size_t blocknr;
   vector<symbol*>* parameters;
};

void set_attributes (struct astree*);

#endif
