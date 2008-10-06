package Nagios::Plugin::Simple;
use strict;
use warnings;

BEGIN {
  use vars qw($VERSION);
  $VERSION     = '0.02';
}

=head1 NAME

Nagios::Plugin::Simple - Simple and Minimalistic Nagios Plugin Package

=head1 SYNOPSIS

  use Nagios::Plugin::Simple;
  my $nps=Nagios::Plugin::Simple->new;
  $nps->ok("I'm OK") if &ok;
  $nps->warning("I'm a bit sickly") if &sick;
  $nps->critical("Barf...");
  $nps->unknown("Huh?");

In the true spirit of Perl you can even do a one-liner.

  perl -MNagios::Plugin::Simple -e 'Nagios::Plugin::Simple->new->ok("")';echo $?


=head1 DESCRIPTION

This is the package that I use mostly because I feel the L<Nagios::Plugin> is too encompassing.  I feel that it is the scripts responsibility to handle arguments and thus this package does not do that nor will do that.  If you want argument handling use one of the GetOpt packages.

=head1 USAGE

  use Nagios::Plugin::Simple;
  my $nps=Nagios::Plugin::Simple->new;
  if (&ok) {$nps->ok("good!")} else {$nps->critical("bad!")};


=head1 CONSTRUCTOR

=head2 new

  my $nps=Nagios::Plugin::Simple->new();

=cut

sub new {
  my $this = shift();
  my $class = ref($this) || $this;
  my $self = {};
  bless $self, $class;
  $self->initialize(@_);
  return $self;
}

=head1 METHODS

=cut

sub initialize {
  my $self=shift;
  %$self=@_;
}

=head2 ok

Prints "OK: %s" and exits with a code 0.

  $nps->ok("I'm OK");

  STDOUT => "OK: I'm OK\n",  EXIT=>0

=cut

sub ok {
  my $self=shift;
  my $string=shift;
  $string='' unless defined($string);
  printf "OK: %s\n", $string;
  exit 0;
}

=head2 warning

Prints "Warning: %s" and exits with a code 1.

  $nps->warning("I'm a bit sickly");

  STDOUT => "Warning: I'm a bit sickly\n",  EXIT=>1

=cut

sub warning {
  my $self=shift;
  my $string=shift;
  $string='' unless defined($string);
  printf "Warning: %s\n", $string;
  exit 1;
}

=head2 critical

Prints "Critical: %s" and exits with a code 2.

  $nps->critical("Barf...");

  STDOUT => "Critical: Barf...\n",  EXIT=>2

=cut

sub critical {
  my $self=shift;
  my $string=shift;
  $string='' unless defined($string);
  printf "Critical: %s\n", $string;
  exit 2;
}

=head2 unknown

Prints "Unknown: %s" and exits with a code 3.

  $nps->unknown("Huh?")

  STDOUT => "Unknown: Huh?\n",  EXIT=>3

=cut

sub unknown {
  my $self=shift;
  my $string=shift;
  $string='' unless defined($string);
  printf "Unknown: %s\n", $string;
  exit 3;
}

=head1 BUGS

=head1 SUPPORT

=head1 AUTHOR

    Michael R. Davis
    CPAN ID: MRDVT
    STOP, LLC
    account=>perl,tld=>com,domain=>michaelrdavis
    http://www.stopllc.com/

=head1 COPYRIGHT

This program is free software licensed under the...

	The BSD License

The full text of the license can be found in the
LICENSE file included with this module.

=head1 SEE ALSO

L<Nagios::Plugin>, L<Getopt::Std>, L<Getopt::Long>

=cut

1;
