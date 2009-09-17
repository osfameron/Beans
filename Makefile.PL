use inc::Module::Install;

name     'Beans';
all_from 'lib/Beans.pm';
author   q{osfameron <osfameron@cpan.org>};
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;

