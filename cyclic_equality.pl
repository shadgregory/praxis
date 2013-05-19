#
#Your task is to write a function that takes two cyclic lists and determines if they are equal.
#

#!/usr/bin/env perl
use 5.018;
use Array::Compare;
use Test::More tests => 6;

#return a list of possible cycles
sub cycles {
  my $list = shift;
  my @cycles = ();
  my $count = 1;
  push(@cycles ,$list);
  for (my $i=1;$i<@{$list};$i++) {
      my $len = @{$list};
      my @front = @{$list}[$i..$len-1];
      my @back = @{$list}[0..$i-1];
      my @new_array = (@front,@back);
      push(@cycles, \@new_array);
  }
  return @cycles;
}

sub cyclic_equality {
  my ($list1, $list2) = @_;
  my $equal = 0;
  my @cycles1 = &cycles($list1);
  my @cycles2 = &cycles($list2);
  my $return_value = 0;
  my $comp1 = Array::Compare->new;
  if (@{$list1} != @{$list2}) {
    return 0;
  } else {
    foreach my $l1 (@cycles1) {
      foreach my $l2 (@cycles2) {
        if ($comp1->compare($l1, $l2)) {
          $return_value = 1;
        }
      }
    }
  }
  return $return_value;
}

my @array1 = (1,2,3,4,5);
my @array2 = (3,4,5,1,2);
ok(&cyclic_equality(\@array1, \@array2) == 1);
my @array3 = (1,1,1,1,1);
my @array4 = (1,1,1,1,1);
ok(&cyclic_equality(\@array3, \@array4) == 1);
my @array5 = (1,1,1);
my @array6 = (1,1,1,1);
ok(&cyclic_equality(\@array5, \@array6) == 0);
my @array7 = (1,2,3,4);
my @array8 = (1,2,3,5);
ok(&cyclic_equality(\@array7, \@array8) == 0);
my @array9 = (1,1,1,1);
my @array10 = (1,1,1,2);
ok(&cyclic_equality(\@array9, \@array10) == 0);
my @array11 = (1,2,3,4);
my @array12 = (4,1,2,3);
ok(&cyclic_equality(\@array11, \@array12) == 1);
