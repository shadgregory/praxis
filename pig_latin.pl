#
# Your task is to write functions that translate English to Pig Latin and Pig
# Latin to English.
#

#/usr/bin/env perl

use 5.018;
use Test::More tests => 8;

sub starts_digraph {
    my $word = shift;
    if (   $word =~ m/^ch.*/
        || $word =~ m/^th.*/
        || $word =~ m/^sh.*/
        || $word =~ m/^zh.*/
        || $word =~ m/^st.*/ )
    {
        return 1;
    }
    return 0;
}

sub piglatin {
    my $word = shift;
    if ( $word =~ m/^.*-way$/ ) {
        $word =~ s/(^.*)-way$/$1/;
        return $word;
    }
    elsif ( $word =~ m/^.*-.*ay$/ ) {
        $word = substr( $word, 0, length($word) - 2 );
        my @a = split( '-', $word );
        return $a[1] . $a[0];
    }
    elsif ( $word =~ m/^[AEIOUaeiou]/ ) {
        return $word . "-way";
    }
    elsif ( &starts_digraph($word) ) {
        my $begin = substr( $word, 0, 2 );
        return substr( $word, 2, length($word) ) . "-$begin" . "ay";
    }
    else {
        my $first_char = substr( $word, 0, 1 );
        return substr( $word, 1, length($word) ) . "-$first_char" . "ay";
    }
}

ok( "art-way"   eq piglatin("art") );
ok( "eagle-way" eq piglatin("eagle") );
ok( "oor-day"   eq piglatin("door") );
ok( "art-stay"  eq piglatin("start") );
ok( "start"     eq piglatin("art-stay") );
ok( "door"      eq piglatin("oor-day") );
ok( "art"       eq piglatin("art-way") );
ok( "eagle"     eq piglatin("eagle-way") );
