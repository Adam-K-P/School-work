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

my %macros = (); #hash of macros with corresponding files
my @target_list; #targets to be executed
my $file; #file read from
my %target_times = (); #time a target was last updated

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

# --------------------------------------------------------------------
# Subroutines
# --------------------------------------------------------------------

sub trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s; }

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

#pushes a target onto @target_list
sub push_target {
   my $target = shift;
   my $the_macro;
   if ($target =~ /\${.*}/) {
      my $t1;
      my $t2;
      ($t1, $the_macro) = split (/\${/, $target, 2);
      ($the_macro, $t2) = split ('}', $the_macro, 2);
   }
   else { $the_macro = $target; }
   push @target_list, $the_macro;
}

my %targets = (); #holds targets and their prerequisites
#wildcard
#performs wildcard executions
sub wildcard {
   my $target = shift;
   my $prereqs = shift;
   unless ($target =~ '%' and $prereqs =~ '%') { return 0; }
   opendir (DIR, '.') or die $!;
   my @wild_t_list;
   my @wild_p_list;
   my $throw_away;
   ($throw_away, $target) = split ('%', $target, 2);
   ($throw_away, $prereqs) = split ('%', $prereqs, 2);
   while (my $a_file = readdir (DIR)) {
      if ($a_file =~ $prereqs) {
         my $ret_pre = $a_file;
         my $ret_tar;
         ($ret_tar, $throw_away) = split ($prereqs, $a_file, 2);
         $ret_tar = $ret_tar . $target;
         $targets {$ret_tar} = $ret_pre;
         my $curpos = tell $file; #need to reset file pointer
         execute_target ($ret_tar);
         seek $file, $curpos, 0;
         delete $targets {$ret_tar};
      }
   }
   return 1;
}

#hash_target
#puts a target in the %targets hash
sub hash_target {
   my $target = shift;
   my $prereqs = shift;
   my $the_macro;
   $target = trim ($target);
   if (wildcard ($target, $prereqs)) { return; }
   if ($target =~ /\${.*}/) {
      my $t1;
      my $t2;
      ($t1, $target) = split (/\${/, $target, 2);
      ($target, $t2) = split ('}', $target, 2);
   }
   $targets {$target} = $prereqs;
}

#get_prereq
#checks for special macros
sub get_prereq {
   my $prereq = shift;
   my $target = shift;
   my $perf_tar = shift; #whether to execute targets
   my $pre1;
   my $pre2;

   if ($prereq =~ /\$\$/) {
      ($pre1, $pre2) = split (/\$\$/, $prereq, 2);
      return (get_prereq ($pre1, $target, $perf_tar) . '$' 
              . get_prereq ($pre2, $target, $perf_tar));
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
         return (get_prereq ($pre1, $target, $perf_tar) . $prereqs[0] 
                  . get_prereq ($pre2, $target, $perf_tar));
      }
   }

   elsif ($prereq =~ /\$@/) {
      ($pre1, $pre2) = split (/\$@/, $prereq, 2);
      my $first_tar;
      my $throw_away;
      ($first_tar, $throw_away) = split (' ', $target, 2);
      return (get_prereq ($pre1, $target, $perf_tar) . $first_tar 
               . get_prereq ($pre2, $target, $perf_tar));
   }

   elsif (defined $targets {trim $prereq} and $perf_tar) {
      my $curpos = tell $file;
      seek $file, 0, 0;
      point_target (trim $prereq);
      execute_target (trim $prereq);
      seek $file, $curpos, 0;
      return '';
   }

   elsif ($prereq =~ /\${.*}/) { #execute_target here?
      my $the_macro;
      ($pre1, $the_macro) = split (/\${/, $prereq, 2);
      ($the_macro, $pre2) = split ('}', $the_macro, 2);

      my $macro_exp = $macros {$the_macro}; 
      my @macro_exps = split (' ', $macro_exp);
      for my $macro (@macro_exps) {
         if (defined ($targets {$macro}) and $perf_tar) {
            my $curpos = tell $file;
            seek $file, 0, 0;
            point_target ($macro);
            execute_target ($macro);
            seek $file, $curpos, 0;
         }
      }

      if (defined ($targets {$the_macro}) and $perf_tar) { 
         my $curpos = tell $file;
         seek $file, 0, 0;
         point_target ($the_macro);
         execute_target ($the_macro); #not at proper place
         seek $file, $curpos, 0;
         return (get_prereq ($pre1, $target, $perf_tar) 
                  . get_prereq ($pre2, $target, $perf_tar));
      }

      else { $the_macro = $macros {$the_macro}; }

      return (get_prereq ($pre1, $target, $perf_tar) . 
              get_prereq ($the_macro) .
              get_prereq ($pre2, $target, $perf_tar));
   }

   else { return $prereq; }
}

sub check_prereqs {
   my $prereqs = shift;
   my $target = shift;
   my $retval = 1;
   
   my @prereq_list = split (' ', $prereqs);
   for my $prereq (@prereq_list) {
      if (defined $targets {$prereq}) {
         $retval = 0;
         my $curpos = tell $file;
         seek $file, 0, 0;
         point_target ($prereq);
         execute_target ($prereq);
         seek $file, $curpos, 0;
      }
   }
   return $retval;
}


#need_commands
#returns true if commands need to be executed
#false otherwise
#determines this using stat and checking file times
sub need_commands {
   my $prereqs = shift;
   my @prereq_list = split (' ', $prereqs);
   #my @prereq_list = shift;
   my $target = shift;
   my $most_rec = 0;
   for my $prereq (@prereq_list) {
      if (defined $targets {$prereq}) { execute_target ($prereq); }
      else {
         my @stat = stat $prereq;
         if (not @stat) {
            print STDERR "File: ", $prereq, " not found\n";
            exit 1;
         }
         elsif ($stat[9] > $most_rec) { $most_rec = $stat[9]; }
      }
   }
   if (not defined ($target_times {$target})) {
      $target_times {$target} = $most_rec;
      return 1;
   }
   elsif ($target_times {$target} >= $most_rec) { return 0; } 
   else { return 1; }
}

sub point_target {
   my $target = shift;
   while (defined (my $line = <$file>)) {
      chomp $line;
      if ($line =~ /$target.*:/) { return; }
   }
   print STDERR "Target: ", $target, " not found\n";
   exit 1;
}

#execute_commands
#performs commands associated with a target
#file pointer already at target
sub execute_commands {
   my $target = shift;
   my $prereqs = shift;
   while (defined (my $line = <$file>)) {
      chomp $line;
      if ($line =~ /\t-/) {
         my $throw_away;
         ($throw_away, $line) = split (/\t-/, $line, 2);
         $line = get_prereq ($line, $target, 0);
         printf "%s\n", $line;
         system $line;
      }
      elsif ($line =~ '\t') {
         my $throw_away;
         ($throw_away, $line) = split ('\t', $line, 2);
         $line = get_prereq ($line, $target, 0);
         printf "%s\n", $line;
         system $line;
      }
      else { return; } #arriving here twice
   }
}

#execute_target
#will execute the commands for a target
sub execute_target {
   my $target = shift;
   my $prereqs;
   if (not defined ($targets {$target})) {
      print STDERR "target: ", $target, " not found\n";
      return;
   }
   $prereqs = $targets {$target};
   if (check_prereqs ($prereqs, $target)) {
      $prereqs = get_prereq ($prereqs, $target, 1) if trim $prereqs;
   }
   #my @prereq_list = split (' ', $prereqs);
   if (not $prereqs or need_commands ($prereqs, $target)) {
      execute_commands ($target, $prereqs);
   }
}

# --------------------------------------------------------------------
# Script
# --------------------------------------------------------------------

if ($opts{'d'}) { exit $status; }

if ($opts{'f'}) { 
   open $file, "<$ARGV[0]" or warn "$ARGV[0]: $1\n" and next; 
}
else { open $file, "<Makefile" or warn "Makefile: $1\n" and next; }

for my $target (@ARGV) {
   if (not $opts{'f'}) { push @target_list, $target; }
   else { if ($target ne $ARGV[0]) { push @target_list, $target; }}
}

#first pass over file
while (defined (my $line = <$file>)) { 
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
      hash_target ($target, $prereqs);
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
         if ($line =~ /$target *:/) { #incorrect?
            execute_target ($target); 
            last; 
         }
      }
   }
}
   


