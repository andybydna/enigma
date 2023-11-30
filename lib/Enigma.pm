package Enigma;
use policy::class;

use Enigma::Spindle;

=head1 Name

Enigma

=head1 Description

A library with the lofty goal of one day emulating an Enigma machine.

=head1 Extends

Nothing

=head1 Consumes

Nothing

=head1 Attributes

=over

=item rotor_pack

The L<Enigma::RotorPack> to use for this machine.

=cut

has rotor_pack => (
    is       => 'ro',
    isa      => 'Enigma::RotorPack',
    required => 1,
);

=item spindle

The L<Enigma::Spindle> to use for this machine.

=cut

has spindle => (
    is      => 'ro',
    isa     => 'Enigma::Spindle',
    lazy    => 1,
    builder => '_build_spindle',
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

=item plugboard

Not yet implemented.

=cut

has plugboard => (
    is  => 'ro',
);

=back

=head1 Methods

=over

=item press_key($key)

Simulates the pressing of a key. It will return the encoded character.

=cut

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

sub press_keys {
    my $self = shift;
    my ($keys) = @_;

    return map { $self->press_key($_) } split //, $keys;

}

=back

=cut
