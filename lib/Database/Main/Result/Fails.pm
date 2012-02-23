package Database::Main::Result::Fails;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('login_fails');
__PACKAGE__->add_columns(qw/
    fail_id
    username
    fail_ip
    fail_date
    fail_reason
    /);
__PACKAGE__->set_primary_key('fail_id');

1;

=cut
mysql> describe login_fails;
+-------------+------------------+------+-----+---------+----------------+
| Field       | Type             | Null | Key | Default | Extra          |
+-------------+------------------+------+-----+---------+----------------+
| fail_id     | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| username    | varbinary(250)   | NO   |     | NULL    |                |
| fail_ip     | varchar(250)     | NO   |     | NULL    |                |
| fail_date   | int(13) unsigned | NO   |     | NULL    |                |
| fail_reason | varchar(250)     | NO   |     | NULL    |                |
+-------------+------------------+------+-----+---------+----------------+

