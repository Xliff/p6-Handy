use v6.c;

use NativeCall;

use Handy::Raw::Types;

use GLib::Roles::Signals::Generic;

role Handy::Roles::Signals::SwipeTracker {
  also does GLib::Roles::Signals::Generic;

  has %!signals-hst;

  # HdySwipeTracker, HdyNavigationDirection, gboolean, gpointer
  method connect-begin-swipe (
    $obj,
    $signal = 'begin-swipe',
    &handler?
  ) {
    my $hid;
    %!signals-hst{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-begin-swipe($obj, $signal,
        -> $, $hnd, $g, $ud {
          CATCH {
            default { 𝒮.note($_) }
          }

          𝒮.emit( [self, $hnd, $g, $ud ] );
        },
        Pointer, 0
      );
      [ 𝒮.Supply, $obj, $hid ];
    };
    %!signals-hst{$signal}[0].tap(&handler) with &handler;
    %!signals-hst{$signal}[0];
  }

  # HdySwipeTracker, gint64, gdouble, gpointer
  method connect-end-swipe (
    $obj,
    $signal = 'end-swipe',
    &handler?
  ) {
    my $hid;
    %!signals-hst{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-end-swipe($obj, $signal,
        -> $, $g1, $g2, $ud {
          CATCH {
            default { 𝒮.note($_) }
          }

          𝒮.emit( [self, $g1, $g2, $ud ] );
        },
        Pointer, 0
      );
      [ 𝒮.Supply, $obj, $hid ];
    };
    %!signals-hst{$signal}[0].tap(&handler) with &handler;
    %!signals-hst{$signal}[0];
  }

}

# HdySwipeTracker, HdyNavigationDirection, gboolean, gpointer
sub g-connect-begin-swipe(
  Pointer $app,
  Str $name,
  &handler (Pointer, HdyNavigationDirection, gboolean, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }

# HdySwipeTracker, gint64, gdouble, gpointer
sub g-connect-end-swipe(
  Pointer $app,
  Str $name,
  &handler (Pointer, gint64, gdouble, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
