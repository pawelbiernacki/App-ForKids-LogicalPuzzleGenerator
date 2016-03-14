package App::ForKids::LogicalPuzzleGenerator::Variable::Profession;

use strict;
use warnings FATAL => 'all';
use Carp;
use base 'App::ForKids::LogicalPuzzleGenerator::Variable';



our @fruits =
(
	"wizard",
	"warrior",
	"witcher",
	"blacksmith",
	"fisherman",
	"lumberjack"
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
	return "Each has a different profession";
}

sub get_description_I
{
	my ($this, $profession) = @_;
	return sprintf("I am a %s.", $profession);
}

sub get_description_I_dont
{
	my ($this, $profession) = @_;
	return sprintf("I am not a %s.", $profession);
}

sub get_description_he_does_not
{
	my ($this, $profession) = @_;
	return sprintf("is not a %s.", $profession);
}

sub get_description_the_one_who
{
	my ($this, $profession) = @_;
	return sprintf("The %s", $profession);
}


sub get_description_X
{
	my ($this, $who, $profession) = @_;
	return sprintf("%s is a %s.", $who, $profession);
}



sub get_description_X_does_not
{
	my ($this, $who, $profession) = @_;
	return sprintf("%s is not a %s.", $who, $profession);
}

sub get_description_he_likes
{
	my ($this, $profession) = @_;
	return sprintf("is a %s.", $profession);
}


1;
