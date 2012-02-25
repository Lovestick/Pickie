package Pickie::Tools;

use Carp;
use Dancer ':syntax';
use Dancer::Plugin::DBIC;
use Crypt::CBC;
use strict;
use warnings;
use Data::Random qw/ rand_chars /;
sub new {
    my $class = shift;
    my $self = bless {}, $class;
    return $self;
}


sub generate_key {
    use Data::Random qw/ rand_chars /;
    my @random_chars = rand_chars( set => 'alphanumeric', min => 32, max => 32 );
    my $newkey = join ('',@random_chars);
    return $newkey;
}
sub random {
    my ($self,$length) = shift;
    my @random_chars = rand_chars( set => 'alphanumeric', min=> $length, max => $length);
    return join('',@random_chars);
}


sub encrypt {
    my ($self,$key,$data) = @_;
    croak "Need Key to encrypt" unless $key;
    croak "Need Data to encrypt" unless $data;
    my $cipher = Crypt::CBC->new(
        -key => $key,
        -cipher => 'DES_EDE3'
 
    );
    return $cipher->encrypt($data);
}
sub decrypt {
    my ($self,$key,$data) = @_;
    croak "Need Key to decrypt" unless $key;
    croak "Need Data to decrypt" unless $data;
    my $cipher = Crypt::CBC->new(
        -key => $key,
       -cipher => 'DES_EDE3'

    );
    return $cipher->decrypt($data);
}
sub get_container_key {
    my ($self,$container_id) = @_;
    croak "Need Container ID" unless $container_id;
    my $key_password = session('key_password');
    my $user_id      = session('user_id');
    
    my $encrypted_key =  schema->resultset('DecryptKeys')->search({
        user_id      => $user_id,
        container_id => $container_id,
    })->first->decrypt_key;
    my $decrypted_key = $self->decrypt($key_password,$encrypted_key);
    return $decrypted_key;
    
}
1;
