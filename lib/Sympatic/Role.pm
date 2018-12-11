package Sympatic::Role;
require Sympatic;

sub import { Sympatic->import( to => (scalar caller), -class ); }

1;
