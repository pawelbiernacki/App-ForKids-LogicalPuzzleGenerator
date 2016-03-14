package App::ForKids::LogicalPuzzleGenerator::Variable::Race;

use strict;
use warnings FATAL => 'all';
use Carp;
use base 'App::ForKids::LogicalPuzzleGenerator::Variable';



our @fruits =
(
	"human",
	"dwarf",
	"elf",
	"goblin",
	"troll",
	"orc"
);


sub new
{
	my $class = shift;
	my $this = $class->SUPER::new(@_);

	# select the fruits
	for my $i (0..$$this{amount_of_values}-1)
	{
		while (1)
		{
			my $value = $fruits[int(rand()*@fruits)];
			if (!grep {$_ eq $value } @{$$this{selected_values}})
			{
				push @{$$this{selected_values}}, $value;
				last;
			}
		}
	}
	return $this;
}


sub get_description
{
	return "Each belongs to a different race";
}

sub get_description_I
{
	my ($this, $race) = @_;
	return sprintf("I am a %s.", $race);
}

sub get_description_I_dont
{
	my ($this, $race) = @_;
	return sprintf("I am not a %s.", $race);
}

sub get_description_he_does_not
{
	my ($this, $race) = @_;
	return sprintf("is not a %s.", $race);
}

sub get_description_the_one_who
{
	my ($this, $race) = @_;
	return sprintf("The %s", $race);
}


sub get_description_X
{
	my ($this, $who, $race) = @_;
	return sprintf("%s is a %s.", $who, $race);
}



sub get_description_X_does_not
{
	my ($this, $who, $race) = @_;
	return sprintf("%s is not a %s.", $who, $race);
}

sub get_description_he_likes
{
	my ($this, $race) = @_;
	return sprintf("is a %s.", $race);
}


1;
