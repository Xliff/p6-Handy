use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use Handy::Raw::Definitions;
use Handy::Raw::Enums;

unit package Handy::Raw::ViewSwitcherBar;

### /usr/include/libhandy-1/hdy-view-switcher-bar.h

sub hdy_view_switcher_bar_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_bar_get_policy (HdyViewSwitcherBar $self)
  returns HdyViewSwitcherPolicy
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_bar_get_reveal (HdyViewSwitcherBar $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_bar_get_stack (HdyViewSwitcherBar $self)
  returns GtkStack
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_bar_set_policy (
  HdyViewSwitcherBar    $self,
  HdyViewSwitcherPolicy $policy
)
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_bar_set_reveal (
  HdyViewSwitcherBar $self,
  gboolean           $reveal
)
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_bar_set_stack (HdyViewSwitcherBar $self, GtkStack $stack)
  is native(handy)
  is export
{ * }
