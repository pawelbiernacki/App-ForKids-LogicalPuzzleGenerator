package App::ForKids::LogicalPuzzleGenerator::Variable::Name;

use strict;
use warnings FATAL => 'all';
use Carp;
use base 'App::ForKids::LogicalPuzzleGenerator::Variable';


our @names =
(
	"Patrick",
	"Stephen",
	"Leonard",
	"William",
	"James",
	"John"
);

sub new
{
	my $class = shift;
	my $this = $class->SUPER::new(@_);

	# select the names
	for my $i (0..$$this{amount_of_values}-1)
	{
		while (1)
		{
			my $value = $names[int(rand()*@names)];
			if (!grep {$_ eq $value } @{$$this{selected_values}})
			{
				push @{$$this{selected_values}}, $value;
				last;
			}
		}
	}
	return $this;
}


1;