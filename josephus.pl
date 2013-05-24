#
# Write a function josephus(n,m) that returns a list of n people, numbered from
# 0 to n-1, in the order in which they are executed, every mth person in turn,
# with the sole survivor as the last person in the list.
#

#!/usr/bin/env perl

use 5.018;
use Test::More tests => 1;

sub next_victim {
  my @array = @_;
  my $count = 0;
  return sub {
    $count = 0 if ($count == @array);
    my $val = $array[$count];
    $count++;
    return $val;
  }
}

sub josephus {
  my ($num, $m) = @_;
  my @survivors = (0 .. $num -1);
  my @murders = ();
  my $next = &next_victim(@survivors);
  my $c = 0;
  while (@murders < $num) {
    my $val = $next->();
    if ( grep( /^$val$/, @murders ) ) {
      next;
    }
    if ($c == $m - 1) {
      push @murders, $val;
      $c = 0;
    }else {
      $c++;
    }
  }
  return @murders;
}

my @murder_order = &josephus(41,3);
say "order : @murder_order";
is_deeply(\@murder_order, [2, 5, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35, 38, 0, 4, 9, 13, 18, 22, 27, 31, 36, 40, 6, 12, 19, 25, 33, 39, 7, 16, 28, 37, 10, 24, 1, 21, 3, 34, 15, 30]);
