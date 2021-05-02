#!/usr/bin/perl

use Bio::SeqIO;
use Bio::Tools::Run::StandAloneBlastPlus;
use Bio::Tools::Run::RemoteBlast;
my $prog = 'blastp';
my $db   = 'swissprot';
my $e_val= '1e-10';
 
@remote_params = ( '-prog' => $prog,
       '-data' => $db,
       '-expect' => $e_val,
       '-readmethod' => 'SearchIO' );
 
$remote_factory = Bio::Tools::Run::RemoteBlast->new(@remote_params);

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
    # Local DB
    $outputFileName = substr($fastaInputFileName, 0, index($fastaInputFileName, '.'));
    $local_factory->blastp( -query => "../Ejercicio-1/$fastaInputFileName", -outfile => "$outputFileName-blast.out");
    # Remote DB
    $v = 1; 
    my $str = Bio::SeqIO->new(-file=>"../Ejercicio-1/$fastaInputFileName" , -format => 'fasta' );
    while (my $input = $str->next_seq()){
        #Blast a sequence against a database:
        my $r = $remote_factory->submit_blast($input);
        print STDERR "waiting..." if( $v > 0 );
        while ( my @rids = $remote_factory->each_rid ) {
            foreach my $rid ( @rids ) {
                my $rc = $remote_factory->retrieve_blast($rid);
                if( !ref($rc) ) {
                    if( $rc < 0 ) {
                        $remote_factory->remove_rid($rid);
                    }
                    print STDERR "." if ( $v > 0 );
                } else {
                    my $result = $rc->next_result();
                    #save the output
                    my $outputRemoteFilename = "$outputFileName-remote-blast.out";
                    $remote_factory->save_output($outputRemoteFilename);
                    $remote_factory->remove_rid($rid);
                    print "\nQuery Name: ", $result->query_name(), "\n";
                    while ( my $hit = $result->next_hit ) {
                        next unless ( $v > 0);
                        print "\thit name is ", $hit->name, "\n";
                        while( my $hsp = $hit->next_hsp ) {
                            print "\t\tscore is ", $hsp->score, "\n";
                        }
                    }
                }
            }
        }
    }

}
