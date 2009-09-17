#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Beans' );
}

diag( "Testing Beans $Beans::VERSION, Perl $], $^X" );
