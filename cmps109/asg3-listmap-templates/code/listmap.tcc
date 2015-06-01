// $Id: listmap.tcc,v 1.7 2015-04-28 19:22:02-07 - - $

#include "listmap.h"
#include "trace.h"
#include "xpair.h"

//
/////////////////////////////////////////////////////////////////
// Operations on listmap::node.
/////////////////////////////////////////////////////////////////
//

//
// listmap::node::node (link*, link*, const value_type&)
//
template <typename Key, typename Value, class Less>
listmap<Key,Value,Less>::node::node (node* next, node* prev,
                                     const value_type& value):
            link (next, prev), value (value) {
}

//
/////////////////////////////////////////////////////////////////
// Operations on listmap.
/////////////////////////////////////////////////////////////////
//

//
// listmap::~listmap()
//
template <typename Key, typename Value, class Less>
listmap<Key,Value,Less>::~listmap() {
   TRACE ('l', (void*) this);
}

//
// listmap::handle_initial (const value_type& pair)
//
template <typename Key, typename Value, class Less>
void listmap<Key,Value,Less>::handle_initial 
                              (const value_type& pair) {
   node* rope = anchor();
   node*curr = new node(rope, rope, pair);
   rope->next = curr;
   rope->prev = curr;
}

//
// listmap::handle_final (const value_type& pair)
//
template <typename Key, typename Value, class Less>
void listmap<Key,Value,Less>::handle_final
                              (const value_type& pair) {
   node* rope = anchor(); 
   node* curr = new node(rope, rope->prev, pair);
   rope->prev->next = curr;
   rope->prev = curr;
}

//
// iterator listmap::insert (const value_type&)
//
template <typename Key, typename Value, class Less>
void listmap<Key,Value,Less>::insert (const value_type& pair) {
   node* rope = anchor();
   if (rope->next == rope) { handle_initial(pair); return; }
   for (listmap<Key,Value,Less>::iterator itor = this->begin();
        itor != this->end(); ++itor) {
      if (pair.first < itor.where->value.first) {
         node* curr = new node(itor.where, itor.where->prev, 
                               pair);
         itor.where->prev->next = curr;
         itor.where->prev = curr;
         return;
      }
      if (pair.first == itor.where->value.first) {
         node* curr = new node(itor.where->next, 
                               itor.where->prev, pair);
         itor.where->prev->next = curr;
         itor.where->next->prev = curr; 
         delete itor.where;
         return;
      }
   }
   handle_final(pair);
}

//
// listmap::find(const key_type&)
//
template <typename Key, typename Value, class Less>
typename listmap<Key,Value,Less>::iterator
listmap<Key,Value,Less>::find (const key_type& that) {
   for (listmap<Key,Value,Less>::iterator itor = this->begin();
      itor != this->end(); ++itor) 
      if (that == (itor.where->value).first) return itor;
   return iterator();
}

//
// listmap::find_val(const mapped_type&)
//
template <typename Key, typename Value, class Less>
void listmap<Key,Value,Less>::find_val (const mapped_type& that) {
   for (listmap<Key,Value,Less>::iterator itor = this->begin();
        itor != this->end(); ++itor)
      if (that == (itor.where->value).second) 
         cout << (*itor).first << " = " << (*itor).second << endl;
}

//
// listmap::print_all
//
template <typename Key, typename Value, class Less>
void listmap<Key,Value,Less>::print_all () {
   for (listmap<Key,Value,Less>::iterator itor = this->begin();
        itor != this->end(); ++itor)
      cout << (*itor).first << " = " << (*itor).second  << endl;
}

//
// iterator listmap::erase (iterator position)
//
template <typename Key, typename Value, class Less>
void listmap<Key,Value,Less>::erase (iterator position) {
   position.where->prev->next = position.where->next;
   position.where->next->prev = position.where->prev;
   delete position.where;
}

//
// listmap::erase_all ()
//
template <typename Key, typename Value, class Less>
//typename listmap<Key,Value,Less>::iterator
void listmap<Key,Value,Less>::erase_all () {
   listmap<Key,Value,Less>::iterator itor = this->begin();
   while (itor != this->end()) {
      node* temp = itor.where->next;
      delete itor.where;
      itor = temp;
   }
}

//
/////////////////////////////////////////////////////////////////
// Operations on listmap::iterator.
/////////////////////////////////////////////////////////////////
//

//
// listmap::value_type& listmap::iterator::operator*()
//
template <typename Key, typename Value, class Less>
typename listmap<Key,Value,Less>::value_type&
listmap<Key,Value,Less>::iterator::operator*() {
   TRACE ('l', where);
   return where->value;
}

//
// listmap::value_type* listmap::iterator::operator->()
//
template <typename Key, typename Value, class Less>
typename listmap<Key,Value,Less>::value_type*
listmap<Key,Value,Less>::iterator::operator->() {
   TRACE ('l', where);
   return &(where->value);
}

//
// listmap::iterator& listmap::iterator::operator++()
//
template <typename Key, typename Value, class Less>
typename listmap<Key,Value,Less>::iterator&
listmap<Key,Value,Less>::iterator::operator++() {
   TRACE ('l', where);
   where = where->next;
   return *this;
}

//
// listmap::iterator& listmap::iterator::operator--()
//
template <typename Key, typename Value, class Less>
typename listmap<Key,Value,Less>::iterator&
listmap<Key,Value,Less>::iterator::operator--() {
   TRACE ('l', where);
   where = where->prev;
   return *this;
}

//
// bool listmap::iterator::operator== (const iterator&)
//
template <typename Key, typename Value, class Less>
inline bool listmap<Key,Value,Less>::iterator::operator==
            (const iterator& that) const {
   return this->where == that.where;
}

//
// bool listmap::iterator::operator!= (const iterator&)
//
template <typename Key, typename Value, class Less>
inline bool listmap<Key,Value,Less>::iterator::operator!=
            (const iterator& that) const {
   return this->where != that.where;
}

//
// bool listmapp::iterator::is_null (const iterator&)
//
template <typename Key, typename Value, class Less>
inline bool listmap<Key,Value,Less>::iterator::is_null () 
                                               const {
   return this->where == nullptr;
}








