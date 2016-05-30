package KTS::Tournament::TournMatch;
use XML::Writer;

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
