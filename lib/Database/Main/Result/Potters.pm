package Database::Main::Result::Potters;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('potters');
__PACKAGE__->add_columns(qw/
    potter_id
    username
    potter
    date_created
    shared_key
/);
__PACKAGE__->set_primary_key('potter_id');

1;

=cut
mysql> describe potters;
+--------------+------------------+------+-----+---------+----------------+
| Field        | Type             | Null | Key | Default | Extra          |
+--------------+------------------+------+-----+---------+----------------+
| potter_id    | int(11)          | NO   | PRI | NULL    | auto_increment |
| username     | varbinary(250)   | NO   |     | NULL    |                |
| potter       | varbinary(250)   | NO   |     | NULL    |                |
| date_created | int(12) unsigned | NO   |     | NULL    |                |
| shared_key   | blob             | NO   |     | NULL    |                |
+--------------+------------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

