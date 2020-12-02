#!/usr/bin/env raku

my @passwords = "input.txt".IO.lines;
my ($valid1, $valid2);

for @passwords {
    my ($range, $l, $pass) = $_.words;
    my ($r1, $r2) = $range.split("-")>>.Int;
    my $letter = $l.subst(":");
    $valid1++ if $pass.comb($letter).elems ~~ $r1..$r2;
    $valid2++ if $pass.comb[--$r1, --$r2].grep($letter).elems == 1;
}
say "Part 1 Valid: $valid1";
say "Part 2 Valid: $valid2";
