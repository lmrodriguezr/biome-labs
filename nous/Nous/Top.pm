=head1 AUTHOR

Luis M. Rodriguez-R - lmrodriguezr at gmail dot com

=head1 DESCRIPTION

This module is the very top abstract class in the
hierarchy of Nous.

=head1 METHODS

=cut

package Nous::Top;

use strict;

=head2 new

The basic initialization method.

=cut

sub new {
   my($caller, @args) = @_;
   my $class = ref($caller) or $caller;
   my $self = {};
   bless $class, $self;
   return $self;
}

=head2 m

Access to a key/value pair in memory.  The arguments are:

B<k (mix)> : The key.

B<v (mix, optional)> : The value.  If provided, the pair is set to
this value.  Otherwise, the previously stored value is returned.

=cut

sub m {
   my($self, $k, $v) = @_;
   return unless defined $k;
   $self->{"_$k"} = $v if defined $v;
   return $self->{"_$k"};
}

=head2 warn

ToDo

=cut

sub warn {

}

=head1 INTERNAL METHODS

These methods are only for internal use and should never
be directly called outside the library scope.

=cut

=head2 __

This method returns the input arguments if the first one
is undefined or inherits from L<Nous::Top>.  Otherwise,
unshifts an undefined value at the begining of the array
and returns it.  With a warning.

=cut

sub __ {
   my @a = @_;
   return @a unless defined $a[0];
   return @a if ref($a[0]) and $a[0]->isa('Nous::Top');
   Nous::Top->warn('Bad caller, attempting to continue with an undefined value', @a);
   unshift @a, undef;
   return @a;
}

1;
