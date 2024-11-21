#!/usr/bin/perl -w
use strict;

if(@ARGV==0){print "perl $0 <fa> <out>\n";exit;}

my($file,$out) = @ARGV;

$/=">";

open IN,"<$file" or die $!;
open OUT,">$out" or die $!;
<IN>;
while(my $line = <IN>){
	chomp $line;
	my($id,$seq) = split(/\n/,$line,2);
	$seq =~ s/\s+//g;
	my $len = length($seq);
	if($id =~ /18S/){
		print OUT ">$line\n";
	}
}
close IN;
close OUT;
