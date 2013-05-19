#/usr/bin/env perl
use 5.018;
use Test::More tests => 7;

#
# Write a function that takes an input list and an interval n and returns a new
# list with all the elements of the original list, in order, except that every
# nth item has been removed. For instance, given the input list
# (1 2 3 4 5 6 7 8 9 10) and n = 4, the function should return the list
# (1 2 3 5 6 7 9 10).
#

sub remove_nth {
    my ( $array, $n ) = @_;
    my @new_list = ();
    for ( my $i = 0; $i < @{$array}; $i++ ) {
        next if ( ( ( $i + 1 ) % $n ) == 0 );
        push( @new_list, $array->[$i] );
    }
    return @new_list;
}

my @a = ( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 );
my @r = ( 1, 2, 3, 5, 6, 7, 9, 10 );
my @test = &remove_nth( \@a, 4 );
is_deeply( \@r, \@test );

#
# Write a function that takes an input list and returns a new list with all the
# elements of the original list, in order, except that in the case of duplicate
# elements all of the duplicates except the first has been removed. For instance,
# all of the following lists should be transformed into the list (1 2 3 4 5):
# (1 2 3 4 5), (1 1 2 3 4 5), (1 2 1 3 1 4 1 5 1), and (1 2 2 3 3 3 4 4 4 4 5 5 5 5 5).
#

sub remove_dups {
    my $array = shift;
    return sort { $a <=> $b } keys %{ { map { $_ => 1 } @{$array} } };
}

my @result = ( 1, 2, 3, 4, 5 );
my @a1     = ( 1, 2, 3, 4, 5 );
my @r1     = &remove_dups( \@a1 );
my @a2     = ( 1, 1, 2, 3, 4, 5 );
my @r2 = &remove_dups( \@a2 );
my @a3 = ( 1, 2, 3, 4, 5, 5 );
my @r3 = &remove_dups( \@a3 );
my @a4 = ( 1, 2, 1, 3, 1, 4, 1, 5, 1 );
my @r4 = &remove_dups( \@a4 );
my @a5 = ( 1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5 );
my @r5 = &remove_dups( \@a5 );
is_deeply( \@r1, \@result );
is_deeply( \@r2, \@result );
is_deeply( \@r3, \@result );
is_deeply( \@r4, \@result );
is_deeply( \@r5, \@result );

#
# Write a function that takes an input list and splits the list in half; for
# instance, given the input list (1 2 3 4 5) the two outputs are the lists (1 2)
# and (3 4 5). If the list has odd length the middle element can be placed in
# either half, at your option, so the lists (1 2 3) and (4 5) are an alternate
# acceptable solution for the example problem.
#
use POSIX;
use Data::Dumper;

sub split_array {
    my $array        = shift;
    my $len          = @{$array} - 1;
    my $halfway      = floor( @{$array} / 2 );
    my @return_array = ();
    my @first        = @{$array}[ 0 .. $halfway - 1 ];
    push( @return_array, \@first );
    my @last = @{$array}[ $halfway .. $len ];
    push( @return_array, \@last );
    return @return_array;
}

my @r1 = ();
$r1[0] = [ 1, 2, 3 ];
$r1[1] = [ 4, 5, 6 ];
my @a1 = &split_array( [ 1, 2, 3, 4, 5, 6 ] );
is_deeply( \@a1, \@r1 );
