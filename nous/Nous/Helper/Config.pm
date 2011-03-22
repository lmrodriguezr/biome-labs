=head1 AUTHOR

Luis M. Rodriguez-R - lmrodriguezr at gmail dot com

=head1 DESCRIPTION

This module loads the user's configuration.

=head1 METHODS

=cut

package Nous::Helper::Config;

use strict;
use base qw(Nous::Helper);
use Nous::Helper::DefaultConfig;

=head2 new


=cut

sub new {
   my($caller, @args) = @_;
   my $class = ref($caller) or $caller;
   my $self = {};
   bless $class, $self;
   $self->_config(@args);
   return $self;
}

=head2 c

ToDo

=cut

sub c {

}

=head1 INTERNAL METHODS

These methods are only for internal use and should never
be directly called outside the library scope.

=cut

=head2 _config

Automagically finds the user configuration.  Please note
that this method does not read the configuration, it is
done on request.

=cut

sub _config {
   my($self, @args) = __(@_);
   my @list = ();
   push @list, \$Nous::Helper::DefaultConfig::config;
   unshift @list, $self->c('_userconf') if -s $self->c('_userconf');
   $self->m('config-files', \@list);
}

1;
