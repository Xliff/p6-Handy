use v6.c;

use Method::Also;

use GLib::Raw::Traits;
use Handy::Raw::Types;
use Handy::Raw::Keypad;

use GTK::Bin;
use GTK::Entry;

use GLib::Roles::Implementor;

our subset HdyKeypadAncestry is export of Mu
  where HdyKeypad | GtkBinAncestry;

class Handy::Keypad is GTK::Bin {
  has HdyKeypad $!hk is implementor;

  submethod BUILD ( :$handy-keypad ) {
    self.setHdyKeypad($handy-keypad) if $handy-keypad
  }

  method setHdyKeypad (HdyKeypadAncestry $_) {
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
    }
    self.setBin($to-parent);
  }

  method Handy::Raw::Definitions::HdyKeypad
    is also<HdyKeypad>
  { $!hk }

  multi method new (
     $handy-keypad where * ~~ HdyKeypadAncestry,

    :$ref = True
  ) {
    return unless $handy-keypad;

    my $o = self.bless( :$handy-keypad );
    $o.ref if $ref;
    $o;
  }
  multi method new (
    Int() $symbols_visible,
    Int() $letters_visible
  ) {
    my gboolean ($s, $l) =
      ($symbols_visible, $letters_visible).map( *.so.Int );

    my $handy-keypad = hdy_keypad_new($s, $l);

    $handy-keypad ?? self.bless( :$handy-keypad ) !! Nil
  }

  # Type: uint
  method column-spacing is rw  is g-property is also<column_spacing> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('column-spacing', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('column-spacing', $gv);
      }
    );
  }

  # Type: GtkWidget
  method end-action ( :$raw = False )
    is rw
    is g-property
    is also<end_action>
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('end-action', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GTK::Widget.getTypePair
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('end-action', $gv);
      }
    );
  }

  # Type: GtkEntry
  method entry ( :$raw = False ) is rw  is g-property {
    my $gv = GLib::Value.new( GTK::Entry.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('entry', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GTK::Entry.getTypePair
        );
      },
      STORE => -> $, GtkEntry() $val is copy {
        $gv.object = $val;
        self.prop_set('entry', $gv);
      }
    );
  }

  # Type: boolean
  method letters-visible is rw  is g-property is also<letters_visible> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('letters-visible', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('letters-visible', $gv);
      }
    );
  }

  # Type: uint
  method row-spacing is rw  is g-property is also<row_spacing> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('row-spacing', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('row-spacing', $gv);
      }
    );
  }

  # Type: GtkWidget
  method start-action ( :$raw = False )
    is rw
    is g-property
    is also<start_action>
  {
    my $gv = GLib::Value.new( GTK::Widget.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('start-action', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GTK::Widget.getTypePair
        );
      },
      STORE => -> $, GtkWidget() $val is copy {
        $gv.object = $val;
        self.prop_set('start-action', $gv);
      }
    );
  }

  # Type: boolean
  method symbols-visible is rw  is g-property is also<symbols_visible> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('symbols-visible', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('symbols-visible', $gv);
      }
    );
  }

  method get_column_spacing is also<get-column-spacing> {
    hdy_keypad_get_column_spacing($!hk);
  }

  method get_end_action (
    :$raw           = False#,
    #:quick(:$fast)  = False,
    #:slow(:$proper) = $fast.not
  )
    is also<get-end-action>
  {
    propReturnObject(
      hdy_keypad_get_end_action($!hk),
      $raw,
      |GTK::Widget.getTypePair
    )
  }

  method get_entry ( :$raw = False ) is also<get-entry> {
    propReturnObject(
      hdy_keypad_get_entry($!hk),
      $raw,
      |GTK::Entry.getTypePair
    );
  }

  method get_letters_visible is also<get-letters-visible> {
    so hdy_keypad_get_letters_visible($!hk);
  }

  method get_row_spacing is also<get-row-spacing> {
    hdy_keypad_get_row_spacing($!hk);
  }

  method get_start_action (
    :$raw           = False#,
    #:quick(:$fast)  = False,
    #:slow(:$proper) = $fast.not
  )
    is also<get-start-action>
  {
    propReturnObject(
      hdy_keypad_get_start_action($!hk),
      $raw,
      |GTK::Widget.getTypePair
    );
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
    my gboolean  $l = $letters_visible.so.Int;

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
