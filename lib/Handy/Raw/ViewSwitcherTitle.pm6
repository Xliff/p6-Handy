use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use Handy::Raw::Definitions;
use Handy::Raw::Enums;

unit package Handy::Raw::ViewSwitcherTitle;

### /usr/include/libhandy-1/hdy-view-switcher-title.h

sub hdy_view_switcher_title_get_policy (HdyViewSwitcherTitle $self)
  returns HdyViewSwitcherPolicy
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_title_get_stack (HdyViewSwitcherTitle $self)
  returns GtkStack
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_title_get_subtitle (HdyViewSwitcherTitle $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_title_get_title (HdyViewSwitcherTitle $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_title_get_title_visible (HdyViewSwitcherTitle $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_title_get_view_switcher_enabled (
  HdyViewSwitcherTitle $self
)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_title_new ()
  returns HdyViewSwitcherTitle
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_title_set_policy (
  HdyViewSwitcherTitle  $self,
  HdyViewSwitcherPolicy $policy
)
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_title_set_stack (
  HdyViewSwitcherTitle $self,
  GtkStack             $stack
)
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_title_set_subtitle (
  HdyViewSwitcherTitle $self,
  Str                  $subtitle
)
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_title_set_title (HdyViewSwitcherTitle $self, Str $title)
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_title_set_view_switcher_enabled (
  HdyViewSwitcherTitle $self,
  gboolean             $enabled
)
  is native(handy)
  is export
{ * }
