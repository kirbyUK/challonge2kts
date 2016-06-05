# challonge2kts

Born after a discussion where a friend wanted to convert Challonge tournaments
to Konami's KTS file format, ideally to upload to COSSY. If you don't know what
these mean, this repository probably isn't for you.

## Installation

This is a Perl script, so a working Perl installation is needed. It also
depends on the following non-core modules:

* [DateTime::Format::ISO8601](http://search.cpan.org/~jhoblitt/DateTime-Format-ISO8601-0.08/lib/DateTime/Format/ISO8601.pod)
* [WWW::Challonge](http://search.cpan.org/dist/WWW-Challonge/lib/WWW/Challonge.pm)
* [XML::Writer](http://search.cpan.org/dist/XML-Writer/Writer.pm)

Currently, the program must be run in it's directory, as it needs to have the
path to the `lib` dir in place. I'll get around to implementing a proper
installation system.

## Usage

The program is currently a command-line script. At a bare minimum, it needs the
arguments `-a` specifying the Challonge API key, and `-t` for the Challonge URL.
A full list of arguments is given below:

```
usage: challonge2kts -a [api key] -t [tournament link] [OPTIONS]

-a s or --api-key=s	    The Challonge API key. Required, but does not have to be
                        the account that owns the tournament

-h or --help            Print this help message

-i s or --id=s          The ID of the tournament. Defaults to X99-000001

-o s or --output=s      The output filename. Defaults to the same style as KTS

-t s or --tournament=s  The URL of the Challonge tournament. Required.
```

On running the script, the user will be prompted to enter the full name and then
COSSY ID of every player in the Challonge tournament as they appear in KTS. So
if you entered someone called Bob Jones in Challonge as "bob", input "Bob Jones"
and their COSSY ID. You can also enter "temp" in place of an ID to assign a
temporary ID in the same way KTS does.

It is implemented like this because I can't particularly think of another
intuitive way to get it right, if anyone has any ideas please do comment / file
a pull request. The current plan is to alleviate the strain of an interactive
shell by using a web interface.

This generates a Tournament file which can be imported and edited further by
KTS. Currently, this is required to change most settings, such as staff,
location, penalties, etc.

## Tasks

- [ ] Implement tie rounds
- [ ] Web interface
- [ ] Proper build / installation

## License

Uses the standard ISC license. See the LICENSE file for more info.
