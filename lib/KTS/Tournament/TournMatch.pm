package KTS::Tournament::TournMatch;

sub new
{
	my $class = shift;
	my %args = @_;

	# Add any constant fields:
	$args{"Status"} = "Winner";
	$args{"PlayoffMatch"} = "False";
	$args{"Table"} = 0; #TODO: Generate this

	# Check all required fields are present:
	for my $member (qw/Players Round Status Table Winner PlayoffMatch/)
	{
		die "Missing member '", $member, "'\n" if(! defined($args{"$member"}));
	}

	bless \%args, $class;
}

sub round
{
	my $self = shift;
	return $self->{"Round"};
}

sub table
{
	my $self = shift;
	return $self->{"Table"};
}

1;
