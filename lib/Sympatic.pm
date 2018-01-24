package Sympatic;
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
    utf8::all->import::into($to);

    # see https://github.com/pjf/autodie/commit/6ff9ff2b463af3083a02a7b5a2d727b8a224b970
    # TODO: is there a case when caller > 1 ?
    # example: use Sympatic as skel for Sympatic::oo;
    autodie->import::into(1);
}

1;

__END__

=head1 NAME

Sympatic - The boilerplate and documentation for the Sympa project Coding Style

=head1 USAGE

Every perl file of your project must start with

    use Sympatic;

=head1 CONTRIBUTE

you are welcome to discuss about the C<Sympatic> style on the Sympa project
developpers mailing list. If your proposal is accepted, edit the module the
way you describe, update the documentation and test the whole thing.

    cpanm --installdeps .
    RELEASE_TESTING=1 prove -Ilib t

=head1 Sympa and CPAN

Every line of code that is used in the Sympa project should be carrefully

The CPAN community reduce the cost of maintaining infrastructure code. And
by maintaining it, we mean it the great way: improve, optimize, document,
debug, test in a large number of perl bases, ...

We also want to benefit as much as possible from the experience, ideas and
knowledge of the CPAN members.

So if you want to contribute to Sympa, please concider picking a module on CPAN
that does the job and contributing to it if needed. Push your own stuff if
needed.

=head2 the CPAN modules we rely on

L<Moo|https://metacpan.org/pod/Moo> for POO,
L<Dancer2|https://metacpan.org/pod/Dancer2> for web developpement,
L<Template Toolkit|https://metacpan.org/pod/Template> for text templating,
L<Path::Tiny|https://metacpan.org/pod/Path::Tiny> for file handling.

We also use some helpers to make our code as maintainable as possible:

L<Type::Standard|https://metacpan.org/pod/Types::Standard>,
L<Function::Parameters|https://metacpan.org/pod/Function::Parameters>,
L<Curry|https://metacpan.org/pod/Curry>,
L<Perlude|https://metacpan.org/pod/Perlude>.

=head1 Sympa Coding Style

=head2 Object

=head1 AUTHORS

=head1 LICENSE AND COPYRIGHT

Copyright 2018 Sympa community <F<sympa-developpers@listes.renater.fr>>

This package is free software and is provided "as is" without express
or implied warranty.  It may be used, redistributed and/or modified
under the terms of the Perl Artistic License subee
(http://www.perl.com/perl/misc/Artistic.html)

=cut
