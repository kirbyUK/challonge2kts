package KTS::Tournament::TournPlayer::Player;

sub new
{
	my $class = shift;
	my %args = @_;

	# Add any constant fields:
	$args{"TeamPosition"} = 0;

	# Check all required fields are present:
	for my $member (qw/ID FirstName LastName TeamPosition/)
	{
		die "Missing member '", $member, "'\n" if(! defined($args{"$member"}));
	}

	bless \%args, $class;
}

sub id
{
	my $self = shift;
	return $self->{"ID"};
}

1;
