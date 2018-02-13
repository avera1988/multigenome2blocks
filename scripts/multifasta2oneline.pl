#!/usr/bin/perl -w

use strict;
my $flag = 0;

while (<>) {
	#print; <STDIN>;
	chomp;
	if (/^>/) {
		if ($flag) {
			print "\n";
			$flag = 0;
		}
		my $id = $_; 
		print "$id\n";
		$flag = 1;
		next;
	}
	tr/a-z/A-Z/;
	print;
}

