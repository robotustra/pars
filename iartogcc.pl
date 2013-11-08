#!/usr/bin/perl.exe

# This script reads IAR c-files and converts them to GCC c-files.


use strict;
use warnings;


my $find = "LOOP";

my $name   = @ARGV ? $ARGV[0] : "../codogen/G0/main-0.g0";
my $loop_templ  = @ARGV ? $ARGV[1] : "../codogen/G0/main-0.c";

open FILE, "<$name";
my @line = <FILE>;
#print "Lined that matched $find\n";

print "File: $name\n";

my $exist = ""; # Check whether word 'LOOP' exist in the file.

for (@line) {
    if ($_ =~ /$find/) {
        #print "$_";   #\n";
        $exist = $find;  # now it's TRUE

        # Check if LOOP is not empty. I have to find {} and make sure that 
        # space between them is empty. If it's not empty - make sure that that
        # parences are balanced and copy the content inside {} to variable.

        #Check if we have '{' in the line with LOOP
        if ($_ =~ "{") 
        {
        	#Ok, open block.
        	print "Start of LOOP found.\n";
        	#Count the number of opening parensis 

        	#...

        } 
        else
        {
        	print "No beginning of block in LOOP line has found.\n"; 
        } 
    }
}

my $files = "example.c";
my $OUTFILE;
my @looplines;

if ($exist) {
	# Create the template C file.
	# check if the file exists
	if (-f $files) {
    	unlink $files
        	or die "Cannot delete $files: $!";
	}

	# Add some lines to 
	# use a variable for the file handle
	
	# use the three arguments version of open
	# and check for errors
	open $OUTFILE, '>>', $files
    	or die "Cannot open $files.";

    open TFILE, "<$loop_templ";
	@looplines = <TFILE>;

	# you can check for errors (e.g., if after opening the disk gets full)
	print { $OUTFILE } "@looplines" 
   		or die "Cannot write to $files.";

	# check for errors
	close $OUTFILE
	    or die "Cannot close $files.";

}