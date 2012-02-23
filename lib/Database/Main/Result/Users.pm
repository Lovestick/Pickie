package Database::Main::Result::Users;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('users');
__PACKAGE__->add_columns(qw/
    user_id
    username
    login_password
    key_password
    disabled
    email
    email_validated
    name
    last_login
    last_login_date
    join_date
    pot_soft_limit
    pot_hard_limit
    timezone
 /);
__PACKAGE__->set_primary_key('user_id');

1;

=cut
mysql> describe users;
+-----------------+------------------+------+-----+------------------+----------------+
| Field           | Type             | Null | Key | Default          | Extra          |
+-----------------+------------------+------+-----+------------------+----------------+
| user_id         | int(11)          | NO   | PRI | NULL             | auto_increment |
| username        | varbinary(25)    | NO   | UNI | NULL             |                |
| login_password  | varchar(250)     | NO   |     | NULL             |                |
| key_password    | varchar(250)     | NO   |     | NULL             |                |
| disabled        | int(1) unsigned  | NO   |     | 1                |                |
| email           | varchar(250)     | NO   |     | NULL             |                |
| email_validated | int(1) unsigned  | NO   |     | 0                |                |
| name            | varchar(250)     | NO   |     | NULL             |                |
| last_login      | varchar(250)     | NO   |     | NULL             |                |
| last_login_date | int(13) unsigned | NO   |     | NULL             |                |
| join_date       | int(13) unsigned | NO   |     | NULL             |                |
| pot_soft_limit  | int(3) unsigned  | NO   |     | 10               |                |
| pot_hard_limit  | int(3) unsigned  | NO   |     | 15               |                |
| timezone        | varchar(250)     | NO   |     | America/New_York |                |
+-----------------+------------------+------+-----+------------------+----------------+
14 rows in set (0.00 sec)

