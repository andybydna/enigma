package policy::class;
use strict;
use warnings;

use v5.34.0;

use true;
use namespace::autoclean ();
use Moose ();

use Hook::AfterRuntime;

sub import {

    my $caller = caller;

    true->import;
    Moose->import({ into => $caller });
    after_runtime { $caller->meta->make_immutable };

}

1;
