use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use GTK::Raw::Enums;
use Handy::Raw::Definitions;
use Handy::Raw::Enums;

unit package Handy::Raw::Deck;

### /usr/include/libhandy-1/hdy-deck.h

sub hdy_deck_get_adjacent_child (
  HdyDeck                $self,
  HdyNavigationDirection $direction
)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_deck_get_can_swipe_back (HdyDeck $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_deck_get_can_swipe_forward (HdyDeck $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_deck_get_child_by_name (HdyDeck $self, Str $name)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_deck_get_homogeneous (HdyDeck $self, GtkOrientation $orientation)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_deck_get_interpolate_size (HdyDeck $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_deck_get_transition_duration (HdyDeck $self)
  returns guint
  is native(handy)
  is export
{ * }

sub hdy_deck_get_transition_running (HdyDeck $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_deck_get_transition_type (HdyDeck $self)
  returns HdyDeckTransitionType
  is native(handy)
  is export
{ * }

sub hdy_deck_get_visible_child (HdyDeck $self)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_deck_get_visible_child_name (HdyDeck $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_deck_insert_child_after (
  HdyDeck   $self,
  GtkWidget $child,
  GtkWidget $sibling
)
  is native(handy)
  is export
{ * }

sub hdy_deck_navigate (HdyDeck $self, HdyNavigationDirection $direction)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_deck_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_deck_prepend (HdyDeck $self, GtkWidget $child)
  is native(handy)
  is export
{ * }

sub hdy_deck_reorder_child_after (
  HdyDeck   $self,
  GtkWidget $child,
  GtkWidget $sibling
)
  is native(handy)
  is export
{ * }

sub hdy_deck_set_can_swipe_back (HdyDeck $self, gboolean $can_swipe_back)
  is native(handy)
  is export
{ * }

sub hdy_deck_set_can_swipe_forward (HdyDeck $self, gboolean $can_swipe_forward)
  is native(handy)
  is export
{ * }

sub hdy_deck_set_homogeneous (
  HdyDeck        $self,
  GtkOrientation $orientation,
  gboolean       $homogeneous
)
  is native(handy)
  is export
{ * }

sub hdy_deck_set_interpolate_size (HdyDeck $self, gboolean $interpolate_size)
  is native(handy)
  is export
{ * }

sub hdy_deck_set_transition_duration (HdyDeck $self, guint $duration)
  is native(handy)
  is export
{ * }

sub hdy_deck_set_transition_type (
  HdyDeck               $self,
  HdyDeckTransitionType $transition
)
  is native(handy)
  is export
{ * }

sub hdy_deck_set_visible_child (HdyDeck $self, GtkWidget $visible_child)
  is native(handy)
  is export
{ * }

sub hdy_deck_set_visible_child_name (HdyDeck $self, Str $name)
  is native(handy)
  is export
{ * }
