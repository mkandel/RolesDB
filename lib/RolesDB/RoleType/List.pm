use strict;
use warnings;
package RolesDB::RoleType::List;

use Moose;
use namespace::autoclean;
extends 'RolesDB::RoleType';

## custom constructor
has 'type_name'         => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
    builder  => '_set_type',
);
sub _set_type { return 'RolesDB::RoleType::List'; }

1;
