package Database::Main::Result::Emails;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('emails');
__PACKAGE__->add_columns(qw/
    email_id
    username
    email_to
    email_subject
    email_date
    email_body
    email_sent
    /);
__PACKAGE__->set_primary_key('email_id');

1;

=cut
mysql> describe emails;
+---------------+------------------+------+-----+---------+----------------+
| Field         | Type             | Null | Key | Default | Extra          |
+---------------+------------------+------+-----+---------+----------------+
| email_id      | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| username      | varbinary(250)   | NO   |     | NULL    |                |
| email_to      | blob             | NO   |     | NULL    |                |
| email_subject | varbinary(250)   | NO   |     | NULL    |                |
| email_date    | int(12) unsigned | NO   |     | NULL    |                |
| email_body    | blob             | NO   |     | NULL    |                |
| email_sent    | int(12) unsigned | NO   |     | 0       |                |
+---------------+------------------+------+-----+---------+----------------+
7 rows in set (0.00 sec)

