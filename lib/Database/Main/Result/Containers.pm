package Database::Main::Result::Containers;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('containers');
__PACKAGE__->add_columns(qw/
    container_id
    container_name
    date_created
    date_modified
    modified_by
 /);
__PACKAGE__->set_primary_key('container_id');

1;


=cut
mysql> describe containers;
+----------------+------------------+------+-----+---------+----------------+
| Field          | Type             | Null | Key | Default | Extra          |
+----------------+------------------+------+-----+---------+----------------+
| container_id   | int(11)          | NO   | PRI | NULL    | auto_increment |
| container_name | varchar(250)     | NO   |     | NULL    |                |
| date_created   | int(15) unsigned | NO   |     | NULL    |                |
| date_modified  | int(15) unsigned | NO   |     | NULL    |                |
| modified_by    | varchar(250)     | NO   |     | NULL    |                |
+----------------+------------------+------+-----+---------+----------------+
7 rows in set (0.00 sec)


