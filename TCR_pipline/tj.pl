#!/usr/bin/perl -w
use strict;
open(IN,"<",$ARGV[0]);
my %hash1;
my @varr;
my @jarr;
while(<IN>){
	chomp;
	next if(/^cloneId/);
	next if(/^$/);
	my (undef,$count,undef,$bestVHit,undef,$bestJHit,undef)=split /\t/,$_;
	$bestVHit=(split /\*/,$bestVHit)[0];
	$bestJHit=(split /\*/,$bestJHit)[0];
	push @varr,$bestVHit;
	push @jarr,$bestJHit;
#	$hash{$bestVHit}{$bestJHit}=$count;
}
for my $varr(@varr){
	for my $jarr(@jarr){
		$hash1{$varr}{$jarr}=0;
	}
}
open(IN,"<",$ARGV[1]);
while(<IN>){
        chomp;
        next if(/^cloneId/);
        next if(/^$/);
        my (undef,$count,undef,$bestVHit,undef,$bestJHit,undef)=split /\t/,$_;
        $bestVHit=(split /\*/,$bestVHit)[0];
        $bestJHit=(split /\*/,$bestJHit)[0];
	$hash1{$bestVHit}{$bestJHit}+=$count;
}




my $n=0;
for my $key(sort {$a cmp $b} keys %hash1){
	for my $key1(sort {$a cmp $b} keys %{$hash1{$key}}){
		if($n==0){print "\t",$key1;}
		else{next;}
	}
	$n++;
}
print "\n";
for my $key(sort {$a cmp $b} keys %hash1){
	print $key;
	for my $key1(sort {$a cmp $b} keys %{$hash1{$key}}){
		print "\t",$hash1{$key}{$key1};
	}
	print "\n";	
}
	
