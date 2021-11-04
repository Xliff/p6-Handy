use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use GTK::Raw::Enums;
use Handy::Raw::Definitions;
use Handy::Raw::Enums;

unit package Handy::Raw::Leaflet;


### /usr/include/libhandy-1/hdy-leaflet.h

sub hdy_leaflet_get_adjacent_child (
  HdyLeaflet             $self,
  HdyNavigationDirection $direction
)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_leaflet_get_can_swipe_back (HdyLeaflet $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_leaflet_get_can_swipe_forward (HdyLeaflet $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_leaflet_get_child_by_name (HdyLeaflet $self, Str $name)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_leaflet_get_child_transition_duration (HdyLeaflet $self)
  returns guint
  is native(handy)
  is export
{ * }

sub hdy_leaflet_get_child_transition_running (HdyLeaflet $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_leaflet_get_folded (HdyLeaflet $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_leaflet_get_homogeneous (
  HdyLeaflet     $self,
  gboolean       $folded,
  GtkOrientation $orientation
)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_leaflet_get_interpolate_size (HdyLeaflet $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_leaflet_get_mode_transition_duration (HdyLeaflet $self)
  returns guint
  is native(handy)
  is export
{ * }

sub hdy_leaflet_get_transition_type (HdyLeaflet $self)
  returns HdyLeafletTransitionType
  is native(handy)
  is export
{ * }

sub hdy_leaflet_get_visible_child (HdyLeaflet $self)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_leaflet_get_visible_child_name (HdyLeaflet $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_leaflet_insert_child_after (
  HdyLeaflet $self,
  GtkWidget  $child,
  GtkWidget  $sibling
)
  is native(handy)
  is export
{ * }

sub hdy_leaflet_navigate (HdyLeaflet $self, HdyNavigationDirection $direction)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_leaflet_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_leaflet_prepend (HdyLeaflet $self, GtkWidget $child)
  is native(handy)
  is export
{ * }

sub hdy_leaflet_reorder_child_after (
  HdyLeaflet $self,
  GtkWidget  $child,
  GtkWidget  $sibling
)
  is native(handy)
  is export
{ * }

sub hdy_leaflet_set_can_swipe_back (HdyLeaflet $self, gboolean $can_swipe_back)
  is native(handy)
  is export
{ * }

sub hdy_leaflet_set_can_swipe_forward (
  HdyLeaflet $self,
  gboolean   $can_swipe_forward
)
  is native(handy)
  is export
{ * }

sub hdy_leaflet_set_child_transition_duration (
  HdyLeaflet $self,
  guint      $duration
)
  is native(handy)
  is export
{ * }

sub hdy_leaflet_set_homogeneous (
  HdyLeaflet     $self,
  gboolean       $folded,
  GtkOrientation $orientation,
  gboolean       $homogeneous
)
  is native(handy)
  is export
{ * }

sub hdy_leaflet_set_interpolate_size (
  HdyLeaflet $self,
  gboolean   $interpolate_size
)
  is native(handy)
  is export
{ * }

sub hdy_leaflet_set_mode_transition_duration (
  HdyLeaflet $self,
  guint      $duration
)
  is native(handy)
  is export
{ * }

sub hdy_leaflet_set_transition_type (
  HdyLeaflet               $self,
  HdyLeafletTransitionType $transition
)
  is native(handy)
  is export
{ * }

sub hdy_leaflet_set_visible_child (HdyLeaflet $self, GtkWidget $visible_child)
  is native(handy)
  is export
{ * }

sub hdy_leaflet_set_visible_child_name (HdyLeaflet $self, Str $name)
  is native(handy)
  is export
{ * }
