package KTS::Tournament::TournPlayer;
use KTS::Tournament::TournPlayer::Player;

sub new
{
	my $class = shift;
	bless {
		"player" => "",
		"drop_round" => 0,
		"rank" => 0,
		"playoff_points" => 0,
		"wins" => 0,
		"points" => 0,
		"open_dueling" => 0,
		"drop_reason" => "Active",
		"assigned_seat" => -1,
		"notes" => "",
	}, $class;
}

1;
