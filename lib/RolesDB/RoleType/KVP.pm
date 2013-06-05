use strict;
use warnings;
package RolesDB::RoleType::KVP;

use Moose;
use namespace::autoclean;
extends 'RolesDB::RoleType';

## custom constructor
#has 'type_name'         => (
#    is       => 'ro',
#    isa      => 'Str',
#    required => 1,
#    builder  => '_set_type',
#);
#sub _set_type { return 'RolesDB::RoleType::KVP'; }
has '+type_name' => ( default => 'RolesDB::RoleType::KVP' );

sub dump {
    my $self = shift;

    return Dumper $self;
}

1;
