use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::ViewSwitcherBar;

use GTK::Bin;

class HdyViewSwitcherBarAncestry is export of Mu
  where HdyViewSwitcherBar | GtkBinAncestry;

class Handy::ViewSwitcherBar is GTK::Bin {
  has HdyViewSwitcherBar $!hvsb is implementor;

  submethod BUILD( :$handy-viewswitcherbar ) {
    self.setHdyViewSwitcherBar($handy-viewswitcherbar)
      if $handy-viewswitcherbar;
  }

  method Handy::Raw::Definitions::HdyViewSwitcherBar
    is also<HdyViewSwitcherBar>
  { $!hvsb }

  method setHdyViewSwitcherBar (HdyViewSwitcherBarAncestry $_) {
    return unless $_;

    my $to-parent;
    $!hvsb = do {
      when HdyViewSwitcherBar {
        $to-parent = cast(GtkBin, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyViewSwitcherBar, $_);
      }
    };
    self.setGtkBin($to-parent);
  }

  multi method new (
    HdyViewSwitcherBarAncestry $handy-viewswitcherbar,
                               :$ref                   = True
  ) {
    return Nil unless $handy-viewswitcherbar;

    my $o = self.bless( :$handy-viewswitcherbar );
    $o.ref if $ref;
    $o;
  }

  multi method new {
    my $handy-viewswitcherbar = hdy_view_switcher_bar_new();

    $handy-viewswitcherbar ?? self.bless( :$handy-viewswitcherbar ) !! Nil;
  }

  method policy is rw {
    Proxy.new:
      FETCH => -> $     { self.get_policy    },
      STORE => -> $, \v { self.set_policy(v) }
  }

  method reveal is rw {
    Proxy.new:
      FETCH => -> $     { self.get_reveal    },
      STORE => -> $, \v { self.set_reveal(v) }
  }

  method stack is rw {
    Proxy.new:
      FETCH => -> $     { self.get_stack    },
      STORE => -> $, \v { self.set_stack(v) }
  }

  method get_policy is also<get-policy> {
    HdyViewSwitcherPolicyEnum( hdy_view_switcher_bar_get_policy($!hvsb) );
  }

  method get_reveal is also<get-reveal> {
    so hdy_view_switcher_bar_get_reveal($!hvsb);
  }

  method get_stack ( :$raw = False ) is also<get-stack> {
    propReturnObject(
      hdy_view_switcher_bar_get_stack($!hvsb),
      $raw,
      |GTK::Stack.getTypePair
    );
  }

  method set_policy (Int() $policy) is also<set-policy> {
    my HdyViewSwitcherPolicy $p = $policy;

    hdy_view_switcher_bar_set_policy($!hvsb, $p);
  }

  method set_reveal (Int() $reveal) is also<set-reveal> {
    my gboolean $r = $reveal.so.Int;

    hdy_view_switcher_bar_set_reveal($!hvsb, $r);
  }

  method set_stack (GtkStack() $stack) is also<set-stack> {
    hdy_view_switcher_bar_set_stack($!hvsb, $stack);
  }

}
