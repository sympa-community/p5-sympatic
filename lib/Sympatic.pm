=pod

    Sympatic

    Copyright (C) 2017,2018 GIP Renater

    Sympatic is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License as
    published by the Free Software Foundation; either version 2 of the
    License, or (at your option) any later version.

    Sympatic is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, see <http://www.gnu.org/licenses/>.

    Authors:
    Marc Chantreux <marc.chantreux@renater.fr>
    David Verdin   <david.verdin@renater.fr>
    Stephan Hornburg <racke@linuxia.de>

=cut




package Sympatic;
our $VERSION = '0.2_01';
use strict;
use warnings;
require Import::Into;

sub import {

    my $to = caller;
    my %feature = qw<
        unicode .
        oo      .
        path    .
    >;

    English->import::into($to, qw<  -no_match_vars >);
    feature->import::into($to, qw< say state >);
    strict->import::into($to);
    warnings->import::into($to);
    Function::Parameters->import::into($to);

    shift; # 'Sympatic', the package name

    while (@_) {

        # disable default features
        if ( $_[0] =~
            /- (?<feature>
                oo
                | unicode
                | path ) /x
        ) {
            delete $feature{ $+{feature} };
            shift;
            next;
        }

        ...

    }

    $feature{path} and do {
        Path::Tiny->import::into($to);
    };

    $feature{oo} and do {

        Moo->import::into($to);
        MooX::LvalueAttribute->import::into($to);

    };

    # those was debated and refused

    # $feature{utf8all} and do {
    #      utf8::all->import::into($to);
    # }

    $feature{unicode} and do {
        utf8->import::into($to);
        feature->import::into($to, qw< unicode_strings >);
        # those aren't clearly defined
        # open->import::into($to,qw< :UTF-8 :std >);
    }

    # see https://github.com/pjf/autodie/commit/6ff9ff2b463af3083a02a7b5a2d727b8a224b970
    # TODO: is there a case when caller > 1 ?

    # $feature{autodie} and do {
    #      autodie->import::into(1);
    # }

}

1;
