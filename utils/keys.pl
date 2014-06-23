#!/usr/bin/perl -w
# keys.pl 1.0.0, 13-jul-2005
# petar marinov, http:/geocities.com/h2428, this is public domain

use strict;
$| = 1;
my $got = '';
while (1) {
  # wait for a sequence to begin
  $got = getone() while (ord($got) == 0);
  # process a sequence ($got already holds the first character)
  while (ord($got) != 0) {
    exit(0) if ($got eq 'x');
    printf("\\x%02x", ord($got));
    $got = getone();
  }
  print "\n";
}
exit(0);

BEGIN {
  use POSIX qw(:termios_h);
  use Fcntl;

  my ($term, $oterm, $echo, $noecho);
  $term = POSIX::Termios->new();
  $term->getattr(fileno(STDIN));
  $oterm = $term->getlflag();

  # puts console in a raw mode -- permits non-blocking reading
  sub raw {
    my $flags = 0;
    $term->setlflag($oterm & ~(ECHO | ECHOK | ICANON));
    $term->setcc(VTIME, 1);
    $term->setattr(fileno(STDIN), TCSANOW);
    fcntl(STDIN, F_GETFL, $flags)
      or die "Couldn't get flags for HANDLE : $!\n";
    $flags |= O_NONBLOCK;
    fcntl(STDIN, F_SETFL, $flags)
      or die "Couldn't set flags for HANDLE: $!\n";
  }

  # restores console to original mode
  sub cooked {
    print "restore console mode\n";
    $term->setlflag($oterm);
    $term->setcc(VTIME, 0);
    $term->setattr(fileno(STDIN), TCSANOW);
  }

  # reads character or times out
  sub getone {
    my $key = ' ';
    my ($rv, $rin, $win, $ein);
    my ($nfound, $timeleft, $rout, $wout, $eout);

    $rin = $win = $ein = '';
    vec($rin, fileno(STDIN), 1) = 1;
    $ein = $rin | $win;
    ($nfound,$timeleft) =
      select($rout=$rin, $wout=$win, $eout=$ein, 0.10);
    return chr(0) if $nfound == 0;
    $rv = sysread(STDIN, $key, 1);
    return chr(0) if (!defined($rv));
    return $key;
  }

  raw();
  print "press 'x' to exit\n";
}

END {
  cooked()
}
