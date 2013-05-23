#
# Write a function that takes a single argument n and returns a list of prime 
# numbers less than or equal to n using the optimized sieving algorithm
#

#!/usr/bin/env perl

use 5.018;
use Test::More tests => 1;

sub sieve {
  my $n = shift;
  my $p = 2;
  my @tested = ();
  my @primes = ();
  my $tested_count = 0;
  while ($tested_count <= $n - 2) {
    say "p is $p";
    for (my $i=$p;$i<=$n;$i+=$p) {
      $tested[$i] = 1;
    }
    push @primes, $p;
    for(my $i=2;$i<=$n;$i++) {
      if (!$tested[$i]) {
        $p = $i;
        last;
      }
    }
    $tested_count = grep {$_ == 1} @tested;
  }
  return sort {$a <=> $b} @primes;
}

my @primes = &sieve(40);
is_deeply(\@primes, [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]);
