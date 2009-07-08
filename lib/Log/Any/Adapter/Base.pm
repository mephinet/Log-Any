package Log::Any::Adapter::Base;
use Carp qw(croak);
use Log::Any::Util qw(make_alias);
use strict;
use warnings;

sub new {
    my $class = shift;
    my $self = {@_};
    bless $self, $class;
    $self->init();
    return $self;
}

sub init             { }

sub delegate_method_to_slot {
    my ( $class, $slot, $method, $adapter_method ) = @_;

    make_alias( $method,
        sub { my $self = shift; return $self->{$slot}->$adapter_method(@_) },
        $class );
}

1;
