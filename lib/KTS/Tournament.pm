package KTS::Tournament
use KTS::Tournament::TournMatch;
use KTS::Tournament::TournPlayer;
use KTS::Tournament::TournPlayer::Player;

sub new
{
	my $class = shift;
	bless {
		"name" => "",
		"id" => "",
		"tournament_style_code" => "01",
		"structure_code" => "01",
		"event_type_code" => "01",
		"player_structure" => "01",
		"reference_date_time" => "2003-01-02",
		"date" => "2000-01-01",
		"time" => "00:00",
		"current_round" => 0,
		"table_offset" => 0,
		"playoff_round" => 0,
		"software_version" => "3.0.0.0",
		"finalized" => "False",
		"tournament_players" => [ ],
		"matches" => [ ],
	}, $class;
}

1;
