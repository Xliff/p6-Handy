use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::SwipeTracker;

use GLib::Roles::Object;
use GTK::Roles::Orientable;

our subset HdySwipeTrackerAncestry is export of Mu
  where HdySwipeTracker | GtkOrientable | GObject;

class Handy::SwipeTracker {
  also does GLib::Roles::Object;
  also does GTK::Roles::Orientable;

  has HdySwipeTracker $!hst;

  submethod BUILD ( :$handy-header-group ) {
    self.setHdyHeaderGroup($handy-header-group) if $handy-header-group;
  }

  method setHdyHeaderGroup (HdyHeaderGroupAncestry $_) {
    my $to-parent;

    $!hhg = do {
      when HdyHeaderGroup {
        $to-parent = cast(GObject, $_);
        $_;
      }

      when GtkOrientable {
        $to-parent = cast(GObject, $_);
        $!or       = $_;
        cast(HdyHeaderGroup, $_);
      }

      default {
        $to-parent = $_;
        cast(HdyHeaderGroup, $_);
      }
    }
    self.roleInit-GtkOrientable;
    self!setObject($to-parent);
  }

  method Handy::Raw::HdyHeaderGroup
    is also<HdyHeaderGroup>
  { $!hhg }

  multi method new (HdyHeaderGroupAncestry $handy-header-group, :$ref = True) {
    return Nil unless $handy-header-group;

    my $o = self.bless( :$handy-header-group );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-swipe-tracker = hdy_swipe_tracker_new();

    $handy-swipe-tracker ?? self.bless( :$handy-swipe-tracker ) !! Nil;
  }

  method allow_long_swipes is rw is also<allow-long-swipes> {
    Proxy.new:
      FETCH => -> $     { self.get_allow_long_swipes    },
      STORE => -> $, \v { self.set_allow_long_swipes(v) }
  }

  method allow_mouse_drag is rw is also<allow-mouse-drag> {
    Proxy.new:
      FETCH => -> $     { self.get_allow_mouse_drag    },
      STORE => -> $, \v { self.set_allow_mouse_drag(v) }
  }

  method enabled is rw {
    Proxy.new:
      FETCH => -> $     { self.get_enabled    },
      STORE => -> $, \v { self.set_enabled(v) }
  }

  method reversed is rw {
    Proxy.new:
      FETCH => -> $     { self.get_reversed    },
      STORE => -> $, \v { self.set_reversed(v) }
  }

  method get_allow_long_swipes is also<get-allow-long-swipes> {
    so hdy_swipe_tracker_get_allow_long_swipes($!hst);
  }

  method get_allow_mouse_drag is also<get-allow-mouse-drag> {
    so hdy_swipe_tracker_get_allow_mouse_drag($!hst);
  }

  method get_enabled is also<get-enabled> {
    so hdy_swipe_tracker_get_enabled($!hst);
  }

  method get_reversed is also<get-reversed> {
    so hdy_swipe_tracker_get_reversed($!hst);
  }

  method get_swipeable is also<get-swipeable> {
    hdy_swipe_tracker_get_swipeable($!hst);
  }

  method set_allow_long_swipes (Int() $allow_long_swipes)
    is also<set-allow-long-swipes>
  {
    my gboolean $a = $allow_long_swipes.so.Int;

    hdy_swipe_tracker_set_allow_long_swipes($!hst, $a);
  }

  method set_allow_mouse_drag (Int() $allow_mouse_drag)
    is also<set-allow-mouse-drag>
  {
    my gboolean $a = $allow_mouse_drag.so.Int;

    hdy_swipe_tracker_set_allow_mouse_drag($!hst, $a);
  }

  method set_enabled (Int() $enabled) is also<set-enabled> {
    my gboolean $e = $enabled.so.Int;

    hdy_swipe_tracker_set_enabled($!hst, $e);
  }

  method set_reversed (Int() $reversed) is also<set-reversed> {
    my gboolean $r = $reversed.so.Int;

    hdy_swipe_tracker_set_reversed($!hst, $r);
  }

  method shift_position (Int() $delta) is also<shift-position> {
    my gdouble $d = $delta.so.Int;

    hdy_swipe_tracker_shift_position($!hst, $d);
  }

}
