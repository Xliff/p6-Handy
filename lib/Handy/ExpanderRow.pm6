use v6.c;

use Handy::Raw::Types;
use Handy::Raw::ExpanderRow;

use Handy::ActionRow;

our subset HdyExpanderRowAncestry is export of Mu
  where HdyExpanderRow | HdyActionRowAncestry;

class Handy::ExpanderRow is Handy::ActionRow {
  has HdyExpanderRow $!her;

  submethod BUILD ( :$expander-row ) {
    self.setHdyExpansionRow($expander-row) if $expander-row;
  }

  method setHdyExpanderRow (HdyExpanderRowAncestry $_) {
    my $to-parent;

    $!her = do {
      when HdyExpanderRow {
        $to-parent = cast(HdyActionRow, $_);
        $_;
      }
      default {
        $to-parent = $_;
        cast(HdyExpanderRow, $_);
      }
    }
    self.setHdyActionRow($to-parent);
  }

  multi method new (HdyExpanderRowAncestry $expander-row, :$ref = True) {
    return Nil unless $expander-row;

    my $o = self.bless(:$expander-row);
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $expander-row = hdy_expander_row_new();

    $expander-row ?? self.bless( :$expander-row ) !! Nil;
  }

  method enable_expansion is rw {
    Proxy.new:
      FETCH => -> $     { self.get_enable_expansion    },
      STORE => -> $, \v { self.set_enable_expansion(v) }
  }

  method expanded is rw {
    Proxy.new:
      FETCH => -> $     { self.get_expanded    },
      STORE => -> $, \v { self.set_expanded(v) }
  }

  method icon_name is rw {
    Proxy.new:
      FETCH => -> $     { self.get_icon_name    },
      STORE => -> $, \v { self.set_icon_name(v) }
  }

  method show_enable_switch is rw {
    Proxy.new:
      FETCH => -> $     { self.get_show_enable_switch    },
      STORE => -> $, \v { self.set_show_enable_switch(v) }
  }

  method subtitle is rw {
    Proxy.new:
      FETCH => -> $     { self.get_subtitle    },
      STORE => -> $, \v { self.set_subtitle(v) }
  }

  method use_underline is rw {
    Proxy.new:
      FETCH => -> $     { self.get_use_underline    },
      STORE => -> $, \v { self.set_use_underline(v) }
  }

  method add_action (GtkWidget() $widget) {
    hdy_expander_row_add_action($!her, $widget);
  }

  method add_prefix (GtkWidget() $widget) {
    hdy_expander_row_add_prefix($!her, $widget);
  }

  method get_enable_expansion {
    so hdy_expander_row_get_enable_expansion($!her);
  }

  method get_expanded {
    so hdy_expander_row_get_expanded($!her);
  }

  method get_icon_name {
    hdy_expander_row_get_icon_name($!her);
  }

  method get_show_enable_switch {
    so hdy_expander_row_get_show_enable_switch($!her);
  }

  method get_subtitle {
    hdy_expander_row_get_subtitle($!her);
  }

  method get_use_underline {
    so hdy_expander_row_get_use_underline($!her);
  }

  method set_enable_expansion (Int() $enable_expansion) {
    my gboolean $b = $enable_expansion.so.Int;

    hdy_expander_row_set_enable_expansion($!her, $b);
  }

  method set_expanded (Int() $expanded) {
    my gboolean $b = $expanded.so.Int;

    hdy_expander_row_set_expanded($!her, $b);
  }

  method set_icon_name (Str() $icon_name) {
    hdy_expander_row_set_icon_name($!her, $icon_name);
  }

  method set_show_enable_switch (Int() $show_enable_switch) {
    my gboolean $b = $show_enable_switch.so.Int;

    hdy_expander_row_set_show_enable_switch($!her, $b);
  }

  method set_subtitle (Str() $subtitle) {
    hdy_expander_row_set_subtitle($!her, $subtitle);
  }

  method set_use_underline (Int() $use_underline) {
    my gboolean $b = $use_underline.so.Int;

    hdy_expander_row_set_use_underline($!her, $b);
  }

}
