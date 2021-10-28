use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use Handy::Raw::Definitions;

unit package Handy::Raw::Carousel;


### /usr/include/libhandy-1/hdy-carousel.h

sub hdy_carousel_get_allow_long_swipes (HdyCarousel $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_carousel_get_allow_mouse_drag (HdyCarousel $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_carousel_get_animation_duration (HdyCarousel $self)
  returns guint
  is native(handy)
  is export
{ * }

sub hdy_carousel_get_interactive (HdyCarousel $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_carousel_get_n_pages (HdyCarousel $self)
  returns guint
  is native(handy)
  is export
{ * }

sub hdy_carousel_get_position (HdyCarousel $self)
  returns gdouble
  is native(handy)
  is export
{ * }

sub hdy_carousel_get_reveal_duration (HdyCarousel $self)
  returns guint
  is native(handy)
  is export
{ * }

sub hdy_carousel_get_spacing (HdyCarousel $self)
  returns guint
  is native(handy)
  is export
{ * }

sub hdy_carousel_insert (HdyCarousel $self, GtkWidget $child, gint $position)
  is native(handy)
  is export
{ * }

sub hdy_carousel_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_carousel_prepend (HdyCarousel $self, GtkWidget $child)
  is native(handy)
  is export
{ * }

sub hdy_carousel_reorder (HdyCarousel $self, GtkWidget $child, gint $position)
  is native(handy)
  is export
{ * }

sub hdy_carousel_scroll_to (HdyCarousel $self, GtkWidget $widget)
  is native(handy)
  is export
{ * }

sub hdy_carousel_scroll_to_full (
  HdyCarousel $self,
  GtkWidget   $widget, 
  gint64      $duration
)
  is native(handy)
  is export
{ * }

sub hdy_carousel_set_allow_long_swipes (
  HdyCarousel $self,
  gboolean    $allow_long_swipes
)
  is native(handy)
  is export
{ * }

sub hdy_carousel_set_allow_mouse_drag (
  HdyCarousel $self,
  gboolean    $allow_mouse_drag
)
  is native(handy)
  is export
{ * }

sub hdy_carousel_set_animation_duration (HdyCarousel $self, guint $duration)
  is native(handy)
  is export
{ * }

sub hdy_carousel_set_interactive (HdyCarousel $self, gboolean $interactive)
  is native(handy)
  is export
{ * }

sub hdy_carousel_set_reveal_duration (
  HdyCarousel $self,
  guint       $reveal_duration
)
  is native(handy)
  is export
{ * }

sub hdy_carousel_set_spacing (HdyCarousel $self, guint $spacing)
  is native(handy)
  is export
{ * }
