#!/usr/bin/perl -w
#This scritp puts the name of the genome and then the header for amphora

($file, $gene)=@ARGV;

open(ARCH,$file);

while(<ARCH>){
	chomp;
	if($_ =~ /^>/){
		@header=split(/\s+/);
		foreach($header[0]){
		@numero=split(/\>/);
		}
	}else{
	$seq=$_; 
	print ">$gene:$numero[1]\n$seq\n";
	}
}
