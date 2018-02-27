# todo

* even cpanm -t installs Test::Kwalitee. is there a way to remove that
* grep -RF TODO: lib t # and happy hacking
* doc: find the link to PBP
* use 5.14 (to avoid the use of older interpreters) without given

# open questions

## Makefile.PL

    * Module::install used by PEP
    * both Moo and Dancer2 uses ExtUtils::MakeMaker
    * i pick one without knowledge about the differences

any idea on it ?

## To Moo qw() or to Moo =>

while declaring the attributes, i get the habit to
always declare 'required' and 'is' in a qw()

    has qw( owner is rw required 1 )
    , isa => Str;

instead of the more classic

    has owner  =>
    , is       => 'rw'
    , required => 1
    , isa      => Str;

David complained on it as it scares the newbies.
I'm not sure about it. Any thought to share ?



