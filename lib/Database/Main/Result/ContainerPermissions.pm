package Database::Main::Result::ContainerPermissions;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('container_permissions');
__PACKAGE__->add_columns(qw/
    permission_id
    container_id
    user_id
    allow_create_object
    allow_del_object
    allow_modify_object
    /);
__PACKAGE__->set_primary_key('permission_id');

1;

=cut
mysql> describe container_permissions;
+---------------------+------------------+------+-----+---------+----------------+
| Field               | Type             | Null | Key | Default | Extra          |
+---------------------+------------------+------+-----+---------+----------------+
| permission_id       | int(11)          | NO   | PRI | NULL    | auto_increment |
| container_id        | int(10) unsigned | NO   |     | NULL    |                |
| user_id             | int(10) unsigned | NO   |     | NULL    |                |
| allow_create_object | int(1) unsigned  | NO   |     | 0       |                |
| allow_del_object    | int(1) unsigned  | NO   |     | 0       |                |
| allow_modify_object | int(1) unsigned  | NO   |     | 0       |                |
+---------------------+------------------+------+-----+---------+----------------+
