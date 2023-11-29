package Enigma::Spindle::Rotor;
use policy::class;

extends 'Enigma::Spindle::Item';

has notch => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);
