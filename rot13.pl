# Write a function that takes a string and returns the ROT13 version of the string

#!/usr/bin/env perl

use 5.018;
use Test::More tests => 2;

sub rot13 {
  my $str = shift;
  my @array = split(//, $str);
  my $rot13_str = '';
  foreach my $c (@array) {
    my $val = ord($c);
    if (($val >= 65 && $val <= 90)){
      $val = $val - 13;
      $val = $val + 26 if $val < 65;
    }elsif ($val >= 97 && $val <= 122) {
      $val = $val - 13;
      $val = $val + 26 if $val < 97;
    }
    $rot13_str .= chr($val);
  }
  return $rot13_str;
}

ok(&rot13("The butler did it!") eq "Gur ohgyre qvq vg!");
ok(&rot13("Cebtenzzvat Cenkvf vf sha!") eq "Programming Praxis is fun!");
