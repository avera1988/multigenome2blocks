#!/usr/bin/perl -w
################################################################################################################
#This software merged all sequences from alignment after using maftt
#The sequences need to be concatenated i.e. cat *.fa > allseqs.fa
#Then use script
#Author Arturo Vera
#################################################################################################################


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
