#!/usr/bin/perl

use Bio::SeqIO;
use Bio::Tools::Run::StandAloneBlastPlus;

$ENV{'BLASTPLUSDIR'} = '/home/german/Downloads/ncbi-blast-2.11.0+-src/c++/ReleaseMT/bin';

# blast against local database
# $local_factory = Bio::Tools::Run::StandAloneBlastPlus->new(
#    -db_name => 'swissprot', -db_dir => './db'
# );

$fasta_files = ('1.fasta', '1-rev.fasta', '2.fasta', '2-rev.fasta', '3.fasta', '3-rev.fasta');

# while (my $fasta_file = $fasta_files) {
#     $file_name = substr($fasta_file, 0, index($fasta_file, '.'));
    # $local_factory->blastn( -query => './out-0.fasta', -outfile => "0-blast.out");
# }

# blast against the remote NCBI db
$remote_factory = Bio::Tools::Run::StandAloneBlastPlus->new(
 -db_name => 'nr',
 -remote  => 1
);

$remote_factory->blastn( -query => './out-2.fasta', -outfile => "2-blast.out");

