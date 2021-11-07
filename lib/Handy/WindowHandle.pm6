use v6.c;

use NativeCall;

use Handy::Raw::Types;

use GTK::EventBox;

class Handy::WindowHandle is GTK::EventBox {
  has HdyWindowHandle $!hwh;

  submethod BUILD( :$handy-window-handle ) {
    self.setGtkEventBox($handy-window-handle) if $handy-window-handle;
  }

  method setHdyWindowHandle (HdyWindowHandleAncestry $_) {
    my $to-parent;

    $!hc = do {
      when HdyWindowHandle  {
        $to-parent = cast(GtkEventBox, $_);
        $_;
      }

      when HdySwipeable {
        $to-parent = cast(GtkEventBox, $_);
        $!hs = $_;
        cast(HdyWindowHandle, $_);
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
  { $!hc }

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
