#!/usr/bin/env perl

use 5.018;
use Test::More tests => 7;
use List::Util qw(reduce max);

# reverse a string

sub reverse_string {
  my $string = shift;
  my @array = split(//, $string);
  my @a = ();
  foreach my $c (@array) {
    unshift (@a, $c);
  }
  return join('', @a);
}

ok(&reverse_string("Madam, I'm Adam") eq "madA m'I ,madaM");

#find nth fibonacci number

sub fib {
  my $n = shift;
  sub sub_fib {
     my ($current, $next, $n) = @_;
     if ($n == 0) {
       return $current;
     } else {
       return &sub_fib($next, ($current + $next), ($n - 1));
     }
   }
  sub_fib(0,1,$n);
}

ok(&fib(2) == 1);
ok(&fib(4) == 3);
ok(&fib(5) == 5);
ok(&fib(6) == 8);
ok(&fib(7) == 13);

# Print out the grade-school multiplication table up to 12x12

sub mult_table {
  for (my $i=1;$i<=12;$i++) {
    for (my $j=1;$j<=12;$j++) {
      print sprintf("%4d", $i*$j);
    }
    print "\n";
  }
}

&mult_table;

# Write a function that sums up integers from a text file, one per line.

sub sum_ints {
  my $sum = 0;
  open(FILE, "integers.txt");
  my @lines = <FILE>;
  close(FILE);
  return reduce { $a + $b } @lines;
}

say &sum_ints;

# Write a function to print the odd numbers from 1 to 99.

sub print_odd {
  for (my $i=1;$i<=99;$i++) {
    if ($i % 2 == 1) {
      print sprintf("%3d", $i);
    }
    if ($i % 10 == 0) {
      print "\n";
    }
  }
}

&print_odd;

# Find the largest int value in an int array.

my @int_array = (1,4,7,12,6,299,25);
say "largest int : " . max(@int_array);

#Format an RGB value (three 1-byte numbers) as a 6-digit hexadecimal string.

sub formatRGB {
  my ($r,$g,$b) = @_;
  return sprintf("%02x%02x%02x",$r,$g,$b);
}

ok(&formatRGB(255,0,128) eq 'ff0080');
