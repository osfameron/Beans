use MooseX::Declare;

class Beans::Item {

    use DateTime::Format::Natural;

    use MooseX::Types::DateTime  qw/ DateTime /;
    use MooseX::Types::Moose     qw/ Num Str Bool ArrayRef Maybe /;

    use MooseX::Types -declare => [qw/ NonEmptyStr / ];
    subtype NonEmptyStr
        => as Str
            => where { length $_ };

    my $dt = DateTime::Format::Natural->new( prefer_future => 1 );

    coerce 'DateTime'
        => from 'Str'
            => via { $dt->parse_datetime($_[0]) };

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

1;
