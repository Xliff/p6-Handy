use v6.c;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use Handy::Raw::Definitions;

unit package Handy::Raw::PreferencesWindow;

### /usr/include/libhandy-1/hdy-preferences-window.h

sub hdy_preferences_window_close_subpage (HdyPreferencesWindow $self)
  is native(handy)
  is export
{ * }

sub hdy_preferences_window_get_can_swipe_back (HdyPreferencesWindow $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_preferences_window_get_search_enabled (HdyPreferencesWindow $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_preferences_window_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_preferences_window_present_subpage (
  HdyPreferencesWindow $self,
  GtkWidget            $subpage
)
  is native(handy)
  is export
{ * }

sub hdy_preferences_window_set_can_swipe_back (
  HdyPreferencesWindow $self,
  gboolean             $can_swipe_back
)
  is native(handy)
  is export
{ * }

sub hdy_preferences_window_set_search_enabled (\
  HdyPreferencesWindow $self,
  gboolean             $search_enabled
)
  is native(handy)
  is export
{ * }
