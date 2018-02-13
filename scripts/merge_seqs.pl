#!/usr/bin/perl -w
####################################################################################################3
#This software merged all sequences froma concatenated after clustal alig
#The sequences need to be concatenated i.e. cat *.fa > allseqs.fa
#Then use script
##############################################################################################################3333

use strict;
use Bio::SeqIO;

my %seqs; # a hash to hold the results
my $file = shift or die("Usage = merge_seqs.pl <fasta file>\n");
my $seqio = Bio::SeqIO->new(-file => $file, -format => "fasta");

while(my $seq = $seqio->next_seq) { 
  $seqs{$seq->display_id." ".$seq->description} .= $seq->seq;
}
# now print
foreach my $key (keys %seqs) { 
  print ">$key\n$seqs{$key}\n";
}
