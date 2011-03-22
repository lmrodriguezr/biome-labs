=head1 AUTHOR

Luis M. Rodriguez-R - lmrodriguezr at gmail dot com

=head1 DESCRIPTION

Provides the default configuration of Nous.

=cut

package Nous::Helper::DefaultConfig;

=head1 MANDATORY ITEMS

These items are required for Nous to work:

=head2 _userconfig

Path to the user's configuration file.

=cut

my $config = {

'_userconfig' => $ENV{'HOME'} . "/.nousrc",

};

1;
