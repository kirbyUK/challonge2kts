package KTS::Tournament::TournPlayer::Player;

sub new
{
	my $class = shift;
	my %args = @_;

	# Check all required fields are present:
	for my $member (qw/ID FirstName LastName/)
	{
		die "Missing member '", $member, "'\n" if(! defined($args{"$member"}));
	}

	# Add any constant fields:
	$args{"TeamPosition"} = 0;

	bless \%args, $class;
}

sub id
{
	my $self = shift;
	return $self->{"ID"};
}

1;
