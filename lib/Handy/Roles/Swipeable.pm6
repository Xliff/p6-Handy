use v6.c;

use Handy::Raw::Types;
use Handy::Raw::Swipeable;

use Handy::Roles::Signals::Swipeable;

role Handy::Roles::Swipeable {
  also does Handy::Roles::Signals::Swipeable;

  has HdySwipeable $!hs;

  method roleInit-HdySwipeable {
    return if $!hs;

    my \i = findProperImplementor(self.^attributes);
    $!hs  = cast( HdySwipeable, \i.get_value(self) );
  }

  # Is originally:
  # HdySwipeable, guint, gint64, gpointer --> void
  method child-switched {
    self.connect-child-switched($!hs);
  }

  method emit_child_switched (Int() $index, Int() $duration) {
    my guint $i  = $index;
    my gint64 $d = $duration;

    hdy_swipeable_emit_child_switched($!hs, $i, $d);
  }

  method get_cancel_progress {
    hdy_swipeable_get_cancel_progress($!hs);
  }

  method get_distance {
    hdy_swipeable_get_distance($!hs);
  }

  method get_progress {
    hdy_swipeable_get_progress($!hs);
  }

  proto method get_snap_points
  { * }

  multi method get_snap_points (:$raw = False) {
    samewith($, :$raw);
  }
  multi method get_snap_points ($n_snap_points is rw, :$raw = False) {
    my gint $n = 0;

    my $da = hdy_swipeable_get_snap_points($!hs, $n);
    $n_snap_points = $n;
    return $da if $raw;
    CArrayToArray($da);
  }

  proto method get_swipe_area (|)
  { * }

  multi method get_swipe_area (
    Int()          $navigation_direction,
    Int()          $is_drag,
  ) {
    samewith($navigation_direction, $is_drag, GdkRectangle.new);
  }
  multi method get_swipe_area (
    Int()          $navigation_direction,
    Int()          $is_drag,
    GdkRectangle() $rect
  ) {
    my HdyNavigationDirection $n = $navigation_direction;
    my gboolean               $i = $is_drag.so.Int;

    hdy_swipeable_get_swipe_area($!hs, $n, $i, $rect);
    $rect;
  }

  method get_swipe_tracker ( :$raw = False ) {
    propReturnObject(
      hdy_swipeable_get_swipe_tracker($!hs),
      $raw,
      HdySwipeTracker,
      Handy::SwipeTracker
    )
  }

  method switch_child (Int() $index, Int() $duration) {
    my guint $i  = $index;
    my gint64 $d = $duration;

    hdy_swipeable_switch_child($!hs, $i, $d);
  }

}
