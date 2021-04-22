#!/usr/bin/perl

# Example 10 - 1 Extract annotation and sequence from GenBank file
use strict;
use warnings;
use lib "./modules";
use BeginPerlBioinfo;
# see Chapter 6 about this module
my @annotation = ();
my $sequence = '';
my $filename = 'sequence.gb';
parse1(\@annotation, \$sequence, $filename);
# Print the annotation, and then print the DNA in new format just to check if we got it okay.
print @annotation;
print_sequence($sequence, 50);
exit;
# Subroutine
# parse1
# - parse annotation and sequence from GenBank record
sub parse1 {

  # $annotation - reference to array
  # $dna - reference to scalar
  # $filename - scalar
  my($annotation, $dna, $filename) = @_;
  my $in_sequence = 0;
  # Get the GenBank data into an array from a file
  my @GenBankFile = ();
  # Extract all the sequence lines
  @GenBankFile = get_file_data($filename);
  foreach my $line(@GenBankFile) {
    if ($line =~ /^\/\/\n/) {
      # If $line is end - of -record line //\n break out of the foreach loop.
      last;
    }
    elsif($in_sequence) {
      # If we know we 're in a sequence, add the current line to $$dna.
      $$dna .= $line;
    }
    elsif($line =~ /^ORIGIN/) {
      # If $line begins a sequence, set the $in_sequence flag.
      $in_sequence = 1;
    } else {
      # Otherwise add the current line to @annotation.
      push(@$annotation, $line);
    }
  }
  # remove whitespace and line numbers from DNA sequence
  $$dna =~ s/[\s0-9]//g;
}