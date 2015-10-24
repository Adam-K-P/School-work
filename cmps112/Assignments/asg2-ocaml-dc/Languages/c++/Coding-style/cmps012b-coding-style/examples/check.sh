#!/bin/sh
# $Id: check.sh,v 1.1 2009-12-17 18:04:46-08 - - $
#
# NAME
#    check.sh - basic file format checks
#
# SYNOPSIS
#    check.sh [filename...]
#
# DESCRIPTION
#    Checks up on basic file formatting by expanding tabs to 8
#    character-stops and checking for a line length of <= 72
#    characters.  It prints out all lines longer than 72.
#    It then checks for any invisible characters by comparing
#    the visible display with the original file.  Tabs are
#    noted, except for a Makefile.
#    

for file in $*
do
   echo "********" testing $file 
   cat -n $file | expand | cut -c1-8,81- | grep .........
   case $file in Makefile) opt=-v;; *) opt=-vt;; esac
   cat $opt $file | diff - $file
   echo ================================================================
done
