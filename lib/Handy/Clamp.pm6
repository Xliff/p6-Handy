use v6.c;

use Method::Also;

use NativeCall;

use Handy::Raw::Types;

use GTK::Bin;

our subset HdyClampAncestry is export of Mu
  where HdyClamp | GtkBinAncestry;

class Handy::Clamp is GTK::Bin {
  has HdyClamp $!hc;

  submethod BUILD(:$handy-clamp) {
    self.setHdyClamp($handy-clamp) if $handy-clamp;
  }

  method Handy::Raw::Definitions::HdyClamp
    is also<HdyClamp>
  { $!hc }

  method setHdyClamp (HdyClampAncestry $_) {
    return unless $_;

    my $to-parent;
    $!hc = do {
      when HdyClamp {
        $to-parent = cast(GtkBin, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyClamp, $_);
      }
    };
    self.setGtkBin($to-parent);
  }

  multi method new (HdyClampAncestry $handy-clamp, :$ref = True) {
    return Nil unless $handy-clamp;

    my $o = self.bless( :$handy-clamp );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-clamp = hdy_clamp_new();

    $handy-clamp ?? self.bless( :$handy-clamp ) !! Nil;
  }

  method maximum_size is rw is also<maximum-size> {
    Proxy.new:
      FETCH => -> $     { self.get_maximum_size    },
      STORE => -> $, \v { self.set_maximum_size(v) }
  }

  method tightening_threshold is rw is also<tightening-threshold> {
    Proxy.new:
      FETCH => -> $     { self.get_tightening_threshold    },
      STORE => -> $, \v { self.set_tightening_threshold(v) }
  }

  method get_maximum_size is also<get-maximum-size> {
    hdy_clamp_get_maximum_size($!hc);
  }

  method get_tightening_threshold is also<get-tightening-threshold> {
    hdy_clamp_get_tightening_threshold($!hc);
  }

  method set_maximum_size (Int() $maximum_size) is also<set-maximum-size> {
    my gint $m = $maximum_size;

    hdy_clamp_set_maximum_size($!hc, $m);
  }

  method set_tightening_threshold (Int() $tightening_threshold)
    is also<set-tightening-threshold>
  {
    my gint $t = $tightening_threshold;

    hdy_clamp_set_tightening_threshold($!hc, $t);
  }

}

### /usr/local/include/libhandy-1/hdy-clamp.h

sub hdy_clamp_get_maximum_size (HdyClamp $self)
  returns gint
  is native(handy)
  is export
{ * }

sub hdy_clamp_get_tightening_threshold (HdyClamp $self)
  returns gint
  is native(handy)
  is export
{ * }

sub hdy_clamp_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_clamp_set_maximum_size (HdyClamp $self, gint $maximum_size)
  is native(handy)
  is export
{ * }

sub hdy_clamp_set_tightening_threshold (
  HdyClamp $self,
  gint     $tightening_threshold
)
  is native(handy)
  is export
{ * }
