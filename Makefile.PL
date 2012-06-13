use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Plack::Middleware::Try',
    AUTHOR              => q{Eitarow Fukamachi <e.arrows@gmail.com>},
    VERSION_FROM        => 'lib/Plack/Middleware/Try.pm',
    ABSTRACT_FROM       => 'lib/Plack/Middleware/Try.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Plack-Middleware-Try-*' },
);
