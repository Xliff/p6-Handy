use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Handy::Raw::Definitions;

unit package Handy::Raw::StatusPage;

### /usr/local/include/libhandy-1/hdy-status-page.h

sub hdy_status_page_get_description (HdyStatusPage $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_status_page_get_icon_name (HdyStatusPage $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_status_page_get_title (HdyStatusPage $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_status_page_new ()
  returns HdyStatusPage
  is native(handy)
  is export
{ * }

sub hdy_status_page_set_description (HdyStatusPage $self, Str $description)
  is native(handy)
  is export
{ * }

sub hdy_status_page_set_icon_name (HdyStatusPage $self, Str $icon_name)
  is native(handy)
  is export
{ * }

sub hdy_status_page_set_title (HdyStatusPage $self, Str $title)
  is native(handy)
  is export
{ * }
