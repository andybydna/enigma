package Enigma::Spindle;
use policy::class;

has reflector => (
    is       => 'ro',
    isa      => 'Enigma::Spindle::Reflector',
    required => 1,
);

has rotors => (
    is       => 'ro',
    isa      => 'ArrayRef[Enigma::Spindle::Rotor]',
    required => 1,
);

sub pawl {
    my $self = shift;

    # 

}

sub encode_character {
    my $self = shift;
    my ($character) = @_;

    # send to rotors in sequence
    # send to reflector
    # send to rotors in reverse

    return $character;

}
