#!/usr/bin/perl

use Bio::SeqIO;
use Bio::Tools::Run::StandAloneBlastPlus;

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
    $file_name = substr($_, 0, index($_, '.'));
    $local_factory->blastp( -query => "../Ejercicio-1/$_", -outfile => "$file_name-blast.out");
}

# blast against the remote NCBI db
#$remote_factory = Bio::Tools::Run::StandAloneBlastPlus->new(
#    -db_name => 'nr',
#    -remote  => 1
#);

#$remote_factory->blastn( -query => './out-0.fasta', -outfile => "0-blast-remote.out");
