#!/usr/bin/perl
use File::Find;

$|++;

#my $path = '.';
my $path = 'c:\\home\\projects\\pwrmon\\REV07';

my $cmd = 'file'; # a test command

finddepth (\&wanted,$path);

sub wanted {
  return unless (-f and -T); # only process text files
  
  system($cmd ,$_) or warn "$!\n";
  # or put your processing code here instead of system

 }

#__END__