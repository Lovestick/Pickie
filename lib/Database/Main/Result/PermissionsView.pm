package Database::Main::Result::PermissionsView;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('permissions_view');
__PACKAGE__->add_columns(qw/
    user_id
    date_created
    date_modified
    modified_by
    container_id
    container_name
    allow_create_object
    allow_del_object
    allow_modify_object
    
 /);

1;


=cut
mysql> describe permissions_view;
+---------------------+------------------+------+-----+---------+-------+
| Field               | Type             | Null | Key | Default | Extra |
+---------------------+------------------+------+-----+---------+-------+
| user_id             | int(10) unsigned | NO   |     | NULL    |       |
| date_created        | int(15) unsigned | NO   |     | NULL    |       |
| date_modified       | int(15) unsigned | NO   |     | NULL    |       |
| modified_by         | varchar(250)     | NO   |     | NULL    |       |
| container_id        | int(11)          | NO   |     | 0       |       |
| container_name      | varchar(250)     | NO   |     | NULL    |       |
| allow_create_object | int(1) unsigned  | NO   |     | 0       |       |
| allow_del_object    | int(1) unsigned  | NO   |     | 0       |       |
| allow_modify_object | int(1) unsigned  | NO   |     | 0       |       |
+---------------------+------------------+------+-----+---------+-------+
9 rows in set (0.00 sec)



mysql >create view permissions_view as
    select
        container_permissions.user_id,
        containers.date_created,
        containers.date_modified,
        containers.modified_by,
        containers.container_id,
        containers.container_name,
        container_permissions.allow_create_object,
        container_permissions.allow_del_object,
        container_permissions.allow_modify_object
        from containers INNER join container_permissions on (containers.container_id=container_permissions.container_id);