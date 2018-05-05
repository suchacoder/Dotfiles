#!/usr/bin/perl
use strict;
use warnings;
my @types = qw/nat mangle filter/;
$SIG{INT} = sub{print "\e[?25h\e[u"; exit}; 
print "\e[40;37m\e[2J\e[?25l";
while (1) {
  print "\e[0;0H";
  my %output = map {$_ => scalar `iptables -t $_ -L -v -Z`} @types;
  foreach my $type (@types) {
    print "\e[01;34m------", uc($type), '-' x (73 - length($type)), "\n";
    $output{$type} =~ s/ pkts[^\n]*\n(\n|Zeroing)/$1/gs;
    foreach my $line (split /\n/, $output{$type}) {
      next if $line =~ m/^Zeroing/ || $line eq '';
      print $line =~ m/^\s*(\d+)/ || $line =~ m/(\d+) packets/
        ? ($1 > 0 
          ? ($line =~ m/DROP|DENY|REJECT/
            ? "\e[01;40;31m" 
            : "\e[01;40;32m")
          : "\e[00;40;37m")
        : "\e[00;40;33m";
      print "\e[K$line\e[01;40;37m\n"
    }
  }
  print "\e[s";
  sleep 1
}
