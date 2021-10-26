use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Handy::Raw::Definitions;

unit package Handy::Raw::Types;

### /usr/include/libhandy-1/hdy-preferences-row.h

sub hdy_preferences_row_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_preferences_row_get_title (HdyPreferencesRow $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_preferences_row_get_use_underline (HdyPreferencesRow $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_preferences_row_set_title (HdyPreferencesRow $self, Str $title)
  is native(handy)
  is export
{ * }

sub hdy_preferences_row_set_use_underline (
  HdyPreferencesRow $self,
  gboolean          $use_underline
)
  is native(handy)
  is export
{ * }
