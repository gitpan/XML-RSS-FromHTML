#!/usr/bin/perl
use lib "../blib/lib";
use Test::Harness qw(&runtests $verbose);
$verbose=0;
my $a = runtests <@ARGV>;
