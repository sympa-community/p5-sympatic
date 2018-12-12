# with no parameter, the script start the regular test suite
# with $1 not equal to '' or '0', start the whole test suite for CPAN releaes purpose


dzil authordeps|cpanm
rm LICENSE MANIFEST README Makefile.PL META.json META.yml 2>/dev/null
RELEASE_TESTING=${1:-} dzil test
