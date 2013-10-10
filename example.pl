$string = q[Jon 'Maddog' Orwant]; # literal single quotes
$string = q{Jon 'Maddog' Orwant}; # literal single quotes
$string = q(Jon 'Maddog' Orwant); # literal single quotes
$string = q<Jon 'Maddog' Orwant>; # literal single quotes


$a = <<"EOF";
This is a multiline here document
terminated by EOF on a line by itself
EOF

$value = substr($string, $offset, $count);
$value = substr($string, $offset);
substr($string, $offset, $count) = $newstring;
substr($string, $offset) = $newtail;

# get a 5-byte string, skip 3, then grab 2 8-byte strings, then the rest
($leading, $s1, $s2, $trailing) =
unpack("A5 x3 A8 A8 A*", $data);
# split at five byte boundaries
@fivers = unpack("A5" x (length($string)/5), $string);
# chop string into individual characters
@chars = unpack("A1" x length($string), $string);



$string = "This is what you have";
# +012345678901234567890 Indexing forwards (left to right)
# 109876543210987654321- Indexing backwards (right to left)
# note that 0 means 10 or 20, etc. above
$first = substr($string, 0, 1); # "T"
$start = substr($string, 5, 2); # "is"
$rest = substr($string, 13); # "you have"
$last = substr($string, -1); # "e"
$end = substr($string, -4); # "have"
$piece = substr($string, -8, 3); # "you"


$string = "This is what you have";
print $string;
#This is what you have
substr($string, 5, 2) = "wasn't"; # change "is" to "wasn't"
#This wasn't what you have
substr($string, -12) = "ondrous";# "This wasn't wondrous"
#This wasn't wondrous
substr($string, 0, 1) = ""; # delete first character
#his wasn't wondrous
substr($string, -10) = ""; # delete last 10 characters
#his wasn'


# you can test substrings with =~
if (substr($string, -10) =~ /pattern/) {
print "Pattern matches in last 10 characters\n";
}


# substitute "at" for "is", restricted to first five characters
substr($string, 0, 5) =~ s/is/at/g;


# exchange the first and last letters in a string
$a = "make a hat";
(substr($a,0,1), substr($a,-1)) = (substr($a,-1), substr($a,0,1));
print $a;
#take a ham


# extract column with unpack
$a = "To be or not to be";
$b = unpack("x6 A6", $a); # skip 6, grab 6
print $b;
#or not
($b, $c) = unpack("x6 A2 X5 A2", $a); # forward 6, grab 2; backward 5, grab 2
print "$b\n$c\n";
#or
#be

sub cut2fmt {
my(@positions) = @_;
my $template = '';
my $lastpos = 1;
foreach $place (@positions) {
$template .= "A" . ($place - $lastpos) . " ";
$lastpos = $place;
}
$template .= "A*";
return $template;
}
$fmt = cut2fmt(8, 14, 20, 26, 30);
print "$fmt\n";


# use $b if $b is true, else $c
$a = $b || $c;
# set $x to $y unless $x is already true
$x ||= $y
#If 0 or "0" are valid values for your variables, use defined instead:
# use $b if $b is defined, else $c
$a = defined($b) ? $b : $c;

$foo = $bar || "DEFAULT VALUE";
#Here's another example, which sets $dir to be either the first argument to the program or "/tmp" if no
#argument was given.
$dir = shift(@ARGV) || "/tmp";
#We can do this without altering @ARGV:
$dir = $ARGV[0] || "/tmp";
#If 0 is a valid value for $ARGV[0], we can't use || because it evaluates as false even though it's a value
#we want to accept. We must resort to the ternary ("hook") operator:
$dir = defined($ARGV[0]) ? shift(@ARGV) : "/tmp";
#We can also write this as follows, although with slightly different semantics:
$dir = @ARGV ? $ARGV[0] : "/tmp";


