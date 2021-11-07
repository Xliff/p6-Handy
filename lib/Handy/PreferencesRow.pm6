use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::PreferenceRow;

use GTK::ListBoxRow;

our subset HdyPreferencesRowAncestry is export of Mu
  where HdyPreferencesRow | GtkListBoxRowAncestry;

class Handy::PreferencesRow is GTK::ListBoxRow {
  has HdyPreferencesRow $!hpr is implementor;

  submethod BUILD ( :$preferences-row ) {
    self.setHdyPreferencesRow($preferences-row) if $preferences-row;
  }

  method setHdyPreferencesRow (HdyPreferencesRowAncestry $_) {
    my $to-parent;

    $!hpr = do {
      when HdyPreferencesRow {
        $to-parent = cast(GtkListBoxRow, $_);
        $_;
      }
      default {
        $to-parent = $_;
        cast(HdyPreferencesRow, $_);
      }

    }
    self.setGtkListBoxRow($to-parent);
  }

  method Handy::Raw::Definitions::HdyPreferencesRow
    is also<HandyPreferencesRow>
  { $!hpr }

  multi method new (HdyPreferencesRowAncestry $preferences-row, :$ref = True) {
    return Nil unless $preferences-row;

    my $o = self.bless( :$preferences-row );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $preference-row = hdy_preferences_row_new();

    $preference-row ?? self.bless( :$preference-row ) !! Nil;
  }

  method title is rw {
    Proxy.new:
      FETCH => -> $     { self.get_title    }
      STORE => -> $, \v { self.set_title(v) }
  }

  method use_underline is rw is also<use-underline> {
    Proxy.new:
      FETCH => -> $     { self.get_use_underline    },
      STORE => -> $, \v { self.set_use_underline(v) };
  }

  method get_title is also<get-title> {
    hdy_preferences_row_get_title($!hpr);
  }

  method set_title (Str() $title) is also<set-title> {
    hdy_preferences_row_set_title($!hpr, $title);
  }

  method get_use_underline is also<get-use-underline> {
    hdy_preferences_row_get_use_underline($!hpr);
  }

  method set_use_underline (Int() $use_underline) is also<set-use-underline> {
    my gboolean $u = $use_underline.so.Int;

    hdy_preferences_row_set_use_underline($!hpr, $u);
  }

}
