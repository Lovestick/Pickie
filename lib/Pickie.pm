package Pickie;
use Dancer ':syntax';
use Database::Main;
use Dancer::Plugin::DBIC;
use Crypt::PasswdMD5;

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

true;
