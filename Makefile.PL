use strict;
use warnings;
use ExtUtils::MakeMaker;

# Normalize version strings like 6.30_02 to 6.3002,
# so that we can do numerical comparisons on it.
my $eumm_version = $ExtUtils::MakeMaker::VERSION;
$eumm_version =~ s/_//;

WriteMakefile
    ( NAME                => 'Sympatic'
    , AUTHOR              => q{the sympa community <sympa-developpers@lists.renater.fr>}
    , VERSION_FROM        => 'lib/Sympatic.pm'
    , ABSTRACT            => 'A more producive perl thanks to CPAN'
    , PL_FILES            => {}
    , clean               => { FILES => 'Petition-*' }
    , PREREQ_PM =>
        { 'Function::Parameters'  => '2.001003'
        , 'Types::Standard'       => '1.002001'
        , 'Import::Into'          => '1.002005'
        , 'Path::Tiny'            => '0.0104'
        # , 'utf8::all'             => '0.024'
        , 'MooX::LvalueAttribute' => '0.16'
        , 'Moo'                   => '2.002005'
        }
    , TEST_REQUIRES =>
        { 'Test::Simple'        => '1.302120'
        , 'Test::Kwalitee'      => '1.27'
        , 'Test::CheckManifest' => '0.9'
        , 'Test::Pod::Coverage' => '1.08'
        , 'Test::Pod'           => '1.22'
        }
    , dist  =>
        { COMPRESS => 'gzip -9f'
        , SUFFIX => 'gz'
        }
    , ( $eumm_version >= 6.3001
        ? ('LICENSE'=> 'perl')
        : ())
    );
