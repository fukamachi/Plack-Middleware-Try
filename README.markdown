# Plack::Middleware::Try

## SYNOPSIS

```perl
enable 'Try',
    catch => sub {
        if ($_[0] =~ /Query execution was interrupted/) {
            return [ 503, [ "Content-Type", "text/plain" ], ["Service Temporarily Unavailable"] ];
        }
    },
    finally => sub {
        warn $_;
    };
```

## DESCRIPTION

Plack::Middleware::Try is a Plack Middleware for handling exceptions thrown by an application.

For example, when an application dies unexpectedly, it should return 500 Internal Server Error generally. But some cases like DB execution timeout which doesn't always fail, it could return 503 Service Temporarily Unavailable.

## AUTHOR

Eitarow Fukamachi (e.arrows@gmail.com)

## INSTALLATION

To install this module, run the following commands:

	perl Makefile.PL
	make
	make test
	make install

## LICENSE AND COPYRIGHT

Copyright (C) 2012 Eitarow Fukamachi

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.
