use v6.c;

use NativeCall;

use Handy::Raw::Types;

role Handy::Roles::Signals::Swipeable {
  has %!signals-hs;

  # HdySwipeable, guint, gint64, gpointer
  method connect-child-switched (
    $obj,
    $signal = 'child-switched',
    &handler?
  ) {
    my $hid;
    %!signals-hs{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-child-switched($obj, $signal,
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
    %!signals-hs{$signal}[0].tap(&handler) with &handler;
    %!signals-hs{$signal}[0];
  }

}

# HdySwipeable, guint, gint64, gpointer
sub g-connect-child-switched(
  Pointer $app,
  Str $name,
  &handler (Pointer, guint, gint64, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
