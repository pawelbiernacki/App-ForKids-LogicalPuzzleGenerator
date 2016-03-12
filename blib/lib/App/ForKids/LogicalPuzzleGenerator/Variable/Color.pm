package App::ForKids::LogicalPuzzleGenerator::Variable::Color;

use strict;
use warnings FATAL => 'all';
use Carp;
use base 'App::ForKids::LogicalPuzzleGenerator::Variable';



our @colors =
(
	"white",
	"blue",
	"green",
	"black",
	"red",
	"grey",
	"yellow"
);


sub new
{
	my $class = shift;
	my $this = $class->SUPER::new(@_);

	# select the colors
	for my $i (0..$$this{amount_of_values}-1)
	{
		while (1)
		{
			my $value = $colors[int(rand()*@colors)];
			if (!grep {$_ eq $value } @{$$this{selected_values}})
			{
				push @{$$this{selected_values}}, $value;
				last;
			}
		}
	}
	return $this;
}

sub give_description_I
{
	my ($this, $color) = @_;
	return sprintf("I like %s.", $color);
}


sub get_description_the_one_who
{
	my ($this, $color) = @_;

	return sprintf("The one who likes %s", $color);
}

sub get_description_he_does_not
{
	my ($this, $color) = @_;

	return sprintf("does not like %s.", $color);
}

sub get_description_I_dont
{
	my ($this, $color) = @_;

	return sprintf("I don't like %s.", $color);
}

sub get_description_he_likes
{
	my ($this, $color) = @_;
	return sprintf("likes %s.", $color);
}


sub get_description_X_does_not
{
	my ($this, $who, $color) = @_;
	
	return sprintf("%s does not like %s.", $who, $color);
}


sub give_description_X
{
	my ($this, $who, $color) = @_;
	return sprintf("%s likes %s.", $who, $color);
}


1;