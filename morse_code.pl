#
# write functions that convert back and forth between character strings and
# Morse code.
#

#/usr/bin/env perl
use 5.018;
use Test::More tests => 2;

my %morse_dict = (
    'A'     => '*-',
    'B'     => '-***',
    'C'     => '-*-*',
    'D'     => '-**',
    'E'     => '*',
    'F'     => '**-*',
    'G'     => '--*',
    'H'     => '****',
    'I'     => '**',
    'J'     => '*---',
    'L'     => '*-**',
    'M'     => '--',
    'N'     => '-*',
    'O'     => '---',
    'P'     => '*--*',
    'Q'     => '--*-',
    'R'     => '*-*',
    'S'     => '***',
    'T'     => '-',
    'U'     => '**-',
    'V'     => '***-',
    'W'     => '*--',
    'X'     => '-**-',
    'Y'     => '-*--',
    'Z'     => '--**',
    '0'     => '-----',
    '1'     => '*----',
    '2'     => '**---',
    '3'     => '***--',
    '4'     => '****-',
    '5'     => '*****',
    '6'     => '-****',
    '7'     => '--***',
    '8'     => '---**',
    '9'     => '----*',
    '*-'    => 'A',
    '-***'  => 'B',
    '-*-*'  => 'C',
    '-**'   => 'D',
    '*'     => 'E',
    '**-*'  => 'F',
    '--*'   => 'G',
    '****'  => 'H',
    '**'    => 'I',
    '*---'  => 'J',
    '*-**'  => 'L',
    '--'    => 'M',
    '-*'    => 'N',
    '---'   => 'O',
    '*--*'  => 'P',
    '--*-'  => 'Q',
    '*-*'   => 'R',
    '***'   => 'S',
    '-'     => 'T',
    '**-'   => 'U',
    '***-'  => 'V',
    '*--'   => 'W',
    '-**-'  => 'X',
    '-*--'  => 'Y',
    '--**'  => 'Z',
    '-----' => '0',
    '*----' => '1',
    '**---' => '2',
    '***--' => '3',
    '****-' => '4',
    '*****' => '5',
    '-****' => '6',
    '--***' => '7',
    '---**' => '8',
    '----*' => '9'
);

sub translate {
    my $morse_code        = shift;
    my @words             = split( '  ', $morse_code );
    my $translated_string = '';
    foreach my $word (@words) {
        my @letters = split( ' ', $word );
        foreach my $letter (@letters) {
            $translated_string .= $morse_dict{$letter};
        }
        $translated_string .= ' ';
    }
    $translated_string =~ s/ $//;
    return $translated_string;
}

ok( &translate("*** **** *- -**")             eq 'SHAD' );
ok( &translate("-*-* --- -- *  **** * *-* *") eq 'COME HERE' );
