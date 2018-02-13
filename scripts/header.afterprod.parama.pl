#!/usr/bin/perl -w
#
while(<>){
	chomp; 
	if($_ =~ /^>/){
		@header=split(/\s+/);
		foreach($header[0]){
			@node=split(/\_/);
		}
		foreach($header[8]){
			@id=split(/\;/);
		}
		foreach($id[0]){
		@gene=split(/\=/);

		}

	}else{
	$seq=$_;

	print ">$gene[1]\n$seq\n";
	}
}
