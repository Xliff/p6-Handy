use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::SearchBar;

use GTK::Bin;

class Handy::SearchBar is GTK::Bin {
  has HdySearchBar $!hsb is implementor;

  submethod BUILD(:$searchbar) {
    self.setHdySearchBar($searchbar) if $searchbar;
  }

  method Handy::Raw::Definitions::HdySearchBar
    is also<HdySearchBar>
    is also<HdySearchBar>
  { $!hk }

  method setHdySearchBar (HdySearchBarAncestry $_) {
    return unless $_;

    my $to-parent;
    $!hk = do {
      when HdySearchBar {
        $to-parent = cast(GtkBin, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdySearchBar, $_);
      }
    };
    self.setGtkBin($to-parent);
  }

  multi method new (HdySearchBarAncestry $searchbar, :$ref = True) {
    return Nil unless $searchbar;

    my $o = self.bless( :$searchbar );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    hdy_search_bar_new();
  }

  method search_mode is rw is also<search-mode> {
    Proxy.new:
      FETCH => -> $     { self.get_search_mode    },
      STORE => -> $, \v { self.set_search_mode(v) }
  }

  method show_close_button is rw is also<show-close-button> {
    Proxy.new:
      FETCH => -> $     { self.get_show_close_button    },
      STORE => -> $, \v { self.set_show_close_button(v) }
  }

  method connect_entry (GtkEntry() $entry) is also<connect-entry> {
    hdy_search_bar_connect_entry($!hsb, $entry);
  }

  method get_search_mode is also<get-search-mode> {
    so hdy_search_bar_get_search_mode($!hsb);
  }

  method get_show_close_button is also<get-show-close-button> {
    so hdy_search_bar_get_show_close_button($!hsb);
  }

  method handle_event (GdkEvent() $event) is also<handle-event> {
    hdy_search_bar_handle_event($!hsb, $event);
  }

  method set_search_mode (Int() $search_mode) is also<set-search-mode> {
    my gboolean $s = $search_mode.so.Int;

    hdy_search_bar_set_search_mode($!hsb, $s);
  }

  method set_show_close_button (Int() $visible) is also<set-show-close-button> {
    my gboolean $v = $visible.so.Int;

    hdy_search_bar_set_show_close_button($!hsb, $v);
  }

}
