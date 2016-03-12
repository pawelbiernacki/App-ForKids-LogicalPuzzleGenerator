package App::ForKids::LogicalPuzzleGenerator::Fact;

use strict;
use warnings FATAL => 'all';
use Carp;


sub new
{
	my $class = shift;
	my $this = { @_ };
	bless $this, $class;
	return $this;
}

1;
