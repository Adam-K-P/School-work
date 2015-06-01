// $Id: inode.cpp,v 1.12 2014-07-03 13:29:57-07 - - $

#include <iostream>
#include <stdexcept>

using namespace std;

#include "debug.h"
#include "inode.h"

int inode::next_inode_nr {0};

inode::inode(inode_t init_type):
   inode_nr (next_inode_nr++), type (init_type)
{
   switch (type) {
      case PLAIN_INODE:
           contents = make_shared<plain_file>();
           break;
      case DIR_INODE:
           contents = make_shared<directory>();
           break;
   }
   DEBUGF ('i', "inode " << inode_nr << ", type = " << type);
}

int inode::get_inode_nr() const {
   DEBUGF ('i', "inode = " << inode_nr);
   return inode_nr;
}

inode_t inode::get_inode_type() const {
   return type;
}

file_base_ptr inode::get_contents() const {
   return contents;
}

plain_file_ptr plain_file_ptr_of (file_base_ptr ptr) {
   plain_file_ptr pfptr = dynamic_pointer_cast<plain_file> (ptr);
   if (pfptr == nullptr) throw invalid_argument ("plain_file_ptr_of");
   return pfptr;
}

directory_ptr directory_ptr_of (file_base_ptr ptr) {
   directory_ptr dirptr = dynamic_pointer_cast<directory> (ptr);
   if (dirptr == nullptr) throw invalid_argument ("directory_ptr_of");
   return dirptr;
}

size_t plain_file::size() const {
   size_t size {0};
   DEBUGF ('i', "size = " << size);
   return size;
}

void plain_file::writefile (const wordvec& words) {
   data = words;
   DEBUGF ('i', words);
}

void plain_file::readfile () {
   wordvec::iterator it = data.begin();
   for(it = it + 2; it != data.end(); ++it) {
      cout << *it << " ";
   }
   cout << endl;
}

size_t directory::size() const {
   size_t size {0};
   DEBUGF ('i', "size = " << size);
   return size;
}

inode_ptr directory::mkdir (const string& dirname, inode_ptr cwd) {
   set_name(dirname);
   shared_ptr<inode> dir = make_shared<inode> (DIR_INODE);
   if(dirents.count(dirname) == 1) {
      cerr << "Already a directory by this name" << endl;
      return nullptr;
   }
   dirents.insert({dirname, dir});
   file_base_ptr contents = dir->get_contents();
   directory_ptr this_dir = directory_ptr_of(contents);
   this_dir->insert_parent(dir, cwd);
   return dir;
}

inode_ptr directory::make_root() {
   shared_ptr<inode> dir = make_shared<inode> (DIR_INODE);
   dirents.insert({".", dir});
   dirents.insert({"..", dir});
   return dir;
}


void directory::insert_parent (inode_ptr this_dir, inode_ptr parent) {
   dirents.insert({".",  this_dir});
   dirents.insert({"..", parent});
}

map<string, inode_ptr> directory::get_dirents() {
   return dirents;
}

inode_ptr directory::mkfile (const string& filename) {
   shared_ptr<inode> file = make_shared<inode> (PLAIN_INODE);
   if(dirents.count(filename) == 1) {
      cerr << "Already a file by this name" << endl;
      return nullptr;
   }
   dirents.insert({filename, file});
   return file;
}

inode_ptr directory::find_dir (const string& dirname) {
   if(dirents.count(dirname) == 0) {
      cerr << "No such directory" << endl;
      return nullptr;
   }
   inode_ptr dir = dirents.at(dirname);
   return dir; 
}

void directory::remove (const string& filename) {
   if(dirents.count(filename) == 0) {
      cerr << "No such file found" << endl;
      return;
   }
   map<string, inode_ptr>::iterator it = dirents.find(filename);
   dirents.erase(it);
   DEBUGF ('i', filename);
}

string directory::get_name() {
   return dir_name;
}   

void directory::set_name(const string& name) {
   dir_name = name;
}

inode_state::inode_state() {
   DEBUGF ('i', "root = " << root << ", cwd = " << cwd
          << ", prompt = \"" << prompt << "\"");
}

void inode_state::set_root(inode_ptr new_root) {
   root = new_root;
   cwd  = new_root;
}

void inode_state::set_cwd (inode_ptr new_cwd) {
   cwd = new_cwd;
}

void inode_state::set_prompt (const string& new_prompt) {
   prompt = new_prompt; 
}

string inode_state::get_prompt() const {
   return prompt;
}

inode_ptr inode_state::get_cwd() {
   return cwd;
}

inode_ptr inode_state::get_root() {
   return root;
}

ostream& operator<< (ostream& out, const inode_state& state) {
   out << "inode_state: root = " << state.root
       << ", cwd = " << state.cwd;
   return out;
}

