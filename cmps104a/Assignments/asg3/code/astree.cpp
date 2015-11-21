// $Id: astree.cpp,v 1.12 2015-07-09 18:30:04-07 - - $

#include <assert.h>
#include <inttypes.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "astree.h"
#include "stringset.h"
#include "utils.h"
#include "yylex.h"

astree::astree (int symbol_, const location& lloc_, const char* info) {
   symbol = symbol_;
   lloc = lloc_;
   lexinfo =  intern_stringset(info);
   // vector defaults to empty -- no children
}

astree::~astree() {
   while (not children.empty()) {
      astree* child = children.back();
      children.pop_back();
      delete child;
   }
   if (yydebug) {
      fprintf (stderr, "Deleting astree (");
      astree::dump (stderr, this);
      fprintf (stderr, ")\n");
   }
}

astree* astree::adopt (astree* child1, astree* child2) {
   if (child1 != nullptr) children.push_back (child1);
   if (child2 != nullptr) children.push_back (child2);
   return this;
}

astree* astree::change_sym (int symbol_) {
   symbol = symbol_;
   return this;
}

astree* astree::adopt_sym (astree* child, int symbol_) {
   symbol = symbol_;
   return adopt (child);
}

void astree::dump_node (FILE* outfile, int token) {
   fprintf (outfile, "%4lu  %2lu.%.3lu %3d %-16s (%s)\n",
            lloc.filenr, lloc.linenr, lloc.offset, token, 
            parser::get_tname (symbol), yytext);
}

void astree::dump_tree (FILE* outfile, int depth, int token) {
   fprintf (outfile, "%*s", depth * 3, "");
   dump_node (outfile, token);
   fprintf (outfile, "\n");
   for (astree* child: children) child->dump_tree (outfile, depth + 1);
   fflush (NULL);
}

void astree::dump (FILE* outfile, astree* tree, int token) {
   if (tree == nullptr) fprintf (outfile, "nullptr");
                   else tree->dump_node (outfile, token);
}

void astree::print (FILE* outfile, astree* tree, int depth) {
   for (int i = 0; i < depth * 3; i += 3) 
      { fprintf (outfile, "|  "); }
   const char *tname = parser::get_tname (tree->symbol);
   if (strstr (tname, "TOK_") == tname) { 
      tname += 4;
      if (strstr (tname, "KW_") == tname) tname += 3; 
   }
   fprintf (outfile, "%s \"%s\" %zd.%zd.%zd\n",
            tname, tree->lexinfo->c_str(),
            tree->lloc.filenr, tree->lloc.linenr, tree->lloc.offset);
   for (astree* child: tree->children) 
      astree::print (outfile, child, depth + 1);
}

void destroy (astree* tree1, astree* tree2) {
   if (tree1 != nullptr) delete tree1;
   if (tree2 != nullptr) delete tree2;
}

void errllocprintf (const location& lloc, const char* format,
                    const char* arg) {
   static char buffer[0x1000];
   assert (sizeof buffer > strlen (format) + strlen (arg));
   snprintf (buffer, sizeof buffer, format, arg);
   errprintf ("%s:%zd.%zd: %s", 
              lexer::filename (lloc.filenr), lloc.linenr, lloc.offset,
              buffer);
}
