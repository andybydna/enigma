package Enigma::RotorPack;
use policy::class;

use JSON;
use File::Slurp;

use Enigma::Spindle::Reflector;
use Enigma::Spindle::Rotor;

has filename => (
    is      => 'ro',
    isa     => 'Str',
    default => 'rotor-pack.json',
);

has raw => (
    is      =>  'ro',
    isa     => 'HashRef',
    lazy    => 1,
    builder => '_build_raw',
);

sub _build_raw {
    my $self = shift;

    return decode_json(scalar read_file($self->filename));

}

has charset => (
    is      => 'ro',
    isa     => 'ArrayRef[Str]',
    lazy    => 1,
    builder => '_build_charset',
);

sub _build_charset {
    my $self = shift;

    return [ 'A' .. 'Z' ];

}

has reflectors => (
    is      => 'ro',
    isa     => 'ArrayRef[Enigma::Spindle::Reflector]',
    traits  => ['Array'],
    handles => {
        all_reflectors => 'elements',
        get_reflector  => 'get',
    },
    lazy    => 1,
    builder => '_build_reflectors',
);

sub _build_reflectors {
    my $self = shift;

    return [
        map { Enigma::Spindle::Reflector->new($_) }
        @{ $self->raw->{reflectors} }
    ];

}

has rotors => (
    is      => 'ro',
    isa     => 'ArrayRef[Enigma::Spindle::Rotor]',
    traits  => ['Array'],
    handles => {
        all_rotors => 'elements',
        get_rotor  => 'get',
    },
    lazy    => 1,
    builder => '_build_rotors',
);

sub _build_rotors {
    my $self = shift;

    return [
        map { Enigma::Spindle::Rotor->new($_) }
        @{ $self->raw->{rotors} }
    ];

}
