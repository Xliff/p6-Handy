use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GDK::Raw::Structs;
use GTK::Raw::Definitions;
use Handy::Raw::Definitions;

unit package Handy::Raw::SearchBar;

### /usr/include/libhandy-1/hdy-search-bar.h

sub hdy_search_bar_connect_entry (HdySearchBar $self, GtkEntry $entry)
  is native(handy)
  is export
{ * }

sub hdy_search_bar_get_search_mode (HdySearchBar $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_search_bar_get_show_close_button (HdySearchBar $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_search_bar_handle_event (HdySearchBar $self, GdkEvent $event)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_search_bar_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_search_bar_set_search_mode (HdySearchBar $self, gboolean $search_mode)
  is native(handy)
  is export
{ * }

sub hdy_search_bar_set_show_close_button (HdySearchBar $self, gboolean $visible)
  is native(handy)
  is export
{ * }
