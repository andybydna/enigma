package Enigma::Spindle::Rotor;
use policy::class;

extends 'Enigma::Spindle::Item';

has notch => (
    is       => 'ro',
    isa      => 'Str', # should be a type that allows a single char
    required => 1,
);

sub pawl {
    my $self = shift;

    my %result;
    my %current = $self->_all_maps;

    # A hack, this should come from the rotor pack.
    my @chars = grep { exists $current{$_} } 'A' .. 'Z';

    # Rotate the values in the hashref by one.
    @result{@chars} = @current{ @chars[ 1 .. $#chars ], $chars[0] };

    # Update the attributes.
    $self->_set_map( \%result );
    $self->_set_inverse_map( { reverse $self->_all_maps } );

}
