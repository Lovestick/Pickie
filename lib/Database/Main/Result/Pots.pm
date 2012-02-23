package Database::Main::Result::Pots;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('pots');
__PACKAGE__->add_columns(qw/
    pot_id
    pot_name
    pot_type
    decrypt_key
    date_created
    date_modified
 /);
__PACKAGE__->set_primary_key('pot_id');

1;

=cut
mysql> describe pots;
+---------------+----------------+------+-----+---------+----------------+
| Field         | Type           | Null | Key | Default | Extra          |
+---------------+----------------+------+-----+---------+----------------+
| pot_id        | int(11)        | NO   | PRI | NULL    | auto_increment |
| pot_name      | varbinary(250) | NO   |     | NULL    |                |
| pot_type      | varchar(250)   | NO   |     | NULL    |                |
| decrypt_key   | blob           | NO   |     | NULL    |                |
| date_created  | datetime       | NO   |     | NULL    |                |
| date_modified | datetime       | NO   |     | NULL    |                |
+---------------+----------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

