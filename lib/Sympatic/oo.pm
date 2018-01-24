package Sympatic::oo;

# WARNING: it's a shame!
# i didn't have time to figure out how to reuse Sympatic + Moo
# so this is just a copy paste of Sympatic. please don't diverge!

our $VERSION = '0.0';
use v5.14;
use strict;
use warnings;
require Import::Into;

sub import {
    my $to = caller;
    English->import::into($to, qw<  -no_match_vars >);
    feature->import::into($to,qw< say >);
    strict->import::into($to);
    warnings->import::into($to);
    Function::Parameters->import::into($to);
    autodie->import::into(1);
    utf8::all->import::into($to);
    Moo->import::into($to);
    MooX::LvalueAttribute->import::into($to);

}

1;


