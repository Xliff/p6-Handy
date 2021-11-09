use v6.c;

use NativeCall;

use Method::Also;

use Handy::Raw::Types;

use GTK::ApplicationWindow;

our subset HdyApplicationWindowAncestry is export of Mu
  when HdyApplicationWindow | GtkApplicationWindowAncestry;

class Handy::ApplicationWindow is GTK::ApplicationWindow {
  has HdyApplicationWindow $!haw is implementor;

  submethod BUILD(:$handy-application-window) {
    self.setHdyApplicationWindow($handy-application-window)
      if $handy-application-window;
  }

  method Handy::Raw::Definitions::HdyApplicationWindow
    is also<HdyApplicationWindow>
  { $!haw }

  method setHdyApplicationWindow (HdyApplicationWindowAncestry $_) {
    return unless $_;

    my $to-parent;
    $!haw = do {
      when HdyApplicationWindow {
        $to-parent = cast(GtkApplicationWindow, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyApplicationWindow, $_);
      }
    };
    self.setGtkApplicationWindow($to-parent);
  }

  multi method new (
    HdyApplicationWindowAncestry $handy-application-window,
                                 :$ref                      = True
  ) {
    return Nil unless $handy-application-window;

    my $o = self.bless( :$handy-application-window );
    $o.ref if $ref;
    $o;
  }

  multi method new {
    my $handy-application-window = hdy_application_window_new();

    $handy-application-window ??
      self.bless( :$handy-application-window ) !! Nil
  }

}

### /usr/include/libhandy-1/hdy-application-window.h

sub hdy_application_window_new ()
  returns GtkWidget
  is native(gtk)
  is export
{ * }
