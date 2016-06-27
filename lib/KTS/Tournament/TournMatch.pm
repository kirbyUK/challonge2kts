package KTS::Tournament::TournMatch;

sub new
{
	my $class = shift;
	my %args = @_;

	# Add any constant fields:
	$args{"PlayoffMatch"} = "False";
	$args{"Table"} = 0;

	# Check all required fields are present:
	for my $member (qw/Players Round Status Table Winner PlayoffMatch/)
	{
		die "KTS::Tournament::TournMatch: Missing member '",
			$member, "'\n" if(! defined($args{"$member"}));
	}

	bless \%args, $class;
}

sub players
{
	my $self = shift;
	return $self->{"Players"};
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

sub winner
{
	my $self = shift;
	return $self->{"Winner"};
}

sub set_table
{
	my ($self, $n) = @_;
	$self->{"Table"} = $n;
}

sub toXML
{
	my ($self, $writer) = @_;

	$writer->startTag("TournMatch");
	for my $id (sort @{$self->{"Players"}})
	{
		$writer->dataElement("Player", $id);
	}
	for my $member (qw/Round Status Table Winner PlayoffMatch/)
	{
		$writer->dataElement($member, $self->{$member});
	}
	$writer->endTag;
	return $writer;
}

1;
