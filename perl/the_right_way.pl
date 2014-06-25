#!/usr/bin/perl
use strict;
use warnings;

# USAGE: the_right_way.pl INFILE OUTFILE

my $infilename = $ARGV[0];
my $outfilename = $ARGV[1];

open (INFILE, "< $infilename") or die "Could not read input file!";
my $text_to_fix = <INFILE>;
$text_to_fix =~ s/,"/',/g;
$text_to_fix =~ s/\."/"\./g;
my $fixed_text = $text_to_fix; # Don't want our variable names to be misleading
close INFILE;

open (OUTFILE, "> $outfilename") or die "Could not open output file!";
print OUTFILE $fixed_text;
close OUTFILE;