package App::ForKids::LogicalPuzzleGenerator::Variable::Animal;

use strict;
use warnings FATAL => 'all';
use Carp;
use base 'App::ForKids::LogicalPuzzleGenerator::Variable';

our @pets =
(
	"dog",
	"cat",
	"parrot",
	"owl",
	"wolf",
	"bat"
);


sub new
{
	my $class = shift;
	my $this = $class->SUPER::new(@_);

	# select the pets
	for my $i (0..$$this{amount_of_values}-1)
	{
		while (1)
		{
			my $value = $pets[int(rand()*@pets)];
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
	return "Each has a different pet";
}

sub get_description_I
{
	my ($this, $animal) = @_;
	return sprintf("I have a %s.", $animal);
}

sub get_description_I_dont
{
	my ($this, $animal) = @_;
	return sprintf("I don't have a %s.", $animal);
}

sub get_description_he_does_not
{
	my ($this, $animal) = @_;
	return sprintf("does not have a %s.", $animal);
}

sub get_description_the_one_who
{
	my ($this, $animal) = @_;
	return sprintf("The one who has a %s", $animal);
}

sub get_description_X_does_not
{
	my ($this, $who, $animal) = @_;
	return sprintf("%s does not have a %s.", $who, $animal);
}

sub get_description_he_likes
{
	my ($this, $animal) = @_;
	return sprintf("has a %s.", $animal);
}

sub get_description_X
{
	my ($this, $who, $animal) = @_;
	return sprintf("%s has a %s.", $who, $animal);
}

1;
