package KTS::Tournament::TournMatch;

sub new
{
	my $class = shift;
	bless {
		"player1" => 1234567890,
		"player2" => 9876543210,
		"round" => 0,
		"status" => "Winner",
		"table" => 0,
		"winner" => 1234567890,
		"playoff_match" => "",
	}, $class;
}

1;
