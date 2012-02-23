package Database::Main::Result::ContainerObjects;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('container_objects');
__PACKAGE__->add_columns(qw/
    object_id
    container_id
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
mysql> describe container_objects;
+---------------+------------------+------+-----+---------+----------------+
| Field         | Type             | Null | Key | Default | Extra          |
+---------------+------------------+------+-----+---------+----------------+
| object_id     | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| container_id  | int(10) unsigned | NO   |     | NULL    |                |
| object_name   | varbinary(250)   | NO   |     | NULL    |                |
| object_value  | blob             | NO   |     | NULL    |                |
| date_created  | int(11) unsigned | NO   |     | NULL    |                |
| date_modified | int(11) unsigned | NO   |     | NULL    |                |
| modified_by   | int(10) unsigned | NO   |     | NULL    |                |
| keep_history  | int(1) unsigned  | YES  |     | 0       |                |
+---------------+------------------+------+-----+---------+----------------+
8 rows in set (0.00 sec)


