package Database::Main::Result::DecryptKeys;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('decrypt_keys');
__PACKAGE__->add_columns(qw/
    key_id
    user_id
    container_id
    decrypt_key
 /);
__PACKAGE__->set_primary_key('key_id');

1;


=cut
mysql> describe decrypt_keys;
+--------------+------------------+------+-----+---------+----------------+
| Field        | Type             | Null | Key | Default | Extra          |
+--------------+------------------+------+-----+---------+----------------+
| key_id       | int(11)          | NO   | PRI | NULL    | auto_increment |
| user_id      | int(10) unsigned | NO   |     | NULL    |                |
| container_id | int(10) unsigned | NO   |     | NULL    |                |
| decrypt_key  | blob             | NO   |     | NULL    |                |
+--------------+------------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

