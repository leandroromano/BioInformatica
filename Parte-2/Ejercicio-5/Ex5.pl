use Bio::Factory::EMBOSS;
use strict;
use warnings;
use Try::Tiny;

my $factory = new Bio::Factory::EMBOSS;
my $progEmboss = $factory->program('backtranseq');
my $input = shift;

try{
    $progEmboss->run({-sequence => $input,-outfile => "$input.emboss" });
    use Bio::AlignIO;
    my $alnin = Bio::AlignIO->new(-file => "$input.emboss", -format => 'emboss');
    print "DONE"
}
catch{
    warn "caught error: $_"
}
