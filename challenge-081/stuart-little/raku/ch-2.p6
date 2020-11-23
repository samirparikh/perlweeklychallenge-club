#!/usr/bin/env perl6
use v6;

my $text = (@*ARGS) ?? (@*ARGS[0].IO.slurp) !!
(q:to/END/;
West Side Story

The award-winning adaptation of the classic romantic tragedy "Romeo and Juliet". The feuding families become two warring New York City gangs, the white Jets led by Riff and the Latino Sharks, led by Bernardo. Their hatred escalates to a point where neither can coexist with any form of understanding. But when Riff's best friend (and former Jet) Tony and Bernardo's younger sister Maria meet at a dance, no one can do anything to stop their love. Maria and Tony begin meeting in secret, planning to run away. Then the Sharks and Jets plan a rumble under the highway--whoever wins gains control of the streets. Maria sends Tony to stop it, hoping it can end the violence. It goes terribly wrong, and before the lovers know what's happened, tragedy strikes and doesn't stop until the climactic and heartbreaking ending.
END
);

my @words=(S:g/<[. " ( ) ,]> || "'s" || "--"// with $text).split(/\s+/);

sub wfrq(@a) {
    @a
    .classify({ @a.grep($_).elems })
    .map({ $_.key => $_.value.sort.unique })
    .sort
}

say wfrq(@words);

# run as (a) <script> <path-to-file> to pass text from a file, or
# (b) without an argument as just <script> to pass the test text above
