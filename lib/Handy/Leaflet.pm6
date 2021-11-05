use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::Leaflet;

use GTK::Container;
use GTK::Widget;

our subset HdyLeafletAncestry is export of Mu
  when HdyLeaflet | GtkContainerAncestry;

class Handy::Leaflet is GTK::Container {
  has HdyLeaflet $!hl is implementor;

  submethod BUILD( :$handy-leaflet ) {
    self.setHdyLeaflet($handy-leaflet) if $handy-leaflet;
  }

  method setHdyLeaflet (HdyLeafletAncestry $_) {
    my $to-parent;

    $!hl = do {
      when HdyLeaflet {
        $to-parent = cast(GtkContainer, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyLeaflet, $_);
      }
    }
    self.setGtkContainer($to-parent);
  }

  method GTK::Raw::Definition::HdyLeaflet
    is also<HdyLeaflet>
  { $!hl }

  multi method new (HdyLeafletAncestry $handy-leaflet, :$ref = True) {
    return Nil unless $handy-leaflet;

    my $o = self.bless(:$handy-leaflet);
    $o.ref if $ref;
    $o;
  }

  multi method new {
    my $handy-leaflet = hdy_leaflet_new();

    $handy-leaflet ?? self.bless( :$handy-leaflet ) !! Nil;
  }

  method can_swipe_back is rw is also<can-swipe-back> {
    Proxy.new:
      FETCH => -> $     { self.get_can_swipe_back    },
      STORE => -> $, \v { self.set_can_swipe_back(v) }
  }

  method can_swipe_forward is rw is also<can-swipe-forward> {
    Proxy.new:
      FETCH => -> $     { self.get_can_swipe_forward    },
      STORE => -> $, \v { self.set_can_swipe_forward(v) }
  }

  method child_transition_duration is rw is also<child-transition-duration> {
    Proxy.new:
      FETCH => -> $     { self.get_child_transition_duration    },
      STORE => -> $, \v { self.set_child_transition_duration(v) }
  }

  method homogeneous is rw {
    Proxy.new:
      FETCH => -> $     { self.get_homogeneous    },
      STORE => -> $, \v { self.set_homogeneous(v) }
  }

  method interpolate_size is rw is also<interpolate-size> {
    Proxy.new:
      FETCH => -> $     { self.get_interpolate_size    },
      STORE => -> $, \v { self.set_interpolate_size(v) }
  }

  method mode_transition_duration is rw is also<mode-transition-duration> {
    Proxy.new:
      FETCH => -> $     { self.get_mode_transition_duration    },
      STORE => -> $, \v { self.set_mode_transition_duration(v) }
  }

  method transition_type is rw is also<transition-type> {
    Proxy.new:
      FETCH => -> $     { self.get_transition_type    },
      STORE => -> $, \v { self.set_transition_type(v) }
  }

  method visible_child is rw is also<visible-child> {
    Proxy.new:
      FETCH => -> $     { self.get_visible_child    },
      STORE => -> $, \v { self.set_visible_child(v) }
  }

  method visible_child_name is rw is also<visible-child-name> {
    Proxy.new:
      FETCH => -> $     { self.get_visible_child_name    },
      STORE => -> $, \v { self.set_visible_child_name(v) }
  }

  method get_adjacent_child (Int() $direction) is also<get-adjacent-child> {
    my HdyNavigationDirection $d = $direction;

    hdy_leaflet_get_adjacent_child($!hl, $d);
  }

  method get_can_swipe_back is also<get-can-swipe-back> {
    so hdy_leaflet_get_can_swipe_back($!hl);
  }

  method get_can_swipe_forward is also<get-can-swipe-forward> {
    so hdy_leaflet_get_can_swipe_forward($!hl);
  }

  method get_child_by_name (Str() $name) is also<get-child-by-name> {
    hdy_leaflet_get_child_by_name($!hl, $name);
  }

  method get_child_transition_duration is also<get-child-transition-duration> {
    hdy_leaflet_get_child_transition_duration($!hl);
  }

