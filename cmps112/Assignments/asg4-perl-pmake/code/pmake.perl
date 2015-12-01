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

if ($opts{'d'}) { exit $status; }

my $file;
if ($opts{'f'}) { 
   open $file, "<$ARGV[0]" or warn "$ARGV[0]: $1\n" and next; 
}
else { open $file, "<Makefile" or warn "Makefile: $1\n" and next; }

my @target_list;
for my $target (@ARGV) {
   if (not $opts{'f'}) { push @target_list, $target; }
   else { if ($target ne $ARGV[0]) { push @target_list, $target; }}
}

my %macros = (); #hash of macros with corresponding files
#get_macro_val
#returns string of appropriate macros hash value
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
            else { 
               print STDERR "macro: ", $macro, " not found\n"; 
               exit 1;
            }
         }
         else { $full_macro = $full_macro . $inner_macro; }
      }
      return $full_macro;
   }
   else { return $macro_val; }
}

my %targets = (); #holds targets and their prerequisites
while (defined (my $line = <$file>)) { #first pass
   chomp $line;
   if ($line =~ /#.*/) { next; }
   if ($line =~ /.*=.*/) { 
      my $macro_key;
      my $macro_val;
      ($macro_key, $macro_val) = split ('=', $line);
      $macros {trim ($macro_key)} = get_macro_val ($macro_val); 
   }
   if ($line =~/\t/) { next; } #ignore in first pass
   if ($line =~ /.*:.*/) {
      if (not (@target_list)) {
         my $throw_away;
         my $target;
         ($target, $throw_away) = split (':', $line);
         push @target_list, $target;
      }
      my $prereqs;
      my $target;
      ($target, $prereqs) = split (':', $line, 2);
      $targets {trim ($target)} = $prereqs;
   }
}

#get_prereq
#retrieves prereq, can handle macros
sub get_prereq {
   my $prereq = shift;
   my $target = shift;
   my $pre1;
   my $pre2;

   if ($prereq =~ /\$\$/) {
      ($pre1, $pre2) = split (/\$\$/, $prereq, 2);
      return (get_prereq ($pre1) . $$ . get_prereq ($pre2));
   }

   elsif ($prereq =~ /\$</) {
      ($pre1, $pre2) = split (/\$</, $prereq, 2);
      my $first_pre;
      my @prereqs = $targets {$target};
      if (not defined ($prereqs[0])) {
         print STDERR "No prereqs for target: ", $target, "\n";
         exit 1;
      }
      else { 
         return (get_prereq ($pre1) . $prereqs[0] . get_prereq ($pre2));
      }
   }

   elsif ($prereq =~ /\$@/) {
      ($pre1, $pre2) = split (/\$@/, $prereq, 2);
      my $first_tar;
      my $throw_away;
      ($first_tar, $throw_away) = split (' ', $target, 2);
      return (get_prereq ($pre1) . $first_tar . get_prereq ($pre2));
   }

   elsif ($prereq =~ /\${.*}/) {
      my $the_macro;
      ($pre1, $the_macro) = split (/\${/, $prereq, 2);
      ($the_macro, $pre2) = split ('}', $the_macro, 2);
      $the_macro = $macros {$the_macro};
      return (get_prereq ($pre1) . $the_macro . get_prereq ($pre2));
   }

   else { return $prereq; }
}

my %target_times = ();
#execute_target
#will execute the commands for a target
sub execute_target {
   my @times;
   my $target = shift;
   my $prereqs = $targets {$target};
   $prereqs = get_prereq ($prereqs, $target);
   my @prereq_list = split (' ', $prereqs);
   my $most_rec = 0; #most recent file changed in prereqs
   for my $prereq (@prereq_list) {
      my @stat = stat $prereq;
      if (not @stat) {
         print STDERR "File: ", $prereq, " not found\n";
         exit 1;
      }
      elsif ($stat[9] > $most_rec) { $most_rec = $stat[9]; }
   }
   printf "%s\n", $most_rec;
   if (not defined ($target_times {$target})) {
      $target_times {$target} = $most_rec;
   }
}

while (@target_list) {
   my $target = trim (shift @target_list);
   if (not defined ($targets {$target})) {
      print STDERR "target: ", $target, " not found\n";
      next;
   }
   else { #perform target execution
      seek $file, 0, 0;
      while (defined (my $line = <$file>)) { 
         chomp $line; 
         if ($line =~ /$target *:/) { 
            execute_target ($target); 
            last; 
         }
      }
   }
}
   


