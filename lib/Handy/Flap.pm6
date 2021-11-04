use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::Flap;

use GTK::Container;

our subset HdyFlapAncestry is export of Mu
  where HdyFlap | GtkContainerAncestry;

class Handy::Flap is GTK::Container {
  has HdyFlap $!hf;

  submethod BUILD( :$handy-flap ) {
    self.setHdyFlap($handy-flap) if $handy-flap;
  }

  method setHdyFlap (HdyFlapAncestry $_) {
    my $to-parent;

    $!hf = do {
      when HdyFlap {
        $to-parent = cast(GtkContainer, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyFlap, $_);
      }
    }
    self.setGtkContainer($to-parent);
  }

  method GTK::Raw::Definition::HdyFlap
    is also<HdyFlap>
  { $!hf }

  multi method new (HdyFlapAncestry $handy-flap, :$ref = True) {
    return Nil unless $handy-flap;

    my $o = self.bless(:$handy-flap);
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-flap = hdy_flap_new();

    $handy-flap ?? self.bless( :$handy-flap ) !! Nil;
  }

  method content is rw {
    Proxy.new:
      FETCH => -> $     { self.get_content    },
      STORE => -> $, \v { self.set_content(v) }
  }

  method flap is rw {
    Proxy.new:
      FETCH => -> $     { self.get_flap    },
      STORE => -> $, \v { self.set_flap(v) }
  }

  method flap_position is rw is also<flap-position> {
    Proxy.new:
      FETCH => -> $     { self.get_flap_position    },
      STORE => -> $, \v { self.set_flap_position(v) }
  }

  method fold_duration is rw is also<fold-duration> {
    Proxy.new:
      FETCH => -> $     { self.get_fold_duration    },
      STORE => -> $, \v { self.set_fold_duration(v) }
  }

  method fold_policy is rw is also<fold-policy> {
    Proxy.new:
      FETCH => -> $     { self.get_fold_policy    },
      STORE => -> $, \v { self.set_fold_policy(v) }
  }

  method locked is rw {
    Proxy.new:
      FETCH => -> $     { self.get_locked    },
      STORE => -> $, \v { self.set_locked(v) }
  }

  method modal is rw {
    Proxy.new:
      FETCH => -> $     { self.get_modal    },
      STORE => -> $, \v { self.set_modal(v) }
  }

  method reveal_duration is rw is also<reveal-duration> {
    Proxy.new:
      FETCH => -> $     { self.get_reveal_duration    },
      STORE => -> $, \v { self.set_reveal_duration(v) }
  }

  method reveal_flap is rw is also<reveal-flap> {
    Proxy.new:
      FETCH => -> $     { self.get_reveal_flap    },
      STORE => -> $, \v { self.set_reveal_flap(v) }
  }

  method separator is rw {
    Proxy.new:
      FETCH => -> $     { self.get_separator    },
      STORE => -> $, \v { self.set_separator(v) }
  }

  method swipe_to_close is rw is also<swipe-to-close> {
    Proxy.new:
      FETCH => -> $     { self.get_swipe_to_close    },
      STORE => -> $, \v { self.set_swipe_to_close(v) }
  }

  method swipe_to_open is rw is also<swipe-to-open> {
    Proxy.new:
      FETCH => -> $     { self.get_swipe_to_open    },
      STORE => -> $, \v { self.set_swipe_to_open(v) }
  }

  method transition_type is rw is also<transition-type> {
    Proxy.new:
      FETCH => -> $     { self.get_transition_type    },
      STORE => -> $, \v { self.set_transition_type(v) }
  }

  method get_content is also<get-content> {
    hdy_flap_get_content($!hf);
  }

  method get_flap ( :$raw = False ) is also<get-flap> {
    propReturnObject(
      hdy_flap_get_flap($!hf),
      $raw,
      |GTK::Widget.getTypePair
    );
  }

  method get_flap_position is also<get-flap-position> {
    HdyFlapFoldPolicyEnum( hdy_flap_get_flap_position($!hf) );
  }

  method get_fold_duration is also<get-fold-duration> {
    hdy_flap_get_fold_duration($!hf);
  }

  method get_fold_policy is also<get-fold-policy> {
    HdyFlapFoldPolicyEnum( hdy_flap_get_fold_policy($!hf) );
  }

  method get_folded is also<get-folded> {
    so hdy_flap_get_folded($!hf);
  }

  method get_locked is also<get-locked> {
    so hdy_flap_get_locked($!hf);
  }

  method get_modal is also<get-modal> {
    so hdy_flap_get_modal($!hf);
  }

  method get_reveal_duration is also<get-reveal-duration> {
    hdy_flap_get_reveal_duration($!hf);
  }

  method get_reveal_flap is also<get-reveal-flap> {
    hdy_flap_get_reveal_flap($!hf);
  }

  method get_reveal_progress is also<get-reveal-progress> {
    hdy_flap_get_reveal_progress($!hf);
  }

  method get_separator is also<get-separator> {
    hdy_flap_get_separator($!hf);
  }

  method get_swipe_to_close is also<get-swipe-to-close> {
    so hdy_flap_get_swipe_to_close($!hf);
  }

  method get_swipe_to_open is also<get-swipe-to-open> {
    so hdy_flap_get_swipe_to_open($!hf);
  }

  method get_transition_type is also<get-transition-type> {
    HdyFlapTransitionType( hdy_flap_get_transition_type($!hf) );
  }

  method set_content (GtkWidget $content) is also<set-content> {
    hdy_flap_set_content($!hf, $content);
  }

  method set_flap (GtkWidget $flap) is also<set-flap> {
    hdy_flap_set_flap($!hf, $flap);
  }

  method set_flap_position (GtkPackType $position) is also<set-flap-position> {
    hdy_flap_set_flap_position($!hf, $position);
  }

  method set_fold_duration (guint $duration) is also<set-fold-duration> {
    hdy_flap_set_fold_duration($!hf, $duration);
  }

  method set_fold_policy (HdyFlapFoldPolicy $policy) is also<set-fold-policy> {
    hdy_flap_set_fold_policy($!hf, $policy);
  }

  method set_locked (Int() $locked) is also<set-locked> {
    my gboolean $l = $locked.so.Int;

    hdy_flap_set_locked($!hf, $l);
  }

  method set_modal (Int() $modal) is also<set-modal> {
    my gboolean $m = $modal.so.Int;

    hdy_flap_set_modal($!hf, $m);
  }

  method set_reveal_duration (guint $duration) is also<set-reveal-duration> {
    hdy_flap_set_reveal_duration($!hf, $duration);
  }

  method set_reveal_flap (Int() $reveal_flap) is also<set-reveal-flap> {
    my gboolean $r = $reveal_flap.so.Int;

    hdy_flap_set_reveal_flap($!hf, $r);
  }

  method set_separator (GtkWidget $separator) is also<set-separator> {
    hdy_flap_set_separator($!hf, $separator);
  }

  method set_swipe_to_close (Int() $swipe_to_close)
    is also<set-swipe-to-close>
  {
    my gboolean $s = $swipe_to_close.so.Int;

    hdy_flap_set_swipe_to_close($!hf, $s);
  }

  method set_swipe_to_open (Int() $swipe_to_open) is also<set-swipe-to-open> {
    my gboolean $s = $swipe_to_open.so.Int;

    hdy_flap_set_swipe_to_open($!hf, $s);
  }

  method set_transition_type (Int() $transition_type)
    is also<set-transition-type>
  {
    my HdyFlapTransitionType $t = $transition_type;

    hdy_flap_set_transition_type($!hf, $t);
  }

}
