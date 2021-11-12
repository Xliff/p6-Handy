use v6.c;

use NativeCall;

use Handy::Raw::Types;

role Handy::Roles::Signals::TabBar {
  has %!signals-htb;

  # HdyTabBar, HdyTabPage, GdkDragContext, GtkSelectionData, guint, guint, gpointer
  method connect-extra-drag-data-received (
    $obj,
    $signal = 'extra-drag-data-received',
    &handler?
  ) {
    my $hid;
    %!signals-htb{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-extra-drag-data-received($obj, $signal,
        -> $, $htp, $gdc, $gsd, $g1, $g2, $ud {
          CATCH {
            default { 𝒮.note($_) }
          }

          𝒮.emit( [self, $htp, $gdc, $gsd, $g1, $g2, $ud ] );
        },
        Pointer, 0
      );
      [ 𝒮.Supply, $obj, $hid ];
    };
    %!signals-htb{$signal}[0].tap(&handler) with &handler;
    %!signals-htb{$signal}[0];
  }
  
}

# HdyTabBar, HdyTabPage, GdkDragContext, GtkSelectionData, guint, guint, gpointer
sub g-connect-extra-drag-data-received(
  Pointer $app,
  Str $name,
  &handler (
    Pointer,
    HdyTabPage,
    GdkDragContext,
    GtkSelectionData,
    guint,
    guint,
    Pointer
  ),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
