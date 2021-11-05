use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::ViewSwitcherTitle;

use GTK::Bin;

our subset HdyViewSwitcherTitleAncestry is export of Mu
  where HdyViewSwitcherTitle | GtkBinAncestry;

class Handy::ViewSwitcherTitle is GTK::Bin {
  has HdyViewSwitcherTitle $!hvst is implementor;

  submethod BUILD(:$handy-viewswitchertitle) {
    self.setHdyViewSwitcherTitle($handy-viewswitchertitle) if $handy-viewswitchertitle;
  }

  method Handy::Raw::Definitions::HdyViewSwitcherTitle
    is also<HdyViewSwitcherTitle>
  { $!hvst }

  method setHdyViewSwitcherTitle (HdyViewSwitcherTitleAncestry $_) {
    return unless $_;

    my $to-parent;
    $!hvst = do {
      when HdyViewSwitcherTitle {
        $to-parent = cast(GtkBin, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyViewSwitcherTitle, $_);
      }
    };
    self.setGtkBin($to-parent);
  }

  multi method new (
    HdyViewSwitcherTitleAncestry $handy-viewswitchertitle,
                                 :$ref =                   True
  ) {
    return Nil unless $handy-viewswitchertitle;

    my $o = self.bless( :$handy-viewswitchertitle );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-viewswitchertitle = hdy_view_switcher_title_new();

    $handy-viewswitchertitle ?? self.bless( :$handy-viewswitchertitle ) !! Nil;
  }

  method policy is rw {
    Proxy.new:
      FETCH => -> $     { self.get_policy    },
      STORE => -> $, \v { self.set_policy(v) }
  }

  method stack is rw {
    Proxy.new:
      FETCH => -> $     { self.get_stack    },
      STORE => -> $, \v { self.set_stack(v) }
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

  method view_switcher_enabled is rw is also<view-switcher-enabled> {
    Proxy.new:
      FETCH => -> $     { self.get_view_switcher_enabled    },
      STORE => -> $, \v { self.set_view_switcher_enabled(v) }
  }

  method get_policy is also<get-policy> {
    HdyViewSwitcherPolicyEnum( hdy_view_switcher_title_get_policy($!hvst) )
  }

  method get_stack ( :$raw = False ) is also<get-stack> {
    propReturnObject(
      hdy_view_switcher_title_get_stack($!hvst),
      $raw,
      |GTK::Stack.getTypePair
    )
  }

  method get_subtitle is also<get-subtitle> {
    hdy_view_switcher_title_get_subtitle($!hvst);
  }

  method get_title is also<get-title> {
    hdy_view_switcher_title_get_title($!hvst);
  }

  method get_title_visible is also<get-title-visible> {
    so hdy_view_switcher_title_get_title_visible($!hvst);
  }

  method get_view_switcher_enabled is also<get-view-switcher-enabled> {
    so hdy_view_switcher_title_get_view_switcher_enabled($!hvst);
  }

  method set_policy (Int() $policy) is also<set-policy> {
    my HdyViewSwitcherPolicy $p = $policy;

    hdy_view_switcher_title_set_policy($!hvst, $p);
  }

  method set_stack (GtkStack() $stack) is also<set-stack> {
    hdy_view_switcher_title_set_stack($!hvst, $stack);
  }

  method set_subtitle (Str() $subtitle) is also<set-subtitle> {
    hdy_view_switcher_title_set_subtitle($!hvst, $subtitle);
  }

  method set_title (Str() $title) is also<set-title> {
    hdy_view_switcher_title_set_title($!hvst, $title);
  }

  method set_view_switcher_enabled (Int() $enabled)
    is also<set-view-switcher-enabled>
  {
    my gboolean $e = $enabled.so.Int;

    hdy_view_switcher_title_set_view_switcher_enabled($!hvst, $e);
  }

}
