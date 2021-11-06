use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use Handy::Raw::Definitions;
use Handy::Raw::Enums;

unit package Handy::Raw::HeaderBar;

### /usr/include/libhandy-1/hdy-header-bar.h

sub hdy_header_bar_get_centering_policy (HdyHeaderBar $self)
  returns HdyCenteringPolicy
  is native(handy)
  is export
{ * }

sub hdy_header_bar_get_custom_title (HdyHeaderBar $self)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_header_bar_get_decoration_layout (HdyHeaderBar $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_header_bar_get_has_subtitle (HdyHeaderBar $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_header_bar_get_interpolate_size (HdyHeaderBar $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_header_bar_get_show_close_button (HdyHeaderBar $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_header_bar_get_subtitle (HdyHeaderBar $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_header_bar_get_title (HdyHeaderBar $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_header_bar_get_transition_duration (HdyHeaderBar $self)
  returns guint
  is native(handy)
  is export
{ * }

sub hdy_header_bar_get_transition_running (HdyHeaderBar $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_header_bar_new ()
  returns HdyHeaderBar
  is native(handy)
  is export
{ * }

sub hdy_header_bar_pack_end (HdyHeaderBar $self, GtkWidget $child)
  is native(handy)
  is export
{ * }

sub hdy_header_bar_pack_start (HdyHeaderBar $self, GtkWidget $child)
  is native(handy)
  is export
{ * }

sub hdy_header_bar_set_centering_policy (
  HdyHeaderBar       $self,
  HdyCenteringPolicy $centering_policy
)
  is native(handy)
  is export
{ * }

sub hdy_header_bar_set_custom_title (
  HdyHeaderBar $self,
  GtkWidget    $title_widget
)
  is native(handy)
  is export
{ * }

sub hdy_header_bar_set_decoration_layout (
  HdyHeaderBar $self,
  Str          $layout
)
  is native(handy)
  is export
{ * }

sub hdy_header_bar_set_has_subtitle (
  HdyHeaderBar $self,
  gboolean     $setting
)
  is native(handy)
  is export
{ * }

sub hdy_header_bar_set_interpolate_size (
  HdyHeaderBar $self,
  gboolean     $interpolate_size
)
  is native(handy)
  is export
{ * }

sub hdy_header_bar_set_show_close_button (
  HdyHeaderBar $self,
  gboolean     $setting
)
  is native(handy)
  is export
{ * }

sub hdy_header_bar_set_subtitle (HdyHeaderBar $self, Str $subtitle)
  is native(handy)
  is export
{ * }

sub hdy_header_bar_set_title (HdyHeaderBar $self, Str $title)
  is native(handy)
  is export
{ * }

sub hdy_header_bar_set_transition_duration (
  HdyHeaderBar $self,
  guint        $duration
)
  is native(handy)
  is export
{ * }
