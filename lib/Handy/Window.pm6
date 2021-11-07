use v6.c;

use Method::Also;

use Handy::Raw::Types;

use GTK::Window;

our subset HdyWindowAncestry is export of Mu
  where HdyWindow | GtkWindowAncestry;

class Handy::Window is GTK::Window {
  has HdyWindow $!hw is implementor;

  submethod BUILD(:$handy-window) {
    self.setHdyWindow($handy-window) if $handy-window;
  }

  method Handy::Raw::Definitions::HdyWindow
    is also<HdyWindow>
  { $!hw }

  method setHdyWindow (HdyWindowAncestry $_) {
    return unless $_;

    my $to-parent;
    $!hw = do {
      when HdyWindow {
        $to-parent = cast(GtkBin, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyWindow, $_);
      }
    };
    self.setGtkBin($to-parent);
  }

  multi method new (HdyWindowAncestry $handy-window, :$ref = True) {
    return Nil unless $handy-window;

    my $o = self.bless( :$handy-window );
    $o.ref if $ref;
    $o;
  }

  multi method new {
    my $handy-window = hdy_window_new();

    $handy-window ?? self.bless( :$handy-window ) !! Nil;
  }

}

### /usr/include/libhandy-1/hdy-window.h

sub hdy_window_new ()
  returns HdyWindow
  is native(handy)
  is export
{ * }
