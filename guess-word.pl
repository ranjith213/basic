use Modern::Perl 2011;
use autodie;

my @list;
my @word;
my @tword;

open DICT,"dic";

while (<DICT>)
{
	push(@list,$_);
}

close DICT;

my $word = $list[int(rand(@list))];

chomp ($word);

my $wlength = length($word);

 
say "\t\t\t  *** GUESS WORD ***";


my $count = 0;

print '*' for (1..$wlength);

print "\nEnter a character:";

while ($count < $wlength)
{

	$word[$count] = substr($word,$count,1);

	$tword[$count] = '*';

	$count ++;

}

my $i = 0;

while (<STDIN>)
{

	chomp;

	next if $_ eq '';
	
	while ( $i < $wlength )
	{
	
		if ( $word[$i] =~ /$_/ ) 
		{
	
			$tword[$i] = $_;
	
		}
		$i ++;
	}


	say @tword;  

	print 'Enter a character:';

	$i = 0;	
}
