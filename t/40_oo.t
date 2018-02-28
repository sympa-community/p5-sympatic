BEGIN {
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

};

use Test::More;

my $p = eval
    'Person->new
    ( lastname  => "Doe" )';

map { is Person => $_, "\$p is a ref to Person ($_)"
        or note "$@ while calling the constructor" } ref $p;

is $p->lastname , 'Doe'  , '->lastname  from constructor';

ok +( not defined $p->firstname ) =>
   q( not defined $p->firstname ) ;

eval q( $p->firstname //= 'John' );
is $p->firstname, 'John' , '->firstname from //=';
eval q( $p->firstname //= 'Peter' );
is $p->firstname, 'John' , '->firstname existed';
eval q( $p->age = 42 );
is $p->age, 42 , '->age = 42';
eval q( $p->age++ );
is $p->age, 43 , '->age = 43';


done_testing;
