// $Id: commands.cpp,v 1.11 2014-06-11 13:49:31-07 - - $

#include <iomanip>

#include "commands.h"
#include "debug.h"

commands::commands(): map ({
   {"cat"   , fn_cat   },
   {"cd"    , fn_cd    },
   {"echo"  , fn_echo  },
   {"exit"  , fn_exit  },
   {"ls"    , fn_ls    },
   {"lsr"   , fn_lsr   },
   {"make"  , fn_make  },
   {"mkdir" , fn_mkdir },
   {"prompt", fn_prompt},
   {"pwd"   , fn_pwd   },
   {"rm"    , fn_rm    },
}){}

command_fn commands::at (const string& cmd) {
   // Note: value_type is pair<const key_type, mapped_type>
   // So: iterator->first is key_type (string)
   // So: iterator->second is mapped_type (command_fn)
   command_map::const_iterator result = map.find (cmd);
   if (result == map.end()) {
      throw yshell_exn (cmd + ": no such function");
   }
   return result->second;
}

void fn_cat (inode_state& state, const wordvec& words){
   if(words.size() == 1) {
      cerr << "no file specified" << endl;
      return;
   }
   inode_ptr org_cwd = state.get_cwd();
   wordvec new_words;
   size_t max = words.size();
   if(max == 1) {
      state.set_cwd(state.get_root());
      return;
   }
   if(words.at(1)[0] == '/') state.set_cwd(state.get_root());
   for(size_t i = 1; i < max; ++i) {
      const string delimiter = "/";
      new_words = split(words.at(i), delimiter); 
   }
   size_t new_max = new_words.size();
   for(size_t j = 0; j < new_max; ++j) {
      inode_ptr cwd = state.get_cwd();
      file_base_ptr contents = cwd->get_contents();
      directory_ptr this_dir = directory_ptr_of(contents);
      inode_ptr next_dir = this_dir->find_dir(new_words.at(j));
      if(next_dir == nullptr) return;
      state.set_cwd(next_dir);
   }
   inode_ptr cwd = state.get_cwd();
   file_base_ptr contents = cwd->get_contents();
   plain_file_ptr this_file = plain_file_ptr_of(contents);
   this_file->readfile();
   state.set_cwd(org_cwd);
   DEBUGF ('c', state);
   DEBUGF ('c', words);
}

void fn_cd (inode_state& state, const wordvec& words){
   wordvec new_words;
   size_t max = words.size();
   if(max == 1) {
      state.set_cwd(state.get_root());
      return;
   }
   if(words.at(1)[0] == '/') state.set_cwd(state.get_root());
   for(size_t i = 1; i < max; ++i) {
      const string delimiter = "/";
      new_words = split(words.at(i), delimiter); 
   }
   size_t new_max = new_words.size();
   for(size_t j = 0; j < new_max; ++j) {
      inode_ptr cwd = state.get_cwd();
      file_base_ptr contents = cwd->get_contents();
      directory_ptr this_dir = directory_ptr_of(contents);
      inode_ptr next_dir = this_dir->find_dir(new_words.at(j));
      if(next_dir == nullptr) return;
      state.set_cwd(next_dir);
   }
   DEBUGF ('c', state);
   DEBUGF ('c', words);
}

void fn_echo (inode_state& state, const wordvec& words){
   size_t max = words.size(); 
   for(size_t i = 1; i < max; ++i) cout << words.at(i) << " ";
   cout << endl;
   DEBUGF ('c', state);
   DEBUGF ('c', words);
}

void fn_exit (inode_state& state, const wordvec& words){
   DEBUGF ('c', state);
   DEBUGF ('c', words);
   throw ysh_exit_exn();
}

void fn_ls (inode_state& state, const wordvec& words){
   inode_ptr org_cwd = state.get_cwd();
   wordvec new_words;
   size_t max = words.size();
   if(words.size() == 1); 
   else if(words.at(1)[0] == '/') state.set_cwd(state.get_root());
   for(size_t i = 1; i < max; ++i) {
      const string delimiter = "/";
      new_words = split(words.at(i), delimiter); 
   }
   size_t new_max = new_words.size();
   for(size_t j = 0; j < new_max; ++j) {
      inode_ptr cwd = state.get_cwd();
      file_base_ptr contents = cwd->get_contents();
      directory_ptr this_dir = directory_ptr_of(contents);
      inode_ptr next_dir = this_dir->find_dir(new_words.at(j));
      if(next_dir == nullptr) return;
      state.set_cwd(next_dir);
   }
   inode_ptr cwd = state.get_cwd();
   file_base_ptr contents = cwd->get_contents();
   directory_ptr this_dir = directory_ptr_of(contents);
   map<string, inode_ptr> dirents = this_dir->get_dirents();
   for(map<string, inode_ptr>::iterator it = dirents.begin();
                                        it != dirents.end(); ++it){
      cout << setw(6) << it->second->get_inode_nr() << "  " 
           << setw(6) << this_dir->size() << "  " << it->first << endl;
   }
   state.set_cwd(org_cwd);
   DEBUGF ('c', state);
   DEBUGF ('c', words);
}

