use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::ViewSwitcher;

use GTK::Bin;
use GTK::Stack;

our subset HdyViewSwitcherAncestry is export of Mu
  where HdyViewSwitcher | GtkBinAncestry;

class Handy::ViewSwitcher is GTK::Bin {
  has HdyViewSwitcher $!hvs is implementor;

  submethod BUILD( :$handy-switcher ) {
    self.setHdyViewSwitcher($handy-switcher) if $handy-switcher;
  }

  method Handy::Raw::Definitions::HdyViewSwitcher
    is also<HdyViewSwitcher>
  { $!hvs }

  method setHdyViewSwitcher (HdyViewSwitcherAncestry $_) {
    return unless $_;

    my $to-parent;
    $!hvs = do {
      when HdyViewSwitcher {
        $to-parent = cast(GtkBin, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyViewSwitcher, $_);
      }
    };
    self.setGtkBin($to-parent);
  }

  multi method new (HdyViewSwitcherAncestry $handy-switcher, :$ref = True) {
    return Nil unless $handy-switcher;

    my $o = self.bless( :$handy-switcher );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-switcher = hdy_view_switcher_new();

    $handy-switcher ?? self.bless( :$handy-switcher ) !! Nil;
  }

  method narrow_ellipsize is rw {
    Proxy.new:
      FETCH => -> $     { self.get_narrow_ellipsize    },
      STORE => -> $, \v { self.set_narrow_ellipsize(v) }
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

  method get_narrow_ellipsize is also<get-narrow-ellipsize> {
    PangoEllipsizeModeEnum( hdy_view_switcher_get_narrow_ellipsize($!hvs) )
  }

  method get_policy is also<get-policy> {
    HdyViewSwitcherPolicyEnum( hdy_view_switcher_get_policy($!hvs) );
  }

  method get_stack ( :$raw = False ) is also<get-stack> {
    returnObject(
      hdy_view_switcher_get_stack($!hvs),
      $raw,
      |GTK::Stack.getTypePair
    );
  }

  method set_narrow_ellipsize (Int() $mode) is also<set-narrow-ellipsize> {
    my PangoEllipsizeMode $m = $mode;

    hdy_view_switcher_set_narrow_ellipsize($!hvs, $m);
  }

  method set_policy (Int() $policy) is also<set-policy> {
    my HdyViewSwitcherPolicy $p = $policy;

    hdy_view_switcher_set_policy($!hvs, $p);
  }

  method set_stack (GtkStack() $stack) is also<set-stack> {
    hdy_view_switcher_set_stack($!hvs, $stack);
  }

}
