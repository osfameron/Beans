use inc::Module::Install;

name     'Beans';
all_from 'lib/Beans.pm';
author   q{osfameron <osfameron@cpan.org>};
license  'perl';

build_requires 'Test::More';

requires 'Moose';
requires 'MooseX::Types';
requires 'MooseX::Types::DateTimeX';
requires 'MooseX::Types::Moose';
requires 'MooseX::Types::Set::Object';

auto_install;

WriteAll;

