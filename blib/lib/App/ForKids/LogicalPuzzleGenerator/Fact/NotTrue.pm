package App::ForKids::LogicalPuzzleGenerator::Fact::NotTrue;

use strict;
use warnings FATAL => 'all';
use Carp;
use App::ForKids::LogicalPuzzleGenerator::Fact;
use base 'App::ForKids::LogicalPuzzleGenerator::Fact';

sub new
{
	my $class = shift;
	my $this = $class->SUPER::new(@_);
	$$this{value} = 0;
	return $this;
}

1;
