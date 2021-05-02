#!/usr/bin/perl

use Bio::SeqIO;
use Bio::Tools::Run::StandAloneBlastPlus;

# blast against remote database
$remote_factory = Bio::Tools::Run::StandAloneBlastPlus->new(
    -db_name => 'nr',
    -remote => 1
);

# blast against local database
$local_factory = Bio::Tools::Run::StandAloneBlastPlus->new(
    -db_name => 'swissprot',
    -db_dir => './db'
);

@fasta_files = (
    '0.fasta',
    '0-rev.fasta',
    '1.fasta',
    '1-rev.fasta',
    '2.fasta',
    '2-rev.fasta'
);

foreach (@fasta_files) {
    $fastaInputFileName = $_;
    $outputFileName = substr($fastaInputFileName, 0, index($fastaInputFileName, '.'));
    $local_factory->blastp( -query => "../Ejercicio-1/$fastaInputFileName", -outfile => "$outputFileName-blast.out");
    $remote_factory->blastp( -query => "../Ejercicio-1/$fastaInputFileName", -outfile => "$outputFileName-remote-blast.out");
}
