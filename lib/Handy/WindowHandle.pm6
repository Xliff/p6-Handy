use v6.c;

use Method::Also;

use NativeCall;

use Handy::Raw::Types;

use GTK::EventBox;

our subset HdyWindowHandleAncestry is export of Mu
  where HdyWindowHandle | GtkEventBoxAncestry;

class Handy::WindowHandle is GTK::EventBox {
  has HdyWindowHandle $!hwh;

  submethod BUILD( :$handy-window-handle ) {
    self.setGtkEventBox($handy-window-handle) if $handy-window-handle;
  }

  method setHdyWindowHandle (HdyWindowHandleAncestry $_) {
    my $to-parent;

    $!hwh = do {
      when HdyWindowHandle  {
        $to-parent = cast(GtkEventBox, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyWindowHandle, $_);
      }
    }
    self.setGtkEventBox($to-parent);
    self.roleInit-HdySwipeable;
  }

  method GTK::Raw::Definitions::HdyWindowHandle
    is also<HdyWindowHandle>
  { $!hwh }

  multi method new (
    HdyWindowHandleAncestry $handy-window-handle,
                            :$ref                 = True
  ) {
    return Nil unless $handy-window-handle;

    my $o = self.bless( :$handy-window-handle );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-window-handle = hdy_window_handle_new();

    $handy-window-handle ?? self.bless( :$handy-window-handle ) !! Nil;
  }

}

### /usr/include/libhandy-1/hdy-window-handle.h

sub hdy_window_handle_new ()
  returns HdyWindowHandle
  is native(handy)
  is export
{ * }
