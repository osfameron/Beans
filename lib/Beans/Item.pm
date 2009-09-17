use MooseX::Declare;

=head1 NAME

Beans::Item - a line item for an expense or payment in

=head1 SYNOPSIS

 ...

=cut

class Beans::Item {

    use MooseX::Types::DateTimeX qw/ DateTime /;
    use MooseX::Types::Moose     qw/ Num Str Bool ArrayRef Maybe /;

    use MooseX::Types -declare => [qw/ NonEmptyStr / ];
    subtype NonEmptyStr
        => as Str
            => where { length $_ };

    has value     => (
                       isa => Num,
                       is  => 'rw',
                     );

    has due_date  => ( isa      => DateTime, 
                       is       => 'rw', 
                       required => 1, 
                     );

    has paid_date => ( isa => Maybe[DateTime], 
                       is  => 'rw',
                     );

    has paid      => ( isa => Bool,        
                       is  => 'rw', 
                       default => sub { my $self = shift; defined $self->paid_date },
                     );

    has name      => ( isa      => NonEmptyStr, 
                       is       => 'rw', 
                       required => 1,
                     );

    has tags      => ( isa      => ArrayRef[NonEmptyStr], 
                       is       => 'rw', 
                       default  => sub { [] },
                     );

    has comment   => ( isa => Str,         
                       is  => 'rw', 
                     );
}

=head1 AUTHOR

osfameron, C<< <osfameron at cpan.org> >>

=head1 BOILERPLATE

See L<Beans> for full copyright and support info.

=cut

1;
