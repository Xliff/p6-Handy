use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::HeaderBar;

use GTK::Container;

our subset HdyHeaderBarAncestry is export of Mu
  where HdyHeaderBar | GtkContainerAncestry;

class Handy::HeaderBar is GTK::Container {
  has HdyHeaderBar $!hhb;

  submethod BUILD( :$handy-headerbar ) {
    self.setHdyHeaderBar($handy-headerbar) if $handy-headerbar;
  }

  method setHdyHeaderBar (HdyHeaderBarAncestry $_) {
    my $to-parent;

    $!hhb = do {
      when HdyHeaderBar {
        $to-parent = cast(GtkContainer, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyHeaderBar, $_);
      }
    }
    self.setGtkContainer($to-parent);
  }

  method GTK::Raw::Definition::HdyHeaderBar
    is also<HdyHeaderBar>
  { $!hhb }

  multi method new (HdyHeaderBarAncestry $handy-headerbar, :$ref = True) {
    return Nil unless $handy-headerbar;

    my $o = self.bless(:$handy-headerbar);
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-headerbar = hdy_header_bar_new();

    $handy-headerbar ?? self.bless( :$handy-headerbar ) !! Nil;
  }

  method centering_policy is rw is also<centering-policy> {
    Proxy.new:
      FETCH => -> $     { self.get_centering_policy    },
      STORE => -> $, \v { self.set_centering_policy(v) }
  }

  method custom_title is rw is also<custom-title> {
    Proxy.new:
      FETCH => -> $     { self.get_custom_title    },
      STORE => -> $, \v { self.set_custom_title(v) }
  }

  method decoration_layout is rw is also<decoration-layout> {
    Proxy.new:
      FETCH => -> $     { self.get_decoration_layout    },
      STORE => -> $, \v { self.set_decoration_layout(v) }
  }

  method has_subtitle is rw is also<has-subtitle> {
    Proxy.new:
      FETCH => -> $     { self.get_has_subtitle    },
      STORE => -> $, \v { self.set_has_subtitle(v) }
  }

  method interpolate_size is rw is also<interpolate-size> {
    Proxy.new:
      FETCH => -> $     { self.get_interpolate_size    },
      STORE => -> $, \v { self.set_interpolate_size(v) }
  }

  method show_close_button is rw is also<show-close-button> {
    Proxy.new:
      FETCH => -> $     { self.get_show_close_button    },
      STORE => -> $, \v { self.set_show_close_button(v) }
  }

  method subtitle is rw {
    Proxy.new:
      FETCH => -> $     { self.get_subtitle    },
      STORE => -> $, \v { self.set_subtitle(v) }
  }

  method title is rw {
    Proxy.new:
      FETCH => -> $     { self.get_title    },
      STORE => -> $, \v { self.set_title(v) }
  }

  method transition_duration is rw is also<transition-duration> {
    Proxy.new:
      FETCH => -> $     { self.get_transition_duration    },
      STORE => -> $, \v { self.set_transition_duration(v) }
  }

  method get_centering_policy is also<get-centering-policy> {
    HdyCenteringPolicyEnum( hdy_header_bar_get_centering_policy($!hhb) );
  }

  method get_custom_title is also<get-custom-title> {
    hdy_header_bar_get_custom_title($!hhb);
  }

  method get_decoration_layout is also<get-decoration-layout> {
    hdy_header_bar_get_decoration_layout($!hhb);
  }

  method get_has_subtitle is also<get-has-subtitle> {
    so hdy_header_bar_get_has_subtitle($!hhb);
  }

  method get_interpolate_size is also<get-interpolate-size> {
    so hdy_header_bar_get_interpolate_size($!hhb);
  }

  method get_show_close_button is also<get-show-close-button> {
    so hdy_header_bar_get_show_close_button($!hhb);
  }

  method get_subtitle is also<get-subtitle> {
    hdy_header_bar_get_subtitle($!hhb);
  }

  method get_title is also<get-title> {
    hdy_header_bar_get_title($!hhb);
  }

  method get_transition_duration is also<get-transition-duration> {
    hdy_header_bar_get_transition_duration($!hhb);
  }

  method get_transition_running is also<get-transition-running> {
    so hdy_header_bar_get_transition_running($!hhb);
  }

  method pack_end (GtkWidget() $child) is also<pack-end> {
    hdy_header_bar_pack_end($!hhb, $child);
  }

  method pack_start (GtkWidget() $child) is also<pack-start> {
    hdy_header_bar_pack_start($!hhb, $child);
  }

  method set_centering_policy (Int() $centering_policy)
    is also<set-centering-policy>
  {
    my HdyCenteringPolicy $c = $centering_policy;

    hdy_header_bar_set_centering_policy($!hhb, $c);
  }

  method set_custom_title (GtkWidget() $title_widget)
    is also<set-custom-title>
  {
    hdy_header_bar_set_custom_title($!hhb, $title_widget);
  }

  method set_decoration_layout (Str() $layout)
    is also<set-decoration-layout>
  {
    hdy_header_bar_set_decoration_layout($!hhb, $layout);
  }

  method set_has_subtitle (Int() $setting) is also<set-has-subtitle> {
    my gboolean $s = $setting.so.Int;

    hdy_header_bar_set_has_subtitle($!hhb, $s);
  }

  method set_interpolate_size (Int() $interpolate_size)
    is also<set-interpolate-size>
  {
    my gboolean $i = $interpolate_size.so.Int;

    hdy_header_bar_set_interpolate_size($!hhb, $i);
  }

  method set_show_close_button (Int() $setting)
    is also<set-show-close-button>
  {
    my gboolean $s = $setting.so.Int;

    hdy_header_bar_set_show_close_button($!hhb, $s);
  }

  method set_subtitle (Str() $subtitle) is also<set-subtitle> {
    hdy_header_bar_set_subtitle($!hhb, $subtitle);
  }

  method set_title (Str() $title) is also<set-title> {
    hdy_header_bar_set_title($!hhb, $title);
  }

  method set_transition_duration (Int() $duration)
    is also<set-transition-duration>
  {
    my guint $d = $duration;

    hdy_header_bar_set_transition_duration($!hhb, $d);
  }

}
