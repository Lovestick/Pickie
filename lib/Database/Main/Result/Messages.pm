package Database::Main::Result::Messages;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('messages');
__PACKAGE__->add_columns(qw/
    message_id
    parent_id
    message_date
    message_from
    message_to
    message_unread
    message_read_date 
/);
__PACKAGE__->set_primary_key('message_id');

1;
=cut
mysql> describe messages;
+-------------------+------------------+------+-----+---------+----------------+
| Field             | Type             | Null | Key | Default | Extra          |
+-------------------+------------------+------+-----+---------+----------------+
| message_id        | int(11)          | NO   | PRI | NULL    | auto_increment |
| parent_id         | int(10) unsigned | NO   |     | NULL    |                |
| message_date      | int(11) unsigned | NO   |     | NULL    |                |
| message_from      | varbinary(250)   | NO   |     | NULL    |                |
| message_to        | varbinary(250)   | NO   |     | NULL    |                |
| message_unread    | int(1) unsigned  | NO   |     | 1       |                |
| message_read_date | int(11) unsigned | NO   |     | NULL    |                |
+-------------------+------------------+------+-----+---------+----------------+
7 rows in set (0.00 sec)

