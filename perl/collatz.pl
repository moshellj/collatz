#!/usr/bin/perl

use warnings;
use strict;
use Data::Dumper;

# The version of Perl installed on Cobra uses 8-byte integers.
# setup
my $length = 0;
my $tenth = 0;
my $i = 0;
# Perl 2d arrays are arrays of array references.
# the syntax for dealing with them is inconvenient.
my @biggest = ();
for(my $i = 0; $i < 10; $i++){
	my @temp = (0, 0);
	$biggest[$i] = \@temp;
}

# calculations
for (my $n = 2; $n <= 1000000; $n++){
	$i = $n;
	$length = 0;
	#math
	while ($i > 1){
		if($i % 2){
			$i = 3*$i+1;
		}else{
			$i = $i >> 1;
		}
		$length++;
	}
	#longest elements tracking
	if($length > $tenth){
		my @newentry = ($n, $length);
		$biggest[0] = \@newentry;
		# Perl's standard sort supports inline custom comparison functions.
		@biggest = sort { $a->[1] <=> $b->[1] } @biggest;
		$tenth = ${$biggest[0]}[1];
	}
}

# display
print "Largest Elements:\n\n";
print "By length:\n";
for(my $i = 0; $i < 10; $i++){
	print "Number = ${$biggest[$i]}[0], Length = ${$biggest[$i]}[1]\n";
}
@biggest = sort { $a->[0] <=> $b->[0] } @biggest;
print "\nBy size:\n";
for(my $i = 0; $i < 10; $i++){
	print "Number = ${$biggest[$i]}[0], Length = ${$biggest[$i]}[1]\n";
}

