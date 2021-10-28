use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Handy::Raw::Definitions;
use Handy::Raw::Enums;
use GDK::Raw::Structs;

### /usr/include/libhandy-1/hdy-swipeable.h

sub hdy_swipeable_emit_child_switched (
  HdySwipeable $self,
  guint        $index,
  gint64       $duration
)
  is native(handy)
  is export
{ * }

sub hdy_swipeable_get_cancel_progress (HdySwipeable $self)
  returns gdouble
  is native(handy)
  is export
{ * }

sub hdy_swipeable_get_distance (HdySwipeable $self)
  returns gdouble
  is native(handy)
  is export
{ * }

sub hdy_swipeable_get_progress (HdySwipeable $self)
  returns gdouble
  is native(handy)
  is export
{ * }

sub hdy_swipeable_get_snap_points (
  HdySwipeable $self,
  gint         $n_snap_points is rw
)
  returns CArray[gdouble]
  is native(handy)
  is export
{ * }

sub hdy_swipeable_get_swipe_area (
  HdySwipeable           $self,
  HdyNavigationDirection $navigation_direction,
  gboolean               $is_drag,
  GdkRectangle           $rect
)
  is native(handy)
  is export
{ * }

sub hdy_swipeable_get_swipe_tracker (HdySwipeable $self)
  returns HdySwipeTracker
  is native(handy)
  is export
{ * }

sub hdy_swipeable_switch_child (
  HdySwipeable $self,
  guint        $index,
  gint64       $duration
)
  is native(handy)
  is export
{ * }
