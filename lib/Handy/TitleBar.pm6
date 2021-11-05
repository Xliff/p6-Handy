use v6.c;

use Method::Also;

use NativeCall;

use Handy::Raw::Types;

use GTK::Bin;

our subset HdyTitleBarAncestry is export of Mu
  where HdyTitleBar | GtkBinAncestry;

class Handy::TitleBar is GTK::Bin {
  has HdyTitleBar $!ht is implementor;

  submethod BUILD( :$handy-titlebar) {
    self.setHdyTitleBar($handy-titlebar) if $handy-titlebar;
  }

  method Handy::Raw::Definitions::HdyTitleBar
    is also<HdyTitleBar>
  { $!ht }

  method setHdyTitleBar (HdyTitleBarAncestry $_) {
    return unless $_;

    my $to-parent;
    $!ht = do {
      when HdyTitleBar {
        $to-parent = cast(GtkBin, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyTitleBar, $_);
      }
    };
    self.setGtkBin($to-parent);
  }

  multi method new (HdyTitleBarAncestry $handy-titlebar, :$ref = True) {
    return Nil unless $handy-titlebar;

    my $o = self.bless( :$handy-titlebar );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-titlebar = hdy_title_bar_new();

    $handy-titlebar ?? self.bless( :$handy-titlebar ) !! Nil;
  }

  method selection_mode is rw is also<selection-mode> {
    Proxy.new:
      FETCH => -> $     { self.get_selection_mode    },
      STORE => -> $, \v { self.set_selection_mode(v) }
  }


  method get_selection_mode is also<get-selection-mode> {
    so hdy_title_bar_get_selection_mode($!ht);
  }

  method set_selection_mode (gboolean $selection_mode) is also<set-selection-mode> {
    my gboolean $s = $selection_mode;

    hdy_title_bar_set_selection_mode($!ht, $s);
  }

}

### /usr/include/libhandy-1/hdy-title-bar.h

sub hdy_title_bar_get_selection_mode (HdyTitleBar $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_title_bar_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_title_bar_set_selection_mode (HdyTitleBar $self, gboolean $selection_mode)
  is native(handy)
  is export
{ * }
