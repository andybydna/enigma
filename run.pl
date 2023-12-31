#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';
use FindBin::libs;

use Enigma;
use Enigma::RotorPack;

# 1/301/201/501/GLUD/GYS
my %settings = (
    reflector => 1,
    rotors    => [
        { number => 3, ring => 1, initial => 'G' },
        { number => 2, ring => 1, initial => 'Y' },
        { number => 5, ring => 1, initial => 'S' },
    ],
    plugboard => {
        'G' => 'L',
        'U' => 'D',
    },
);

my $enigma = Enigma->new({
    rotor_pack => Enigma::RotorPack->new,
});

use DDP;

my @r = $enigma->press_keys('HELLOWORLD');
p @r
