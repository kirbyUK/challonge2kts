package KTS::Tournament;
use KTS::Tournament::TournMatch;
use KTS::Tournament::TournPlayer;
use KTS::Tournament::TournPlayer::Player;

sub new
{
	my $class = shift;
	my %args = @_;

	# Add any constant fields:
	$args{"TournamentStyleCode"} = "01";
	$args{"StructureCode"} = "01";
	$args{"EventTypeCode"} = "01";
	$args{"PlayerStructure"} = "01";
	$args{"ReferenceDateTime"} = "2003-01-02";
	$args{"TableOffset"} = 0;
	$args{"PlayoffRound"} = 0;
	$args{"SoftwareVersion"} = "3.0.0.0";
	$args{"Finalized"} = "False";
	$args{"PenaltyList"} = "";

	# Check all required fields are present:
	for my $member (qw/
		Name ID TournamentStyleCode StructureCode EventTypeCode PlayerStructure
		ReferenceDateTime Date Time CurrentRound TableOffset PlayoffRound
		SoftwareVersion Finalized PenaltyList TournamentPlayers Matches
	/)
	{
		die "Missing member '", $member, "'\n" if(! defined($args{"$member"}));
	}

	bless \%args, $class;
}

sub name
{
	my $self = shift;
	return $self->{"Name"};
}

sub id
{
	my $self = shift;
	return $self->{"ID"};
}

sub toXML
{
	my ($self, $writer) = @_;

	$writer->startTag("Tournament");
	for my $member (qw/
		Name ID TournamentStyleCode StructureCode EventTypeCode PlayerStructure
		ReferenceDateTime Date Time CurrentRound TableOffset PlayoffRound
		SoftwareVersion Finalized
	/)
	{
		$writer->dataElement($member, $self->{$member});
	}
	$writer->emptyTag("PenaltyList");
	$writer->startTag("Staff");
	$writer->emptyTag("XmlStaffArray");
	$writer->endTag;
	$writer->startTag("TournamentPlayers");
	for my $player (@{$self->{"TournamentPlayers"}})
	{
		$writer = $player->toXML($writer);
	}
	$writer->endTag;
	$writer->startTag("Matches");
	for my $match (@{$self->{"Matches"}})
	{
		$writer = $match->toXML($writer);
	}
	$writer->endTag;
	$writer->endTag;
	return $writer;
}

1;
