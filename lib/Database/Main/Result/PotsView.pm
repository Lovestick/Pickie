package Database::Main::Result::PotsView;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('pots_view');
__PACKAGE__->add_columns(qw/
    user_id
    pot_id
    pot_name
 /);
#__PACKAGE__->set_primary_key('user_id');

1;


=cut
mysql> create view pots_view as select pot_permissions.user_id,pots.pot_id,pots.pot_name from pots INNER join pot_permissions on (pots.pot_id=pot_permissions.pot_id);
