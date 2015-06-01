// $Id: listmap.h,v 1.11 2015-04-28 19:22:02-07 - - $

#ifndef __LISTMAP_H__
#define __LISTMAP_H__

#include "xless.h"
#include "xpair.h"

//
//node is dealt with in this section of the header
//
template <typename Key, typename Value, class Less=xless<Key>>
class listmap {
   public:
      using key_type = Key;
      using mapped_type = Value;
      using value_type = xpair<const key_type, mapped_type>;
   private:
      Less less;
      struct node;
      struct link {
         node* next{};
         node* prev{};
         link (node* next, node* prev): next(next), prev(prev){}
      };
      struct node: link {
         value_type value{};
         node (node* next, node* prev, const value_type&);
      };
      node* anchor() { return static_cast<node*> (&anchor_); }
      link anchor_ {anchor(), anchor()};
   public:
      class iterator;
      listmap(){};
      listmap (const listmap&);
      listmap& operator= (const listmap&);
      ~listmap();
      void handle_initial (const value_type&);
      void handle_final   (const value_type&);
      void insert (const value_type&);
      iterator find (const key_type&);
      void find_val (const mapped_type&);
      void print_all ();
      void erase (iterator position);
      void erase_all ();
      iterator begin() { return anchor()->next; }
      iterator end() { return anchor(); }
      bool empty() const { return begin() == end(); }
};

//
//iterator is dealt with in this section of the header
//
template <typename Key, typename Value, class Less=xless<Key>>
class listmap<Key,Value,Less>::iterator {
   private:
      friend class listmap<Key,Value>;
      listmap<Key,Value,Less>::node* where {nullptr};
      iterator (node* where): where(where){};
   public:
      iterator(){}
      value_type& operator*();
      value_type* operator->();
      iterator& operator++(); //++itor
      iterator& operator--(); //--itor
      void erase();
      bool operator== (const iterator&) const;
      bool operator!= (const iterator&) const;
      bool is_null () const;
};

#include "listmap.tcc"
#endif

