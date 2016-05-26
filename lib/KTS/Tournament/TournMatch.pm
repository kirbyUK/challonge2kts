package KTS::Tournament::TournMatch;

sub new
{
	my $class = shift;
	my %args = @_;

	# Check all required fields are present:
	for my $member (qw/Players Round Winner/)
	{
		die "Missing member '", $member, "'\n" if(! defined($args{"$member"}));
	}

	# Add any constant fields:
	$args{"Status"} = "Winner";
	$args{"PlayoffMatch"} = "False";

	bless \%args, $class;
}

1;
