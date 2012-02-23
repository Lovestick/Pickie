package Database::Main::Result::PendingPotters;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('pending_potters');
__PACKAGE__->add_columns(qw/
    pending_id
    requesting_potter
    destination_potter
    passphrase
    request_date
    last_change
    shared_key
    /);
__PACKAGE__->set_primary_key('pending_id');

1;

=cut
+--------------------+------------------+------+-----+---------+----------------+
| Field              | Type             | Null | Key | Default | Extra          |
+--------------------+------------------+------+-----+---------+----------------+
| pending_id         | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| requesting_potter  | varbinary(250)   | NO   |     | NULL    |                |
| destination_potter | varbinary(250)   | NO   |     | NULL    |                |
| passphrase         | varbinary(250)   | NO   |     | NULL    |                |
| request_date       | int(11) unsigned | NO   |     | NULL    |                |
| last_change        | int(11) unsigned | NO   |     | NULL    |                |
| shared_key         | blob             | NO   |     | NULL    |                |
+--------------------+------------------+------+-----+---------+----------------+

