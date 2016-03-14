package App::ForKids::LogicalPuzzleGenerator::Variable::Fruit;

use strict;
use warnings FATAL => 'all';
use Carp;
use base 'App::ForKids::LogicalPuzzleGenerator::Variable';



our @fruits =
(
	"apples",
	"pears",
	"cherries",
	"strawberries",
	"pinapples",
	"oranges"
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
	return "Each has a different favourite fruit";
}

sub get_description_I
{
	my ($this, $fruit) = @_;
	return sprintf("I like %s.", $fruit);
}

sub get_description_I_dont
{
	my ($this, $fruit) = @_;
	return sprintf("I don't like %s.", $fruit);
}

sub get_description_he_does_not
{
	my ($this, $fruit) = @_;
	return sprintf("does not like %s.", $fruit);
}

sub get_description_the_one_who
{
	my ($this, $fruit) = @_;
	return sprintf("The one who likes %s", $fruit);
}


sub get_description_X
{
	my ($this, $who, $fruit) = @_;
	return sprintf("%s likes %s.", $who, $fruit);
}



sub get_description_X_does_not
{
	my ($this, $who, $fruit) = @_;
	return sprintf("%s does not like %s.", $who, $fruit);
}

sub get_description_he_likes
{
	my ($this, $fruit) = @_;
	return sprintf("likes %s.", $fruit);
}


1;
