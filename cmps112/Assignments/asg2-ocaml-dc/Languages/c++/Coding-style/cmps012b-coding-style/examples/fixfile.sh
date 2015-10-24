#!/bin/sh
# $Id: fixfile.sh,v 1.1 2009-12-17 18:04:46-08 - - $
#
# NAME
#    fixfile.sh - fix basic formatting in a text file
#
# SYNOPSIS
#    fixfile.sh [filename...]
#
# DESCRIPTION
#    Fixes basic formatting on a text file:
#    Expands tabs to 8 spaces using expand(1).
#    Deletes trailing carriage return characters.
#    Adds a final newline if missing from the file.
#
# BUGS
#    Does not fix lines longer than 72 characters.
#

for file in $* ; do
   /usr/bin/echo '%!expand\n%s/\r//\nw\nq' | /usr/bin/ex $file
done
