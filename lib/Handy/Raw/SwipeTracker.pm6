use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Handy::Raw::Definitions;

unit package Handy::Raw::SwipeTracker;

### /usr/local/include/libhandy-1/hdy-swipe-tracker.h

sub hdy_swipe_tracker_get_allow_long_swipes (HdySwipeTracker $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_swipe_tracker_get_allow_mouse_drag (HdySwipeTracker $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_swipe_tracker_get_enabled (HdySwipeTracker $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_swipe_tracker_get_reversed (HdySwipeTracker $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_swipe_tracker_get_swipeable (HdySwipeTracker $self)
  returns HdySwipeable
  is native(handy)
  is export
{ * }

sub hdy_swipe_tracker_new (HdySwipeable $swipeable)
  returns HdySwipeTracker
  is native(handy)
  is export
{ * }

sub hdy_swipe_tracker_set_allow_long_swipes (
  HdySwipeTracker $self,
  gboolean        $allow_long_swipes
)
  is native(handy)
  is export
{ * }

sub hdy_swipe_tracker_set_allow_mouse_drag (
  HdySwipeTracker $self,
  gboolean        $allow_mouse_drag
)
  is native(handy)
  is export
{ * }

sub hdy_swipe_tracker_set_enabled (HdySwipeTracker $self, gboolean $enabled)
  is native(handy)
  is export
{ * }

sub hdy_swipe_tracker_set_reversed (HdySwipeTracker $self, gboolean $reversed)
  is native(handy)
  is export
{ * }

sub hdy_swipe_tracker_shift_position (HdySwipeTracker $self, gdouble $delta)
  is native(handy)
  is export
{ * }
