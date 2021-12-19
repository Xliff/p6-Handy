use v6.c;

use Method::Also;
use NativeCall;

use Handy::Raw::Types;
use Handy::Raw::PreferencesWindow;

use Handy::Window;

our subset HdyPreferencesWindowAncestry is export of Mu
  where HdyPreferencesWindow | HdyWindowAncestry;

class Handy::Preferences::Windows is Handy::Window {
  has HdyPreferencesWindow $!hpw is implementor;

  submethod BUILD(:$handy-prefs-window) {
    self.setHdyPreferencesWindow($handy-prefs-window) if $handy-prefs-window;
  }

  method Handy::Raw::Definitions::HdyPreferencesWindow
    is also<HdyPreferencesWindow>
  { $!hpw }

  method setHdyPreferencesWindow (HdyPreferencesWindowAncestry $_) {
    return unless $_;

    my $to-parent;
    $!hpw = do {
      when HdyPreferencesWindow {
        $to-parent = cast(GtkBin, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyPreferencesWindow, $_);
      }
    };
    self.setGtkBin($to-parent);
  }

  multi method new (
    HdyPreferencesWindowAncestry $handy-prefs-window,
                                 :$ref                = True
  ) {
    return Nil unless $handy-prefs-window;

    my $o = self.bless( :$handy-prefs-window );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-prefs-window = hdy_preferences_window_new();

    $handy-prefs-window ?? self.bless( :$handy-prefs-window ) !! Nil;
  }

  method can_swipe_back is rw is also<can-swipe-back> {
    Proxy.new:
      FETCH => -> $     { self.get_can_swipe_back    },
      STORE => -> $, \v { self.set_can_swipe_back(v) }
  }

  method search_enabled is rw is also<search-enabled> {
    Proxy.new:
      FETCH => -> $     { self.get_search_enabled    },
      STORE => -> $, \v { self.set_search_enabled(v) }
  }

  method close_subpage is also<close-subpage> {
    hdy_preferences_window_close_subpage($!hpw);
  }

  method get_can_swipe_back is also<get-can-swipe-back> {
    so hdy_preferences_window_get_can_swipe_back($!hpw);
  }

  method get_search_enabled is also<get-search-enabled> {
    so hdy_preferences_window_get_search_enabled($!hpw);
  }

  method present_subpage (GtkWidget() $subpage) is also<present-subpage> {
    hdy_preferences_window_present_subpage($!hpw, $subpage);
  }

  method set_can_swipe_back (Int() $can_swipe_back)
    is also<set-can-swipe-back>
  {
    my gboolean $c = $can_swipe_back.so.Int;

    hdy_preferences_window_set_can_swipe_back($!hpw, $c);
  }

  method set_search_enabled (Int() $search_enabled)
    is also<set-search-enabled>
  {
    my gboolean $s = $search_enabled.so.Int;

    hdy_preferences_window_set_search_enabled($!hpw, $s);
  }
}
