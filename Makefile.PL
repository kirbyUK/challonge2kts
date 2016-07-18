use ExtUtils::MakeMaker 6.48;
eval "use Test::Manifest 1.21";

my $script_name = "challonge2kts";

WriteMakefile(
	'ABSTRACT' => 'Convert online Challonge! tournament brackets to ' .
		'Konami\'s KTS .Tournament format.',
	'AUTHOR' => 'Alex Kerr <kirby@cpan.org>',
	'BUILD_REQUIRES' => {
		'ExtUtils::MakeMaker' => 6.48,
		'Test::More' => 0,
#		'Test::LWP::UserAgent' => 0.02,
	},
	'EXE_FILES' =>  [ $script_name ],
	'LICENSE' => 'freebsd',
	'MIN_PERL_VERSION' => 5,
	'NAME' => $script_name,
	'PREREQ_PM' => {
		'DateTime::Format::ISO8601' => '0.08',
		'WWW::Challonge' => '1.01',
		'XML::Writer' => '0.625',
 	},
	'VERSION' => '0.10',

	clean => { FILES => "*.bak $script_name-*" },
);

1;
