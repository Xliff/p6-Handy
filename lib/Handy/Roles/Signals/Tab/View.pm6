use v6.c;

use NativeCall;

use Handy::Raw::Types;

use GLib::Raw::ReturnedValue;

use GLib::Roles::Signals::Generic;

role Handy::Roles::Signals::Tab::View {
  also does GLib::Roles::Signals::Generic;

  has %!signals-htp;

  # HdyTabView, HdyTabPage, gpointer
  method connect-tab-pabe (
    $obj,
    $signal,
    &handler?
  ) {
    my $hid;
    %!signals-htp{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-tab-page($obj, $signal,
        -> $, $htp, $ud {
          CATCH {
            default { 𝒮.note($_) }
          }

          𝒮.emit( [self, $htp, $ud ] );
        },
        Pointer, 0
      );
      [ 𝒮.Supply, $obj, $hid ];
    };
    %!signals-htp{$signal}[0].tap(&handler) with &handler;
    %!signals-htp{$signal}[0];
  }

  # HdyTabView, HdyTabPage, gint, gpointer
  method connect-page-reordered (
    $obj,
    $signal,
    &handler?
  ) {
    my $hid;
    %!signals-htp{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-page($obj, $signal,
        -> $, $htp, $g, $ud {
          CATCH {
            default { 𝒮.note($_) }
          }

          𝒮.emit( [self, $htp, $g, $ud ] );
        },
        Pointer, 0
      );
      [ 𝒮.Supply, $obj, $hid ];
    };
    %!signals-htp{$signal}[0].tap(&handler) with &handler;
    %!signals-htp{$signal}[0];
  }

  # HdyTabView, gpointer --> HdyTabView
  method connect-create-window (
    $obj,
    $signal = 'create-window',
    &handler?
  ) {
    my $hid;
    %!signals-htp{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-create-window($obj, $signal,
        -> $, $ud --> HdyTabView {
          CATCH {
            default { 𝒮.note($_) }
          }

          my $r = ReturnedValue.new;
          𝒮.emit( [self, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ 𝒮.Supply, $obj, $hid ];
    };
    %!signals-htp{$signal}[0].tap(&handler) with &handler;
    %!signals-htp{$signal}[0];
  }


}

# HdyTabView, HdyTabPage, gpointer
sub g-connect-tab-page(
  Pointer $app,
  Str $name,
  &handler (HdyTabView, HdyTabPage, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }

# HdyTabView, HdyTabPage, gint, gpointer
sub g-connect-page(
  Pointer $app,
  Str $name,
  &handler (HdyTabView, HdyTabPage, gint, Pointer),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }

# HdyTabView, gpointer --> HdyTabView
sub g-connect-create-window(
  Pointer $app,
  Str $name,
  &handler (HdyTabView, Pointer --> HdyTabView),
  Pointer $data,
  uint32 $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
