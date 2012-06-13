package Plack::Middleware::Try;

use 5.006;
use strict;
use warnings;

use parent qw(Plack::Middleware);
use Try::Tiny qw(try);
use Plack::Util::Accessor qw(catch finally);

our $VERSION = '0.01';

sub call {
    my ($self, $env) = @_;

    try {
        $self->app->($env);
    }
    Try::Tiny::catch {
        my $res = $self->catch->(@_);
        $self->finally->(@_) if $self->finally;

        local $SIG{__DIE__} = 'DEFAULT';

        return $res || die @_;
    };
}

1;

__END__

=head1 NAME

Plack::Middleware::Try - Handle dying an application.

=head1 SYNOPSIS

 enable 'Try',
     catch => sub {
         if ($_[0] =~ /Query execution was interrupted/) {
             return [ 503, [ "Content-Type", "text/plain" ], ["Service Temporarily Unavailable"] ];
         }
     },
     finally => sub {
         warn $_;
     };

=head1 DESCRIPTION

Generally, when an application dies unexpectedly, it should return 500 Internal Server Error. But some cases like DB execution timeout which doesn't always fail, it could return 503 Service Temporarily Unavailable.

=head1 AUTHOR

Eitarow Fukamachi, C<< <e.arrows at gmail.com> >>

=head1 LICENSE AND COPYRIGHT

Copyright 2012 Eitarow Fukamachi.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut
