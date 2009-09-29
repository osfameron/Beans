#!perl

use Test::More tests => 12;
use Data::Dumper;

BEGIN {
    use_ok( 'Beans::Item' );
}

diag( "Testing Beans $Beans::VERSION, Perl $], $^X" );

my $item = Beans::Item->new(
    name     => 'Mortgage',
    value    => 500.00,
    due_date => '2009-10-01',
    comment  => 'Home sweet home',
    tags     => [qw/ mortgage foo bar /],
    );

ok $item, 'Object created successfully';

is $item->name,  'Mortgage',      'Name ok';
is $item->value, 500,             'Value ok';
is $item->due_date->month, 10,    'Date ok';

is_deeply [ sort $item->tags], 
    [qw/ bar foo mortgage /],     'Tags ok'
        or diag Dumper($item->tags);

ok $item->has_tag('foo'),         'Has tag foo';
ok $item->has_tag('bar'),         'Has tag bar';
ok $item->has_tag('mortgage'),    'Has tag mortgage';
ok ! $item->has_tag('baz'),       'Nonexistant tag baz';
$item->add_tag('baz');
ok $item->has_tag('baz'),         'Now has baz';
$item->remove_tag('foo');
ok ! $item->has_tag('foo'),       'Now lost tag foo';
