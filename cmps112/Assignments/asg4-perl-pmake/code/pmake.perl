#!/usr/bin/perl -w
# Adam Pinarbasi
# akpinarb

use strict;
use warnings;
use Getopt::Std;

my $status = 0;
END {exit $status;}
$SIG{__WARN__} = sub {print STDERR "$0: @_"; $status = 1};
$SIG{__DIE__}  = sub {warn @_; $status = 1; exit};

my %opts;
getopts "dnf", \%opts;

# Linux x86_64 GNU/Linux
my %strsignal = (
    0 => "Unknown signal 0",
    1 => "Hangup",
    2 => "Interrupt",
    3 => "Quit",
    4 => "Illegal instruction",
    5 => "Trace/breakpoint trap",
    6 => "Aborted",
    7 => "Bus error",
    8 => "Floating point exception",
    9 => "Killed",
   10 => "User defined signal 1",
   11 => "Segmentation fault",
   12 => "User defined signal 2",
   13 => "Broken pipe",
   14 => "Alarm clock",
   15 => "Terminated",
   16 => "Stack fault",
   17 => "Child exited",
   18 => "Continued",
   19 => "Stopped (signal)",
   20 => "Stopped",
   21 => "Stopped (tty input)",
   22 => "Stopped (tty output)",
   23 => "Urgent I/O condition",
   24 => "CPU time limit exceeded",
   25 => "File size limit exceeded",
   26 => "Virtual timer expired",
   27 => "Profiling timer expired",
   28 => "Window changed",
   29 => "I/O possible",
   30 => "Power failure",
   31 => "Bad system call",
   32 => "Unknown signal 32",
   33 => "Unknown signal 33",
   34 => "Real-time signal 0",
   35 => "Real-time signal 1",
   36 => "Real-time signal 2",
   37 => "Real-time signal 3",
   38 => "Real-time signal 4",
   39 => "Real-time signal 5",
   40 => "Real-time signal 6",
   41 => "Real-time signal 7",
   42 => "Real-time signal 8",
   43 => "Real-time signal 9",
   44 => "Real-time signal 10",
   45 => "Real-time signal 11",
   46 => "Real-time signal 12",
   47 => "Real-time signal 13",
   48 => "Real-time signal 14",
   49 => "Real-time signal 15",
   50 => "Real-time signal 16",
   51 => "Real-time signal 17",
   52 => "Real-time signal 18",
   53 => "Real-time signal 19",
   54 => "Real-time signal 20",
   55 => "Real-time signal 21",
   56 => "Real-time signal 22",
   57 => "Real-time signal 23",
   58 => "Real-time signal 24",
   59 => "Real-time signal 25",
   60 => "Real-time signal 26",
   61 => "Real-time signal 27",
   62 => "Real-time signal 28",
   63 => "Real-time signal 29",
   64 => "Real-time signal 30",
);

sub trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s; }

if ((scalar (@ARGV)) > 2) { 
   print STDERR "usage: pmake [-d] [-n] [-f makefile] [target]\n";
   exit 1;
}

if ($opts{'d'}) { exit $status; }

my $file;
if ($opts{'f'}) { 
   open $file, "<$ARGV[0]" or warn "$ARGV[0]: $1\n" and next; 
}
else { open $file, "<Makefile" or warn "Makefile: $1\n" and next; }

my $target;
if (not $opts{'f'} and defined ($ARGV[0])) { $target = $ARGV[0]; }
if (    $opts{'f'} and defined ($ARGV[1])) { $target = $ARGV[1]; }

my %macros = ();
sub get_macro_val {
   my $macro_val = shift;
   if ($macro_val =~ /\${.*}/) {
      my @inner_macros;
      my $full_macro = '';
      @inner_macros = split (/\${/, $macro_val);
      for my $inner_macro (@inner_macros) {
         if ($inner_macro =~ '}') {
            my $macro;
            my $val;
            ($macro, $val) = split ('}', $inner_macro, 2);
            if (defined ($macros {$macro}))  
               { $full_macro = $full_macro . $macros {$macro} . $val; }
            else { print STDERR "macro: ", $macro, " not found\n"; }
         }
         else { $full_macro = $full_macro . $inner_macro; }
      }
      return $full_macro;
   }
   else { return $macro_val; }
}

while (defined (my $line = <$file>)) { #first pass
   chomp $line;
   if ($line =~ /#.*/) { next; }
   if ($line =~ /.*=.*/) { 
      my $macro_key;
      my $macro_val;
      ($macro_key, $macro_val) = split ('=', $line);
      $macros {trim ($macro_key)} = get_macro_val ($macro_val); 
   }
   if (not defined ($ARGV[1]) and not defined ($target) 
                              and $line =~ /.*:.*/) {
      my $throw_away;
      ($target, $throw_away) = split (':', $line);
   }
}

seek $file, 0, 0;
while (defined (my $line = <$file>)) { #second pass
   chomp $line;
   if ($line =~ $target) { printf "target: %s\n", $target; }
}
   


