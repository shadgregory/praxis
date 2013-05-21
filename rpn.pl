#Implement an RPN calculator

#!/usr/bin/env perl
use 5.018;
use Test::More tests => 6;

sub rpn {
    my $expr   = shift;
    my @parsed = split( ' ', $expr );
    my @stack  = ();
    foreach my $atom (@parsed) {
        if ( $atom =~ m/^\d+$/ ) {
            push( @stack, $atom );
        }
        elsif ( $atom eq "+" ) {
            push( @stack, pop(@stack) + pop(@stack) );
        }
        elsif ( $atom eq "*" ) {
            push( @stack, pop(@stack) * pop(@stack) );
        }
        elsif ( $atom eq "/" ) {
            my $top = pop(@stack);
            push( @stack, pop(@stack) / $top );
        }
        else {
            my $top = pop(@stack);
            push( @stack, pop(@stack) - $top );
        }
    }
    return $stack[0];
}

ok( rpn("3 4 +") == 7 );
ok( rpn("3 4 -") == -1 );
ok( rpn("3 4 - 5 +") == 4 );
ok( rpn("3 5 + 7 2 – *") == 40 );
ok( rpn("8 4 /") == 2 );
ok( rpn("10 5 / 1 -") == 1 );
