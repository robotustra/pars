#!/usr/bin/perl
use strict;
my $find = "btfss";

my $name   = @ARGV ? $ARGV[0] : "about.txt";

open FILE, "<$name";
my @line = <FILE>;
#print "Lined that matched $find\n";

print "File: $name\n";

for (@line) {
    if ($_ =~ /$find/) {
        print "$_";   #\n";
    }
}