  method get_child_transition_running is also<get-child-transition-running> {
    hdy_leaflet_get_child_transition_running($!hl);
  }

  method get_folded is also<get-folded> {
    so hdy_leaflet_get_folded($!hl);
  }

  method get_homogeneous (Int() $folded, Int() $orientation)
    is also<get-homogeneous>
  {
    my gboolean       $f = $folded;
    my GtkOrientation $o = $orientation;

    hdy_leaflet_get_homogeneous($!hl, $f, $o);
  }

  method get_interpolate_size is also<get-interpolate-size> {
    hdy_leaflet_get_interpolate_size($!hl);
  }

  method get_mode_transition_duration is also<get-mode-transition-duration> {
    hdy_leaflet_get_mode_transition_duration($!hl);
  }

  method get_transition_type is also<get-transition-type> {
    HdyLeafletTransitionTypeEnum( hdy_leaflet_get_transition_type($!hl) );
  }

  method get_visible_child ( :$raw = False ) is also<get-visible-child> {
    propReturnObject(
      hdy_leaflet_get_visible_child($!hl),
      $raw,
      |GTK::Widget.getTypePair
    );
  }

  method get_visible_child_name is also<get-visible-child-name> {
    hdy_leaflet_get_visible_child_name($!hl);
  }

  method insert_child_after (GtkWidget() $child, GtkWidget() $sibling)
    is also<insert-child-after>
  {
    hdy_leaflet_insert_child_after($!hl, $child, $sibling);
  }

  method navigate (Int() $direction) {
    my HdyNavigationDirection $d = $direction;

    hdy_leaflet_navigate($!hl, $d);
  }

  method prepend (GtkWidget() $child) {
    hdy_leaflet_prepend($!hl, $child);
  }

  method reorder_child_after (GtkWidget() $child, GtkWidget() $sibling)
    is also<reorder-child-after>
  {
    hdy_leaflet_reorder_child_after($!hl, $child, $sibling);
  }

  method set_can_swipe_back (Int() $can_swipe_back)
    is also<set-can-swipe-back>
  {
    my gboolean $c = $can_swipe_back.so.Int;

    hdy_leaflet_set_can_swipe_back($!hl, $c);
  }

  method set_can_swipe_forward (Int() $can_swipe_forward)
    is also<set-can-swipe-forward>
  {
    my gboolean $c = $can_swipe_forward.so.Int;

    hdy_leaflet_set_can_swipe_forward($!hl, $c);
  }

  method set_child_transition_duration (Int() $duration)
    is also<set-child-transition-duration>
  {
    my guint $d = $duration;

    hdy_leaflet_set_child_transition_duration($!hl, $d);
  }

  method set_homogeneous (
    Int() $folded,
    Int() $orientation,
    Int() $homogeneous
  )
    is also<set-homogeneous>
  {
    my gboolean       $f = $folded.so.Int;
    my GtkOrientation $o = $orientation;
    my gboolean       $h = $homogeneous.so.Int;

    hdy_leaflet_set_homogeneous($!hl, $f, $o, $h);
  }

  method set_interpolate_size (Int() $interpolate_size)
    is also<set-interpolate-size>
  {
    my gboolean $i = $interpolate_size.so.Int;

    hdy_leaflet_set_interpolate_size($!hl, $interpolate_size);
  }

  method set_mode_transition_duration (Int() $duration)
    is also<set-mode-transition-duration>
  {
    my guint $d = $duration;

    hdy_leaflet_set_mode_transition_duration($!hl, $d);
  }

  method set_transition_type (Int() $transition)
    is also<set-transition-type>
  {
    my HdyLeafletTransitionType $t = $transition;

    hdy_leaflet_set_transition_type($!hl, $t);
  }

  method set_visible_child (GtkWidget() $visible_child)
    is also<set-visible-child>
  {
    hdy_leaflet_set_visible_child($!hl, $visible_child);
  }

  method set_visible_child_name (Str() $name) is also<set-visible-child-name> {
    hdy_leaflet_set_visible_child_name($!hl, $name);
  }

}
