use v6.c;

use Handy::Raw::Types;
use Handy::Raw::ActionRow;

use Handy::PreferencesRow;

our subset HdyActionRowAncestry is export of Mu
  where HdyActionRow | GtkListBoxAncestry;

class Handy::ActionRow is Handy::PreferencesRow {
  has HdyActionRow $!har;

  submethod BUILD ( :$actionrow ) {
    self.setHdyActionRow($action-row) if $action-row;
  }

  method setHdyActionRow (HdyActionRowAncestry $_) {
    my $to-parent;

    $!lbr = do {
      when HdyActionRow {
        $to-parent = cast(HdyPreferencesRow, $_);
        $_;
      }
      default {
        $to-parent = $_;
        cast(HdyActionRow, $_);
      }

    }
    self.setHdyPreferencesRow($to-parent);
  }

  multi method new (HdyActionRowAncestry $rpreferences-row, :$ref = True) {
    return Nil unless $actionrow;

    my $o = self.bless(:$actionrow);
    $o.ref if $ref;
    $o;
  }

  method new {
    my $action-row = hdy_action_row_new();

    $action-row ?? self.bless( :$action-row ) !! Nil;
  }

  method activatable_widget is rw {
    Proxy.new:
      FETCH => -> $     { self.get_activatable_widget    },
      STORE => -> $, \v { self.set_activatable_widget(v) }
  }

  method icon_name is rw {
    Proxy.new:
      FETCH => -> $     { self.get_icon_name    },
      STORE => -> $, \v { self.set_icon_name(v) }
  }

  method subtitle is rw {
    Proxy.new:
      FETCH => -> $     { self.get_subtitle    },
      STORE => -> $, \v { self.set_subtitle(v) }
  }

  method subtitle_lines is rw {
    Proxy.new:
      FETCH => -> $     { self.get_subtitle_lines    },
      STORE => -> $, \v { self.set_subtitle_lines(v) }
  }

  method title_lines is rw {
    Proxy.new:
      FETCH => -> $     { self.get_title_lines    },
      STORE => -> $, \v { self.set_title_lines(v) }
  }

  method use_underline is rw {
    Proxy.new:
      FETCH => -> $     { self.get_use_underline    },
      STORE => -> $, \v { self.set_use_underline(v) }
  }

  method activate {
    hdy_action_row_activate($!har);
  }

  method add_prefix (GtkWidget() $widget) {
    hdy_action_row_add_prefix($!har, $widget);
  }

  method get_activatable_widget (:$raw = False) {
    # cw: Should there be an attempt to create the exact widget?
    propReturnObject(
      hdy_action_row_get_activatable_widget($!har),
      $raw,
      GtkWidget,
      GTK::Widget
    );
  }

  method get_icon_name {
    hdy_action_row_get_icon_name($!har);
  }

  method get_subtitle {
    hdy_action_row_get_subtitle($!har);
  }

  method get_subtitle_lines {
    hdy_action_row_get_subtitle_lines($!har);
  }

  method get_title_lines {
    hdy_action_row_get_title_lines($!har);
  }

  method get_use_underline {
    so hdy_action_row_get_use_underline($!har);
  }

  method set_activatable_widget (GtkWidget() $widget) {
    hdy_action_row_set_activatable_widget($!har, $widget);
  }

  method set_icon_name (Str() $icon_name) {
    hdy_action_row_set_icon_name($!har, $icon_name);
  }

  method set_subtitle (Str() $subtitle) {
    hdy_action_row_set_subtitle($!har, $subtitle);
  }

  method set_subtitle_lines (Int() $subtitle_lines) {
    my gint $s = $subtitle_lines;

    hdy_action_row_set_subtitle_lines($!har, $s);
  }

  method set_title_lines (Int() $title_lines) {
    my gint $t = $title_lines;

    hdy_action_row_set_title_lines($!har, $t);
  }

  method set_use_underline (Int() $use_underline) {
    my gboolean $u = $use_underline.so.Int;

    hdy_action_row_set_use_underline($!har, $u);
  }

}
