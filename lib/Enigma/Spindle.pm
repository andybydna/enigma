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
    traits   => ['Array'],
    handles  => {
        all_rotors => 'elements',
    },
);

sub pawl {
    my $self = shift;

    # scan the rotors in turn to determine if they have a notch in place or not.
    # make a note of which rotors require advancing.

    # trigger a pawl to each rotor in turn, depending on the results of the previous loop.
    $_->pawl foreach $self->all_rotors;

}

sub encode_character {
    my $self = shift;
    my ($character) = @_;
    my $result = $character;

    # send to rotors in sequence
    foreach my $rotor ($self->all_rotors) {
        $result = $rotor->encode_in($result);
    }

    # send to reflector
    # send to rotors in reverse

    return $result;

}
