use Test::More;
use Sympatic;

eval { open my $fh, '<', '/tZ' };
ok $@,"error caught";

my $cant = do {
    no autodie;
    not open my $fh, '<', '/tZ'
};

ok $cant, q(can't open but did not die );

eval { open my $fh, '<', '/tZ' };
ok $@, 'error system available again';

done_testing;
