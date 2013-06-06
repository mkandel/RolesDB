use strict;
use warnings;
package RolesDB::Namespace;

use Moose;
use namespace::autoclean;
use Carp;

use Data::Dumper;
# Some Data::Dumper settings:
local $Data::Dumper::Useqq  = 1;
local $Data::Dumper::Indent = 3;

has 'debug'     => ( is => 'rw', isa => 'Int', required => 1, default => 0, );
has 'name'      => ( is => 'ro', isa => 'Str', required => 1, );
has 'path'      => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
    builder  => '_build_path', ## Use a custom constructor to set this
);
has 'base_path' => ( is => 'ro', isa => 'Str', required => 1, default => '/var/mkandel/rolesdb/data/', );

## custom constructor
sub _build_path {
    my $self = shift;
    my $path = $self->name();
    $path =~ s/\./\//; ## names are 2 deep xxx.yyy, this converts to xxx/yyy as the path
    return $self->base_path() . $path;
}

sub dump {
    my $self = shift;

    return Dumper $self;
}

1;
