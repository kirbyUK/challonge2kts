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

sub toXML
{
	my ($self, $writer) = @_;

	$writer->startTag("Player");
	for my $member (qw/ID FirstName LastName TeamPosition/)
	{
		$writer->dataElement($member, $self->{$member});
	}
	$writer->endTag;
	return $writer;
}

1;
