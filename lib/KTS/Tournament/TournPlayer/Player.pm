package KTS::Tournament::TournPlayer::Player;

sub new
{
	my $class = shift;
	my $p = {
		"id" => 1234567890,
		"first_name" => "",
		"last_name", => "",
		"team_position" => 0,
	};
	bless $p, $class;
}

1;
