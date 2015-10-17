#!/usr/bin/perl -w
# $Id: fixparser.perl,v 1.2 2010-02-12 15:04:56-08 - - $
#
# NAME
#    fixparser.perl - fix into a bison generated parser
#
# SYNOPSIS
#    fixparser.perl bisongeneratedfile
#
# DESCRIPTION
#
#    A bison-generated parser creates the array
#       YYSTYPE yyvsa[YYINITDEPTH];
#    as an unitialized local variable.  This causes dbx to crash
#    it with the following message:
#    <rtc> Read from uninitialized (rui):
#    Attempting to read 4 bytes at address 0xffbeef0c
#    which is 180 bytes above the current stack pointer
#    Variable is 'yyvsa'
#    =>[1] yyparse(), line 991 in "yyparse.c"
#      [2] main(argc = 4, argv = 0xffbef4ac), line 56 in "main.c"
#
#    The code below:
#    1. fixes the initial static uninitialized stack.
#    2. replaces malloc with calloc so an extended stack is
#       initialized.
#    3. inserts a call to user_destruct inside yydestruct to avoid
#       memory leak.
#    $. Assumes YYPRINT is defined for printing out stack contents.
#

$0 =~ s{.*/}{};

$fixit = <<'__END_FIXES__';
/YYDPRINTF ((stderr, "Starting parse\\n"));/a
/*$0*/bzero (yyvsa, sizeof yyvsa);
.
/# *define YYSTACK_ALLOC malloc/s|.*|/*$0: &*/|
a
/*$0*/#define YYSTACK_ALLOC(SIZE) calloc(1,SIZE)
.
/yydestruct (int yytype, YYSTYPE \*yyvaluep)/;/default:/a
/*$0*/user_destruct (yytype, yyvaluep);
.
/YYFPRINTF (yyoutput, "nterm %s/s|.*|/*$0*/{&|
/default:/a
/*$0*/#ifdef YYPRINT
/*$0*/YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
/*$0*/#endif
.
/^ *} *$/s|.*|/*$0*/&}|
w
q
__END_FIXES__

$fixit =~ s/\$0/$0/g;
print $fixit and exit if @ARGV && $ARGV[0] eq "-";
$command = "| ed $ARGV[0]";
open EDPIPE, $command or die "$0: $command: $!";
print STDERR "$0: $command: OK\n";
print EDPIPE $fixit;
close EDPIPE or die "$0: close(EDPIPE): $!"; 
print "$0: $command: status = $?\n" if $?;
