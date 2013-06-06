use strict;
use warnings;
package RolesDB::Role;

use Moose;
use namespace::autoclean;
use Carp;

use RolesDB::Namespace;

use Data::Dumper;
# Some Data::Dumper settings:
local $Data::Dumper::Useqq  = 1;
local $Data::Dumper::Indent = 3;

has 'debug'     => (is => 'rw', isa => 'Int', required => 1, default => 0, );
has 'name'      => (is => 'ro', isa => 'Str', required => 1, );
has 'namespace' => (is => 'ro', isa => 'RolesDB::Namespace', required => 1, );
has 'role_type' => (is => 'ro', isa => 'RolesDB::RoleType', required => 1, );
has 'path'      => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
    builder  => '_build_path', ## Use a custom constructor to set this
);

## custom constructor
sub _build_path {
    my $self = shift;
    my $path = $self->name();
    $path =~ s/\./\//g; ## names are 2 deep xxx.yyy, this converts to xxx/yyy as the path
    if ( $self->debug() == 1 ){
        print "__PACKAGE__->_build_path: Setting path to '$path'\n";
    }
    return $self->namespace()->path() . '/' . $path;
}

sub dump {
    my $self = shift;

    return Dumper $self;
}

1;
