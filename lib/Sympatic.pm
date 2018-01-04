package Sympatic;
use strict;
use warnings;
our $VERSION = '0.201801';
use Import::Into;
use Function::Parameters;
use Types::Standard;
use v5.14;

fun import ($dest=caller) {
    Moo->import::into($dest);
    feature->import::into($dest,qw(say));
    strict->import::into($dest);
    warnings->import::into($dest);
    Import::Into->import::into($dest);
    Function::Parameters->import::into($dest);
    Types::Standard->import::into($dest);
}

1;

=head1 Synopsis

Take a well crafted POD as example to this one

    cpanm .
    RELEASE_TESTING=1 prove -Ilib t


=head1 Sympa and CPAN

=head2 use CPAN

why is it so important to

    * not revent the wheel
    * share experiences and ideas with others
    * reduce the cost of infrastructure maintainance, performance, quality,
      documenation, ...

=head2 the CPAN modules we rely on

Moo, Dancer, F::P, T::S, P::T ...

=head2 contribute to CPAN

Instead of reinventing the wheel

=head1 Sympa Coding Style

TODO: reach every notes Eiro took from the Hackathon and explain them here

=head1 Todo

Those are things we're working on

=cut




