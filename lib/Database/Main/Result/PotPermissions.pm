package Database::Main::Result::PotPermissions;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('pot_permissions');
__PACKAGE__->add_columns(qw/
    perm_id
    pot_id
    pot_name
    username
    role
    allow_add_object
    allow_del_object
    allow_mod_object
    allow_add_member
    allow_del_member
    allow_mod_perms
    /);
__PACKAGE__->set_primary_key('perm_id');

1;

=cut
mysql> describe pot_permissions;
+------------------+------------------+------+-----+---------+----------------+
| Field            | Type             | Null | Key | Default | Extra          |
+------------------+------------------+------+-----+---------+----------------+
| perm_id          | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| pot_id           | int(10) unsigned | NO   |     | NULL    |                |
| pot_name         | varbinary(250)   | NO   |     | NULL    |                |
| username         | varbinary(250)   | NO   |     | NULL    |                |
| role             | varchar(250)     | NO   |     | NULL    |                |
| allow_add_object | int(1) unsigned  | NO   |     | 0       |                |
| allow_del_object | int(1) unsigned  | YES  |     | 0       |                |
| allow_mod_object | int(1) unsigned  | YES  |     | 0       |                |
| allow_add_member | int(1) unsigned  | NO   |     | 0       |                |
| allow_del_member | int(1) unsigned  | NO   |     | 0       |                |
| allow_mod_perms  | int(1) unsigned  | NO   |     | 0       |                |
+------------------+------------------+------+-----+---------+----------------+

