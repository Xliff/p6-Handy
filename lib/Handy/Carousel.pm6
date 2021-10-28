use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::Carousel;

use GTK::EventBox;

our subset HdyCarouselAncestry is export of Mu
  where HdyCarousel | GtkEventBoxAncestry;

class Handy::Carousel is GTK::EventBox {
  has HdyCarousel $!hc;

  submethod BUILD( :$carousel ) {
    self.setGtkEventBox($carousel) if $carousel;
  }

  method setHdyCarousel (HdyCarouselAncestry $_) {\
    my $to-parent;
    
    $!hc = do {
      when HdyCarousel  {
        $to-parent = cast(GtkEventBox, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyCarousel, $_);
      }
    }
    self.setGtkEventBox($to-parent);
  }

  method GTK::Raw::Definitions::HdyCarousel
    is also<HdyCarousel>
  { $!hc }

  multi method new (HdyCarouselAncestry $carousel, :$ref = True) {
    return Nil unless $carousel;

    my $o = self.bless( :$carousel );
    $o.ref if $ref;
    $o;
  }

  method new {
    $carousel = hdy_carousel_new();

    $carousel ?? self.bless( :$carousel ) !! Nil;
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

  method animation_duration is rw is also<animation-duration> {
    Proxy.new:
      FETCH => -> $     { self.get_animation_duration    },
      STORE => -> $, \v { self.set_animation_duration(v) }
  }

  method interactive is rw {
    Proxy.new:
      FETCH => -> $     { self.get_interactive    },
      STORE => -> $, \v { self.set_interactive(v
        )
    }
  }

  method reveal_duration is rw is also<reveal-duration> {
    Proxy.new:
      FETCH => -> $     { self.get_reveal_duration    },
      STORE => -> $, \v { self.set_reveal_duration(v) }
  }

  method spacing is rw {
    Proxy.new:
      FETCH => -> $     { self.get_spacing    },
      STORE => -> $, \v { self.set_spacing(v) }
  }

  # Is originally:
  # HdyCarousel, guint, gpointer --> void
  method page-changed is also<page_changed> {
    self.connect-uint('page-changed', $!hc);
  }

  method get_allow_long_swipes is also<get-allow-long-swipes> {
    so hdy_carousel_get_allow_long_swipes($!hc);
  }

  method get_allow_mouse_drag is also<get-allow-mouse-drag> {
    so hdy_carousel_get_allow_mouse_drag($!hc);
  }

  method get_animation_duration is also<get-animation-duration> {
    hdy_carousel_get_animation_duration($!hc);
  }

  method get_interactive is also<get-interactive> {
    so hdy_carousel_get_interactive($!hc);
  }

  method get_n_pages
    is also<
      get-n-pages
      n-pages
      n_pages
      pages
      enums
    >
  {
    hdy_carousel_get_n_pages($!hc);
  }

  method get_position
    is also<
      get-position
      position
    >
  {
    hdy_carousel_get_position($!hc);
  }

  method get_reveal_duration is also<get-reveal-duration> {
    hdy_carousel_get_reveal_duration($!hc);
  }

  method get_spacing is also<get-spacing> {
    hdy_carousel_get_spacing($!hc);
  }

  method insert (GtkWidget() $child, Int() $position) {
    my gint $p = $position;

    hdy_carousel_insert($!hc, $child, $position);
  }

  method prepend (GtkWidget() $child) {
    hdy_carousel_prepend($!hc, $child);
  }

  method reorder (GtkWidget() $child, Int() $position) {
    my gint $p = $position;

    hdy_carousel_reorder($!hc, $child, $position);
  }

  method scroll_to (GtkWidget() $widget) is also<scroll-to> {
    hdy_carousel_scroll_to($!hc, $widget);
  }

  method scroll_to_full (GtkWidget() $widget, Int() $duration)
    is also<scroll-to-full>
  {
    my gint64 $d = $duration;

    hdy_carousel_scroll_to_full($!hc, $widget, $duration);
  }

  method set_allow_long_swipes (Int() $allow_long_swipes)
    is also<set-allow-long-swipes>
  {
    my gboolean $a = $allow_long_swipes.so.Int;

    hdy_carousel_set_allow_long_swipes($!hc, $a);
  }

  method set_allow_mouse_drag (Int() $allow_mouse_drag)
    is also<set-allow-mouse-drag>
  {
    my gboolean $a = $allow_mouse_drag.so.Int;

    hdy_carousel_set_allow_mouse_drag($!hc, $a);
  }

  method set_animation_duration (Int() $duration)
    is also<set-animation-duration>
  {
    my guint $d = $duration;

    hdy_carousel_set_animation_duration($!hc, $duration);
  }

  method set_interactive (Int() $interactive) is also<set-interactive> {
    my gboolean $i = $interactive.so.Int;

    hdy_carousel_set_interactive($!hc, $i);
  }

  method set_reveal_duration (Int() $reveal_duration)
    is also<set-reveal-duration>
  {
    my guint $r = $reveal_duration;

    hdy_carousel_set_reveal_duration($!hc, $reveal_duration);
  }

  method set_spacing (Int() $spacing) is also<set-spacing> {
    my guint $s = $spacing;

    hdy_carousel_set_spacing($!hc, $spacing);
  }

}
