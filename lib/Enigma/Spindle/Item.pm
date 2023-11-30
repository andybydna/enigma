package Enigma::Spindle::Item;
use policy::class;

has map => (
    is       => 'ro',
    isa      => 'HashRef[Str]',
    writer   => '_set_map',
    traits   => ['Hash'],
    handles  => {
        _all_maps => 'elements',
        encode_in => 'get',
    },
    required => 1,
);

has inverse_map => (
    is       => 'ro',
    isa      => 'HashRef[Str]',
    writer   => '_set_inverse_map',
    lazy     => 1,
    default  => sub { return { reverse shift->_all_maps } },
    traits   => ['Hash'],
    handles  => {
        encode_out => 'get',
    },
);
