use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::Squeezer;

use GTK::Container;

our subset HdySqueezerAncestry is export of Mu
  where HdySqueezer | GtkContainerAncestry;

class Handy::Squeezer is GTK::Container {
  has HdySqueezer $!hs is implementor;

  submethod BUILD( :$handy-squeezer ) {
    self.setHdySqueezer($handy-squeezer) if $handy-squeezer;
  }

  method setHdySqueezer (HdySqueezerAncestry $_) {
    my $to-parent;

    $!hs = do {
      when HdySqueezer {
        $to-parent = cast(GtkContainer, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdySqueezer, $_);
      }
    }
    self.setGtkContainer($to-parent);
  }

  method GTK::Raw::Definition::HdySqueezer
    is also<HdySqueezer>
  { $!hs }

  multi method new (HdySqueezerAncestry $handy-squeezer, :$ref = True) {
    return Nil unless $handy-squeezer;

    my $o = self.bless(:$handy-squeezer);
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-squeezer = hdy_squeezer_new();

    $handy-squeezer ?? self.bless( :$handy-squeezer ) !! Nil;
  }

  method get_child_enabled (GtkWidget() $child) is also<get-child-enabled> {
    hdy_squeezer_get_child_enabled($!hs, $child);
  }

  method get_homogeneous is also<get-homogeneous> {
    so hdy_squeezer_get_homogeneous($!hs);
  }

  method get_interpolate_size is also<get-interpolate-size> {
    hdy_squeezer_get_interpolate_size($!hs);
  }

  method get_transition_duration is also<get-transition-duration> {
    hdy_squeezer_get_transition_duration($!hs);
  }

  method get_transition_running is also<get-transition-running> {
    so hdy_squeezer_get_transition_running($!hs);
  }

  method get_transition_type is also<get-transition-type> {
    HdySqueezerTransitionTypeEnum( hdy_squeezer_get_transition_type($!hs) );
  }

  method get_visible_child ( :$raw = False ) is also<get-visible-child> {
    propReturnObject(
      hdy_squeezer_get_visible_child($!hs),
      $raw,
      |self.getTypePair
    );
  }

  method get_xalign is also<get-xalign> {
    hdy_squeezer_get_xalign($!hs);
  }

  method get_yalign is also<get-yalign> {
    hdy_squeezer_get_yalign($!hs);
  }

  method set_child_enabled (GtkWidget() $child, Int() $enabled)
    is also<set-child-enabled>
  {
    my gboolean $e = $enabled.so.Int;

    hdy_squeezer_set_child_enabled($!hs, $child, $e);
  }

  method set_homogeneous (Int() $homogeneous) is also<set-homogeneous> {
    my gboolean $h = $homogeneous.so.Int;

    hdy_squeezer_set_homogeneous($!hs, $h);
  }

  method set_interpolate_size (Int() $interpolate_size)
    is also<set-interpolate-size>
  {
    my gboolean $i = $interpolate_size.so.Int;

    hdy_squeezer_set_interpolate_size($!hs, $i);
  }

  method set_transition_duration (Int() $duration)
    is also<set-transition-duration>
  {
    my guint $d = $duration;

    hdy_squeezer_set_transition_duration($!hs, $duration);
  }

  method set_transition_type (Int() $transition) is also<set-transition-type> {
    my HdySqueezerTransitionType $t = $transition;

    hdy_squeezer_set_transition_type($!hs, $t);
  }

  method set_xalign (Num() $xalign) is also<set-xalign> {
    my gfloat $x = $xalign;

    hdy_squeezer_set_xalign($!hs, $xalign);
  }

  method set_yalign (Num() $yalign) is also<set-yalign> {
    my gfloat $y = $yalign;

    hdy_squeezer_set_yalign($!hs, $yalign);
  }

}
