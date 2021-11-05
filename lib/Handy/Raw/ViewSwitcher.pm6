use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Pango::Raw::Enums;
use GTK::Raw::Definitions;
use Handy::Raw::Definitions;
use Handy::Raw::Enums;

### /usr/include/libhandy-1/hdy-view-switcher.h

sub hdy_view_switcher_get_narrow_ellipsize (HdyViewSwitcher $self)
  returns PangoEllipsizeMode
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_get_policy (HdyViewSwitcher $self)
  returns HdyViewSwitcherPolicy
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_get_stack (HdyViewSwitcher $self)
  returns GtkStack
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_set_narrow_ellipsize (
  HdyViewSwitcher    $self,
  PangoEllipsizeMode $mode
)
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_set_policy (
  HdyViewSwitcher       $self,
  HdyViewSwitcherPolicy $policy
)
  is native(handy)
  is export
{ * }

sub hdy_view_switcher_set_stack (HdyViewSwitcher $self, GtkStack $stack)
  is native(handy)
  is export
{ * }
