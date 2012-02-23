package Database::Main::Result::PotObjects;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('pot_objects');
__PACKAGE__->add_columns(qw/
    object_id
    pot_id
    object_name
    object_value
    date_created
    date_modified
    modified_by
    keep_history
    
    /);
__PACKAGE__->set_primary_key('object_id');

1;

=cut
mysql> describe pot_objects;
+---------------+------------------+------+-----+---------+----------------+
| Field         | Type             | Null | Key | Default | Extra          |
+---------------+------------------+------+-----+---------+----------------+
| object_id     | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| pot_id        | int(10) unsigned | NO   |     | NULL    |                |
| object_name   | varbinary(250)   | NO   |     | NULL    |                |
| object_value  | blob             | NO   |     | NULL    |                |
| date_created  | datetime         | NO   |     | NULL    |                |
| date_modified | datetime         | NO   |     | NULL    |                |
| modified_by   | varbinary(250)   | NO   |     | NULL    |                |
| keep_history  | int(1) unsigned  | YES  |     | 0       |                |
+---------------+------------------+------+-----+---------+----------------+
8 rows in set (0.02 sec)

