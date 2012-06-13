#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Plack::Middleware::Try' ) || print "Bail out!\n";
}

diag( "Testing Plack::Middleware::Try $Plack::Middleware::Try::VERSION, Perl $], $^X" );
