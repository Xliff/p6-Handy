use v6.c;

unit package Handy::Raw::Exports;

our @handy-exports is export;

BEGIN {
  @handy-exports = <
    Handy::Raw::Definitions
    Handy::Raw::Enums
  >;
}
