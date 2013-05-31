#
# Write a program that takes a filename and a parameter n and prints the n most 
# common words in the file, and the count of their occurrences, in descending order.
#

#/usr/bin/env perl
use 5.018;

sub common_words {
    my ($filename, $n) = @_;
    open(FILE, $filename) || die "$filename not found!";
    my @lines = <FILE>;
    close(FILE);
    my %words = ();
    foreach my $line (@lines) {
        $line =~ s/[.,-]/ /g;
        my @array = split(/\s+/, $line);
        map {$words{lc $_}++} @array;
    }
    my @sorted_words = sort { $words{$b} <=> $words{$a} } keys %words;
    for (my $i=0;$i<$n;$i++) {
        #say $sorted_words[$i] . " " . $words{$sorted_words[$i]};
        say sprintf("%5d %s", $words{$sorted_words[$i]}, $sorted_words[$i]);
    }
}

&common_words("gettysburg.txt", 25);
