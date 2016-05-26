package KTS::Tournament::TournPlayer;
use KTS::Tournament::TournPlayer::Player;

sub new
{
	my $class = shift;
	my %args = @_;

	# Add any constant fields:
	$args{"DropRound"} = 0;
	$args{"PlayoffPoints"} = 0;
	$args{"Points"} = 0; # TODO: Investigate this
	$args{"OpenDueling"} = 0;
	$args{"DropReason"} = "Active"; # TODO: Properly handle drops
	$args{"AssignedSeat"} = -1;
	$args{"Notes"} = "";

	# Check all required fields are present:
	for my $member (qw/
		Player DropRound Rank PlayoffPoints Wins Points OpenDueling DropReason
		AssignedSeat Notes
	/)
	{
		die "Missing member '", $member, "'\n" if(! defined($args{"$member"}));
	}
	bless \%args, $class;
}

1;