void fn_lsr (inode_state& state, const wordvec& words){
   inode_ptr org_cwd = state.get_cwd();
   wordvec new_words;
   size_t max = words.size();
   if(max == 1) {
      state.set_cwd(state.get_root());
      return;
   }
   if(words.size() == 1);
   else if(words.at(1)[0] == '/') state.set_cwd(state.get_root());
   for(size_t i = 1; i < max; ++i) {
      const string delimiter = "/";
      new_words = split(words.at(i), delimiter); 
   }
   size_t new_max = new_words.size();
   for(size_t j = 0; j < new_max; ++j) {
      inode_ptr cwd = state.get_cwd();
      file_base_ptr contents = cwd->get_contents();
      directory_ptr this_dir = directory_ptr_of(contents);
      inode_ptr next_dir = this_dir->find_dir(new_words.at(j));
      if(next_dir == nullptr) return;
      state.set_cwd(next_dir);
   }
   help_lsr(state);
   state.set_cwd(org_cwd);
   DEBUGF ('c', state);
   DEBUGF ('c', words);
}

void help_lsr (inode_state& state) {
   if(state.get_cwd() == nullptr) return;
   inode_ptr cwd = state.get_cwd();
   file_base_ptr contents = cwd->get_contents();
   directory_ptr this_dir = directory_ptr_of(contents);
   map<string, inode_ptr> dirents = this_dir->get_dirents();
   for(map<string, inode_ptr>::iterator it = dirents.begin();
                                           it != dirents.end(); ++it) {
      if(it->second->get_inode_type() == DIR_INODE) {
         cout << setw(6) << it->second->get_inode_nr() << "  " 
            << setw(6) << this_dir->size() << "  "
            << it->first << endl;
         state.set_cwd(it->second);
         if(it->first != "." && it->first != "..") help_lsr(state);
      }
   }
}


void fn_make (inode_state& state, const wordvec& words){
   inode_ptr org_cwd = state.get_cwd();
   if(words.size() == 1) {
      cerr << "No pathname specified" << endl;
      return;
   }
   size_t max = words.size();
   if(max == 1) {
      cerr << "Invalid directory name" << endl;
      return;
   }
   wordvec new_words;
   if(words.at(1)[0] == '/') state.set_cwd(state.get_root());
   const string delimiter = "/";
   new_words = split(words.at(1), delimiter); 
   size_t new_max = new_words.size();
   size_t j = 0;
   for(; j < new_max - 1; ++j) {
      inode_ptr cwd = state.get_cwd();
      file_base_ptr contents = cwd->get_contents();
      directory_ptr this_dir = directory_ptr_of(contents);
      inode_ptr next_dir = this_dir->find_dir(new_words.at(j));
      if(next_dir == nullptr) return;
      state.set_cwd(next_dir);
   }
   inode_ptr cwd = state.get_cwd();
   file_base_ptr contents = cwd->get_contents();
   directory_ptr this_dir = directory_ptr_of(contents);
   inode_ptr new_file = this_dir->mkfile(new_words.at(j));
   if(new_file == nullptr) return;

   file_base_ptr file_cont = new_file->get_contents();
   plain_file_ptr this_file = plain_file_ptr_of(file_cont);
   this_file->writefile(words);

   state.set_cwd(org_cwd);
   DEBUGF ('c', state);
   DEBUGF ('c', words);
}

void fn_mkdir (inode_state& state, const wordvec& words){
   inode_ptr org_cwd = state.get_cwd();
   size_t max = words.size();
   if(max == 1) {
      cerr << "Invalid directory name" << endl;
      return;
   }
   wordvec new_words;
   if(words.at(1)[0] == '/') state.set_cwd(state.get_root());
   for(size_t i = 1; i < max; ++i) {
      const string delimiter = "/";
      new_words = split(words.at(i), delimiter); 
   }
   size_t new_max = new_words.size();
   size_t j = 0;
   for(; j < new_max - 1; ++j) {
      inode_ptr cwd = state.get_cwd();
      file_base_ptr contents = cwd->get_contents();
      directory_ptr this_dir = directory_ptr_of(contents);
      inode_ptr next_dir = this_dir->find_dir(new_words.at(j));
      if(next_dir == nullptr) return;
      state.set_cwd(next_dir);
   }
   inode_ptr cwd = state.get_cwd();
   file_base_ptr contents = cwd->get_contents();
   directory_ptr this_dir = directory_ptr_of(contents);
   inode_ptr new_dir = this_dir->mkdir(new_words.at(j), cwd);
   if(new_dir == nullptr) return;
   state.set_cwd(org_cwd);
   DEBUGF ('c', state);
   DEBUGF ('c', words);
}

