package Pickie::Setup;
use Dancer ':syntax';
use Database::Main;
use Dancer::Plugin::DBIC;
use Crypt::PasswdMD5;

our $VERSION = '0.1';

get '/' => sub {
    template 'Setup/setup.tt';
};

true;
