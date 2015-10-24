#!/usr/bin/perl
# $Id: check.perl,v 1.1 2009-12-17 18:04:46-08 - - $
$0 =~ s|/*$||;
$0 =~ s|^.*/||;

for $filename (@ARGV) {
   $tab = "t" x $filename !~ m/^Makefile$/;
   $badcharcmd = "cat -v$tab $filename 2>&1 | diff - $filename 2>&1\n";
   @badcharlis = `$badcharcmd`;
   $linelencmd = "cat -n $filename 2>&1 | expand 2>&1\n";
   @linelenlis = grep {m/.{81}/} `$linelencmd`;
   if (@badcharlis || @linelenlis) {
      $status = 1;
      print "=" x 72, "\n";
      print "$0: $filename: bad formatting\n";
      print "$0: $badcharcmd", @badcharlis;
      print "$0: $linelencmd", @linelenlis;
      print "=" x 72, "\n";
   }
}

exit $status;