void fn_prompt (inode_state& state, const wordvec& words){
   if(words.size() == 1 || words.size() > 2) {
      cerr << "Invalid prompt" << endl;
      return;
   }
   state.set_prompt(words.at(1));
   DEBUGF ('c', state);
   DEBUGF ('c', words);
}

void fn_pwd (inode_state& state, const wordvec& words){
   inode_ptr org_cwd = state.get_cwd();
   print(state, words);
   state.set_cwd(org_cwd);
   cout << endl;
   DEBUGF ('c', state);
   DEBUGF ('c', words);
}

void print(inode_state& state, const wordvec& words) {
   if(state.get_cwd() == state.get_root()) return;
   inode_ptr org_cwd = state.get_cwd();
   wordvec these_words = split("cd ..", " ");
   fn_cd(state, these_words);
   print(state, words);
   inode_ptr cwd = org_cwd;
   file_base_ptr contents = cwd->get_contents();
   directory_ptr this_dir = directory_ptr_of(contents); 
   string dir(this_dir->get_name());
   cout << "/" << dir;
}

void fn_rm (inode_state& state, const wordvec& words){
   inode_ptr org_cwd = state.get_cwd();
   wordvec new_words;
   size_t max = words.size();
   if(max == 1) {
      cerr << "No file specified" << endl;
      return;
   }
   if(words.at(1)[0] == '/') state.set_cwd(state.get_root());
   for(size_t i = 1; i < max; ++i) {
      const string delimiter = "/";
      new_words = split(words.at(i), delimiter); 
   }
   size_t new_max = new_words.size();
   size_t j = 0;
   for(; j < new_max - 1; ++j) {
      inode_ptr cwd = state.get_cwd();
      file_base_ptr contents = cwd->get_contents();
      directory_ptr this_dir = directory_ptr_of(contents);
      inode_ptr next_dir = this_dir->find_dir(new_words.at(j));
      if(next_dir == nullptr) return;
      state.set_cwd(next_dir);
   }
   inode_ptr cwd = state.get_cwd();
   file_base_ptr contents = cwd->get_contents();
   directory_ptr this_dir = directory_ptr_of(contents);
   this_dir->remove(new_words.at(j));
   state.set_cwd(org_cwd);
   DEBUGF ('c', state);
   DEBUGF ('c', words);
}

void fn_rmr (inode_state& state, const wordvec& words){
   inode_ptr org_cwd = state.get_cwd();
   wordvec new_words;
   size_t max = words.size();
   if(max == 1 or max == 2) {
      cerr << "Invalid pathname" << endl;
      return;
   }
   if(words.at(1)[0] == '/') state.set_cwd(state.get_root());
   for(size_t i = 1; i < max; ++i) {
      const string delimiter = "/";
      new_words = split(words.at(i), delimiter); 
   }
   size_t new_max = new_words.size();
   size_t j = 0;
   for(; j < new_max - 1; ++j) {
      inode_ptr cwd = state.get_cwd();
      file_base_ptr contents = cwd->get_contents();
      directory_ptr this_dir = directory_ptr_of(contents);
      inode_ptr next_dir = this_dir->find_dir(new_words.at(j));
      if(next_dir == nullptr) return;
      state.set_cwd(next_dir);
   }
   help_rmr(state);
   state.set_cwd(org_cwd);
   DEBUGF ('c', state);
   DEBUGF ('c', words);
}

void help_rmr (inode_state& state) {
   if(state.get_cwd() == nullptr) return;
   inode_ptr cwd = state.get_cwd();
   file_base_ptr contents = cwd->get_contents();
   directory_ptr this_dir = directory_ptr_of(contents);
   map<string, inode_ptr> dirents = this_dir->get_dirents();
   for(map<string, inode_ptr>::iterator it = dirents.begin();
                                           it != dirents.end(); ++it) {
      if(it->second->get_inode_type() != DIR_INODE)
         this_dir->remove(it->first);
      else {
         state.set_cwd(it->second);
         if(it->first != "." && it->first != "..") help_lsr(state);
         this_dir->remove(it->first);
      }
   }

}

int exit_status_message() {
   int exit_status = exit_status::get();
   cout << execname() << ": exit(" << exit_status << ")" << endl;
   return exit_status;
}



