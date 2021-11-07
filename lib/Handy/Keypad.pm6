use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::Keypad;

use GTK::Bin;

our subset HdyKeypadAncestry is export of Mu
  where HdyKeypad | GtkBinAncestry;

class Handy::Keypad is GTK::Bin {
  has HdyKeypad $!hk is implementor;

  submethod BUILD(:$handy-keypad) {
    self.setHdyKeypad($handy-keypad) if $handy-keypad;
  }

  method Handy::Raw::Definitions::HdyKeypad
    is also<HdyKeypad>
  { $!hk }

  method setHdyKeypad (HdyKeypadAncestry $_) {
    return unless $_;

    my $to-parent;
    $!hk = do {
      when HdyKeypad {
        $to-parent = cast(GtkBin, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyKeypad, $_);
      }
    };
    self.setGtkBin($to-parent);
  }

  multi method new (HdyKeypadAncestry $handy-keypad, :$ref = True) {
    return Nil unless $handy-keypad;

    my $o = self.bless( :$handy-keypad );
    $o.ref if $ref;
    $o;
  }
  multi method new (Int() $letters_visible) {
    my gboolean $l = $letters_visible.so.Int;

    hdy_keypad_new($!hk, $l);
  }

  method column_spacing is rw is also<column-spacing> {
    Proxy.new:
      FETCH => -> $     { self.get_column_spacing    },
      STORE => -> $, \v { self.set_column_spacing(v) }
  }

  method end_action is rw is also<end-action> {
    Proxy.new:
      FETCH => -> $     { self.get_end_action    },
      STORE => -> $, \v { self.set_end_action(v) }
  }

  method entry is rw {
    Proxy.new:
      FETCH => -> $     { self.get_entry    },
      STORE => -> $, \v { self.set_entry(v) }
  }

  method letters_visible is rw is also<letters-visible> {
    Proxy.new:
      FETCH => -> $     { self.get_letters_visible    },
      STORE => -> $, \v { self.set_letters_visible(v) }
  }

  method row_spacing is rw is also<row-spacing> {
    Proxy.new:
      FETCH => -> $     { self.get_row_spacing    },
      STORE => -> $, \v { self.set_row_spacing(v) }
  }

  method start_action is rw is also<start-action> {
    Proxy.new:
      FETCH => -> $     { self.get_start_action    },
      STORE => -> $, \v { self.set_start_action(v) }
  }

  method symbols_visible is rw is also<symbols-visible> {
    Proxy.new:
      FETCH => -> $     { self.get_symbols_visible    },
      STORE => -> $, \v { self.set_symbols_visible(v) }
  }

  method get_column_spacing is also<get-column-spacing> {
    hdy_keypad_get_column_spacing($!hk);
  }

  method get_end_action ( :$raw = False ) is also<get-end-action> {
    propReturnObject(
      hdy_keypad_get_end_action($!hk),
      $raw,
      GtkWidget,
      GTK::Widget
    )
  }

  method get_entry ( :$raw = False ) is also<get-entry> {
    propReturnObject(
      hdy_keypad_get_entry($!hk),
      $raw,
      GtkEntry,
      GTK::Entry
    )
  }

  method get_letters_visible is also<get-letters-visible> {
    so hdy_keypad_get_letters_visible($!hk);
  }

  method get_row_spacing is also<get-row-spacing> {
    hdy_keypad_get_row_spacing($!hk);
  }

  method get_start_action ( :$raw = False ) is also<get-start-action> {
    propReturnObject(
      hdy_keypad_get_start_action($!hk),
      $raw,
      GtkWidget,
      GTK::Widget
    )
  }

  method get_symbols_visible is also<get-symbols-visible> {
    so hdy_keypad_get_symbols_visible($!hk);
  }

  method set_column_spacing (Int() $spacing) is also<set-column-spacing> {
    my guint $s = $spacing;

    hdy_keypad_set_column_spacing($!hk, $s);
  }

  method set_end_action (GtkWidget() $end_action) is also<set-end-action> {
    hdy_keypad_set_end_action($!hk, $end_action);
  }

  method set_entry (GtkEntry() $entry) is also<set-entry> {
    hdy_keypad_set_entry($!hk, $entry);
  }

  method set_letters_visible (Int() $letters_visible)
    is also<set-letters-visible>
  {
    my gboolean $l = $letters_visible.so.Int;

    hdy_keypad_set_letters_visible($!hk, $l);
  }

  method set_row_spacing (Int() $spacing) is also<set-row-spacing> {
    my guint $s = $spacing;

    hdy_keypad_set_row_spacing($!hk, $s);
  }

  method set_start_action (GtkWidget() $start_action)
    is also<set-start-action>
  {
    hdy_keypad_set_start_action($!hk, $start_action);
  }

  method set_symbols_visible (Int() $symbols_visible)
    is also<set-symbols-visible>
  {
    my gboolean $s = $symbols_visible.so.Int;

    hdy_keypad_set_symbols_visible($!hk, $s);
  }

}
