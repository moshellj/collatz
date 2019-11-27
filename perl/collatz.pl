#!/usr/bin/perl

use warnings;
use strict;

# The version of Perl installed on Cobra uses 8-byte integers.
my $length = 0;
my $maxlength = 0;

for (my $n = 2; $n <= 1000000; $n++){
	my $i = $n;
	$length = 0;
	while ($i > 1){
		if($i % 2){
			$i = 3*$i+1;
		}else{
			$i = $i >> 1;
		}
		$length++;
	}
	if($length > $maxlength){
		print "$n -> $length\n";
		$maxlength = $length;
	}
}
