use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::ActionRow;

use Handy::PreferencesRow;

our subset HdyActionRowAncestry is export of Mu
  where HdyActionRow | HdyPreferencesRowAncestry;

class Handy::ActionRow is Handy::PreferencesRow {
  has HdyActionRow $!har is implementor;

  submethod BUILD ( :$handy-action-row ) {
    self.setHdyActionRow($handy-action-row) if $handy-action-row;
  }

  method setHdyActionRow (HdyActionRowAncestry $_) {
    my $to-parent;

    $!har = do {
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

  method Handy::Raw::Definitions::HdyActionRow
    is also<HdyActionRow>
  { $!har }

  multi method new (HdyActionRowAncestry $handy-action-row, :$ref = True) {
    return Nil unless $handy-action-row;

    my $o = self.bless( :$handy-action-row );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-action-row = hdy_action_row_new();

    $handy-action-row ?? self.bless( :$handy-action-row ) !! Nil;
  }

  method activatable_widget is rw is also<activatable-widget> {
    Proxy.new:
      FETCH => -> $     { self.get_activatable_widget    },
      STORE => -> $, \v { self.set_activatable_widget(v) }
  }

  method icon_name is rw is also<icon-name> {
    Proxy.new:
      FETCH => -> $     { self.get_icon_name    },
      STORE => -> $, \v { self.set_icon_name(v) }
  }

  method subtitle is rw {
    Proxy.new:
      FETCH => -> $     { self.get_subtitle    },
      STORE => -> $, \v { self.set_subtitle(v) }
  }

  method subtitle_lines is rw is also<subtitle-lines> {
    Proxy.new:
      FETCH => -> $     { self.get_subtitle_lines    },
      STORE => -> $, \v { self.set_subtitle_lines(v) }
  }

  method title_lines is rw is also<title-lines> {
    Proxy.new:
      FETCH => -> $     { self.get_title_lines    },
      STORE => -> $, \v { self.set_title_lines(v) }
  }

  method use_underline is rw is also<use-underline> {
    Proxy.new:
      FETCH => -> $     { self.get_use_underline    },
      STORE => -> $, \v { self.set_use_underline(v) }
  }

  method activate {
    hdy_action_row_activate($!har);
  }

  method add_prefix (GtkWidget() $widget) is also<add-prefix> {
    hdy_action_row_add_prefix($!har, $widget);
  }

  method get_activatable_widget (:$raw = False) is also<get-activatable-widget> {
    # cw: Should there be an attempt to create the exact widget?
    propReturnObject(
      hdy_action_row_get_activatable_widget($!har),
      $raw,
      |GTK::Widget.getTypePair
    );
  }

  method get_icon_name is also<get-icon-name> {
    hdy_action_row_get_icon_name($!har);
  }

  method get_subtitle is also<get-subtitle> {
    hdy_action_row_get_subtitle($!har);
  }

  method get_subtitle_lines is also<get-subtitle-lines> {
    hdy_action_row_get_subtitle_lines($!har);
  }

  method get_title_lines is also<get-title-lines> {
    hdy_action_row_get_title_lines($!har);
  }

  method get_use_underline is also<get-use-underline> {
    so hdy_action_row_get_use_underline($!har);
  }

  method set_activatable_widget (GtkWidget() $widget) is also<set-activatable-widget> {
    hdy_action_row_set_activatable_widget($!har, $widget);
  }

  method set_icon_name (Str() $icon_name) is also<set-icon-name> {
    hdy_action_row_set_icon_name($!har, $icon_name);
  }

  method set_subtitle (Str() $subtitle) is also<set-subtitle> {
    hdy_action_row_set_subtitle($!har, $subtitle);
  }

  method set_subtitle_lines (Int() $subtitle_lines) is also<set-subtitle-lines> {
    my gint $s = $subtitle_lines;

    hdy_action_row_set_subtitle_lines($!har, $s);
  }

  method set_title_lines (Int() $title_lines) is also<set-title-lines> {
    my gint $t = $title_lines;

    hdy_action_row_set_title_lines($!har, $t);
  }

  method set_use_underline (Int() $use_underline) is also<set-use-underline> {
    my gboolean $u = $use_underline.so.Int;

    hdy_action_row_set_use_underline($!har, $u);
  }

}
