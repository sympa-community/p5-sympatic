=pod

    Sympatic

    Copyright (C) 2017,2018 Sympa Community

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

=cut

package Sympatic;
our $VERSION = '0.1_01';
use strict;
use warnings;
require Import::Into;

sub import {

    my $to = caller;
    my %feature = qw<
        utf8all .
        utf8    .
        utf8io  .
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
            utf8all |
            utf8    |
            utf8io  |
            oo      |
            path    )/x
        ) {
            delete $feature{ $+{feature} };
            shift;
            next;
        }

        ...

    }

    $feature{path} and do { Path::Tiny->import::into($to) };
    $feature{oo} and do {
        Moo->import::into($to);
        MooX::LvalueAttribute->import::into($to);
    };

    $feature{utf8all} and do {
         utf8::all->import::into($to);
         delete $feature{$_} for qw<  utf8 utf8io >;
    };

    $feature{utf8} and do {
        utf8->import::into($to);
        feature->import::into($to, qw< unicode_strings >);
    };

    $feature{utf8io} and do { 'open'->import::into($to,qw< :UTF-8 :std >) };

    # see https://github.com/pjf/autodie/commit/6ff9ff2b463af3083a02a7b5a2d727b8a224b970
    # TODO: is there a case when caller > 1 ?

    # $feature{autodie} and do {
    #      autodie->import::into(1);
    # }

}

1;
