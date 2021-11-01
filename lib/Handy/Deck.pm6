use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::Deck;

use GTK::Container;

our subset HdyDeckAncestry is export of Mu
  where HdyDeck | GtkContainerAncestry;

class Handy::Deck is GTK::Container {
  has HdyDeck $!hd is implementor;

  submethod BUILD( :$handy-deck ) {
    self.setHdyDeck($handy-deck) if $handy-deck;
  }

  method setHdyDeck (HdyDeckAncestry $_) {
    my $to-parent;

    $!hd = do {
      when HdyDeck {
        $to-parent = cast(GtkContainer, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyDeck, $_);
      }
    }
    self.setGtkContainer($to-parent);
  }

  method GTK::Raw::Definition::HdyDeck
    is also<HdyDeck>
  { $!hd }

  multi method new (HdyDeckAncestry $handy-deck, :$ref = True) {
    return Nil unless $handy-deck;

    my $o = self.bless(:$handy-deck);
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-deck = hdy_deck_new();

    $handy-deck ?? self.bless( :$handy-deck ) !! Nil
  }

  method can_swipe_back is rw
    is also<can-swipe-back>
  {
    Proxy.new:
      FETCH => -> $     { self.get_can_swipe_back    },
      STORE => -> $, \v { self.set_can_swipe_back(v) }
  }

  method can_swipe_forward is rw is also<can-swipe-forward> {
    Proxy.new:
      FETCH => -> $     { self.get_can_swipe_forward    },
      STORE => -> $, \v { self.set_can_swipe_forward(v) }
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

  method transition_duration is rw is also<transition-duration> {
    Proxy.new:
      FETCH => -> $     { self.get_transition_duration    },
      STORE => -> $, \v { self.set_transition_duration(v) }
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

  method get_adjacent_child (Int() $direction, :$raw = False)
    is also<get-adjacent-child>
  {
    my HdyNavigationDirection $d = $direction;

    propReturnObject(
      hdy_deck_get_adjacent_child($!hd, $d),
      $raw,
      |GTK::Widget.getTypePair
    )
  }

  method get_can_swipe_back is also<get-can-swipe-back> {
    so hdy_deck_get_can_swipe_back($!hd);
  }

  method get_can_swipe_forward is also<get-can-swipe-forward> {
    so hdy_deck_get_can_swipe_forward($!hd);
  }

  method get_child_by_name (Str() $name, :$raw = False)
    is also<get-child-by-name>
  {
    propReturnObject(
      hdy_deck_get_child_by_name($!hd, $name),
      $raw,
      |GTK::Widget.getTypePair
    )
  }

  method get_homogeneous (Int() $orientation) is also<get-homogeneous> {
    my GtkOrientation $o = $orientation;

    so hdy_deck_get_homogeneous($!hd, $o);
  }

  method get_interpolate_size is also<get-interpolate-size> {
    hdy_deck_get_interpolate_size($!hd);
  }

  method get_transition_duration is also<get-transition-duration> {
    hdy_deck_get_transition_duration($!hd);
  }

  method get_transition_running is also<get-transition-running> {
    hdy_deck_get_transition_running($!hd);
  }

  method get_transition_type is also<get-transition-type> {
    HdyDeckTransitionType( hdy_deck_get_transition_type($!hd) );
  }

  method get_visible_child ( :$raw = False ) is also<get-visible-child> {
    propReturnObject(
      hdy_deck_get_visible_child($!hd),
      $raw,
      |GTK::Widget.getTypePair
    );
  }

  method get_visible_child_name is also<get-visible-child-name> {
    hdy_deck_get_visible_child_name($!hd);
  }

  method insert_child_after (GtkWidget() $child, GtkWidget() $sibling)
    is also<insert-child-after>
  {
    hdy_deck_insert_child_after($!hd, $child, $sibling);
  }

  method navigate (Int() $direction) {
    my HdyNavigationDirection $d = $direction;

    hdy_deck_navigate($!hd, $direction);
  }

  method prepend (GtkWidget() $child) {
    hdy_deck_prepend($!hd, $child);
  }

  method reorder_child_after (GtkWidget() $child, GtkWidget() $sibling)
    is also<reorder-child-after>
  {
    hdy_deck_reorder_child_after($!hd, $child, $sibling);
  }

  method set_can_swipe_back (Int() $can_swipe_back)
    is also<set-can-swipe-back>
  {
    my gboolean $c = $can_swipe_back.so.Int;

    hdy_deck_set_can_swipe_back($!hd, $c);
  }

  method set_can_swipe_forward (Int() $can_swipe_forward)
    is also<set-can-swipe-forward>
  {
    my gboolean $c = $can_swipe_forward.so.Int;

    hdy_deck_set_can_swipe_forward($!hd, $c);
  }

  method set_homogeneous (Int() $orientation, Int() $homogeneous)
    is also<set-homogeneous>
  {
    my GtkOrientation $o = $orientation;
    my gboolean       $h = $homogeneous.so.Int;

    hdy_deck_set_homogeneous($!hd, $o, $h);
  }

  method set_interpolate_size (Int() $interpolate_size)
    is also<set-interpolate-size>
  {
    my gboolean $i = $interpolate_size.so.Int;

    hdy_deck_set_interpolate_size($!hd, $i);
  }

  method set_transition_duration (Int() $duration)
    is also<set-transition-duration>
  {
    my guint $d = $duration;

    hdy_deck_set_transition_duration($!hd, $d);
  }

  method set_transition_type (Int() $transition) is also<set-transition-type> {
    my HdyDeckTransitionType $t = $transition;

    hdy_deck_set_transition_type($!hd, $t);
  }

  method set_visible_child (GtkWidget() $visible_child)
    is also<set-visible-child>
  {
    hdy_deck_set_visible_child($!hd, $visible_child);
  }

  method set_visible_child_name (Str() $name)
    is also<set-visible-child-name>
  {
    hdy_deck_set_visible_child_name($!hd, $name);
  }

}
