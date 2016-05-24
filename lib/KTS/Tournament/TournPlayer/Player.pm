package KTS::Tournament::TournPlayer::Player;

sub new
{
	my $class = shift;
	bless {
		"id" => 1234567890,
		"first_name" => "",
		"last_name", => "",
		"team_position" => 0,
	}, $class;
}

1;
