use strict;
use warnings;
package RolesDB::RoleType;

use Data::Dumper;
# Some Data::Dumper settings:
local $Data::Dumper::Useqq  = 1;
local $Data::Dumper::Indent = 3;

local $| = 1;

## We'll try Moose
use Moose;
use namespace::autoclean;

has 'type_name' => (is => 'ro', isa => 'Str', required => 1, );

1;
