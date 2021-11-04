use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use Handy::Raw::Definitions;
use Handy::Raw::Enums;

unit package Handy::Raw::Squeezer;


### /usr/include/libhandy-1/hdy-squeezer.h

sub hdy_squeezer_get_child_enabled (HdySqueezer $self, GtkWidget $child)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_squeezer_get_homogeneous (HdySqueezer $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_squeezer_get_interpolate_size (HdySqueezer $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_squeezer_get_transition_duration (HdySqueezer $self)
  returns guint
  is native(handy)
  is export
{ * }

sub hdy_squeezer_get_transition_running (HdySqueezer $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_squeezer_get_transition_type (HdySqueezer $self)
  returns HdySqueezerTransitionType
  is native(handy)
  is export
{ * }

sub hdy_squeezer_get_visible_child (HdySqueezer $self)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_squeezer_get_xalign (HdySqueezer $self)
  returns gfloat
  is native(handy)
  is export
{ * }

sub hdy_squeezer_get_yalign (HdySqueezer $self)
  returns gfloat
  is native(handy)
  is export
{ * }

sub hdy_squeezer_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_squeezer_set_child_enabled (
  HdySqueezer $self,
  GtkWidget   $child,
  gboolean    $enabled
)
  is native(handy)
  is export
{ * }

sub hdy_squeezer_set_homogeneous (HdySqueezer $self, gboolean $homogeneous)
  is native(handy)
  is export
{ * }

sub hdy_squeezer_set_interpolate_size (
  HdySqueezer $self,
  gboolean    $interpolate_size
)
  is native(handy)
  is export
{ * }

sub hdy_squeezer_set_transition_duration (HdySqueezer $self, guint $duration)
  is native(handy)
  is export
{ * }

sub hdy_squeezer_set_transition_type (
  HdySqueezer               $self,
  HdySqueezerTransitionType $transition
)
  is native(handy)
  is export
{ * }

sub hdy_squeezer_set_xalign (HdySqueezer $self, gfloat $xalign)
  is native(handy)
  is export
{ * }

sub hdy_squeezer_set_yalign (HdySqueezer $self, gfloat $yalign)
  is native(handy)
  is export
{ * }
