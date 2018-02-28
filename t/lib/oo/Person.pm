package Person;
use Types::Standard qw( Str );
use Sympatic -oo;

has [qw( firstname lastname )] =>
    ( is       => 'rw'
    , isa      => Str
    , lvalue   => 1);

has age =>
    ( is       => 'rw'
    , lvalue   => 1 );

1;
