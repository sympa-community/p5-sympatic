package Sympatic;
our $VERSION = '0.1';
use strict;
use warnings;
require Import::Into;

sub import {
    my $to = caller;

    English->import::into($to, qw<  -no_match_vars >);
    feature->import::into($to, qw< say state unicode_strings >);
    strict->import::into($to);
    warnings->import::into($to);
    Function::Parameters->import::into($to);
    utf8::all->import::into($to);

    # remove things for args until there is no more argument
    shift; # 'Sympatic', the package name

    while (@_) {

        if ($_[0] eq '-oo') {
                shift;
                Moo->import::into($to);
                MooX::LvalueAttribute->import::into($to);
        }
        else {
            die "invalid argument remains: "
            . join "\n", @_;
        }

    }

}

1;
