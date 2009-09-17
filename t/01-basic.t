#!perl -T

use Test::More tests => 5;

BEGIN {
    use_ok( 'Beans::Item' );
}

diag( "Testing Beans $Beans::VERSION, Perl $], $^X" );

my $item = Beans::Item->new(
    name     => 'Mortgage',
    value    => 500.00,
    due_date => '2009-10-01',
    comment  => 'Home sweet home',
    );

ok $item, 'Object created successfully';

is $item->name,  'Mortgage';
is $item->value, 500;
is $item->due_date->month, 10;
