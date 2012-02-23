#!/usr/bin/env perl
use Dancer;
set port => 5555;
set daemon => 0;
set environment => "production";
use Pickie::Setup;
dance;
