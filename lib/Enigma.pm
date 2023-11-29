package Enigma;
use policy::class;

use Enigma::Spindle;

has rotor_pack => (
    is       => 'ro',
    isa      => 'Enigma::RotorPack',
    required => 1,
);

has spindle => (
    is      => 'ro',
    isa     => 'Enigma::Spindle',
    lazy    => 1,
    builder => '_build_spindle',
);

has plugboard => (
    is  => 'ro',
);

sub _build_spindle {
    my $self = shift;

    return Enigma::Spindle->new({
        reflector => $self->rotor_pack->get_reflector(0),
        rotors    => [
            $self->rotor_pack->get_rotor(0),
            $self->rotor_pack->get_rotor(1),
            $self->rotor_pack->get_rotor(2),
        ],
    });

}

sub press_key {
    my $self = shift;
    my ($key) = @_;

    $self->spindle->pawl;

    # plugboard
    return $self->spindle->encode_character($key);
    # plugboard again
    #
    # return

}
