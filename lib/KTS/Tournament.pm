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

1;
