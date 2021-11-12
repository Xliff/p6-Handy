use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::TabBar;

use GTK::Bin;
use GTK::Widget;

our subset HdyTabBarAncestry is export of Mu
  where HdyTabBar | GtkBinAncestry;

  class Handy::TabBar is GTK::Bin {
    has HdyTabBar $!htb;

    submethod BUILD(:$handy-tab-bar) {
      self.setHdyTabBar($handy-tab-bar) if $handy-tab-bar;
    }

    method Handy::Raw::Definitions::HdyTabBar
      is also<HdyTabBar>
    { $!htb }

    method setHdyTabBar (HdyTabBarAncestry $_) {
      return unless $_;
      my $to-parent;
      $!htb = do {
        when HdyTabBar {
          $to-parent = cast(GtkBin, $_);
          $_;
        }

        default {
          $to-parent = $_;
          cast(HdyTabBar, $_);
        }
      };
      self.setGtkBin($to-parent);
    }

    multi method new (HdyTabBarAncestry $handy-tab-bar, :$ref = True) {
      return Nil unless $handy-tab-bar;

      my $o = self.bless( :$handy-tab-bar );
      $o.ref if $ref;
      $o;
    }
    multi method new {
      my $handy-tab-bar = hdy_tab_bar_new();

      $handy-tab-bar ?? self.bless( :$handy-tab-bar ) !! Nil;
    }

    method autohide is rw {
      Proxy.new:
        FETCH => -> $     { self.get_autohide    },
        STORE => -> $, \v { self.set_autohide(v) }
    }

    method end_action_widget is rw is also<end-action-widget> {
      Proxy.new:
        FETCH => -> $     { self.get_end_action_widget    },
        STORE => -> $, \v { self.set_end_action_widget(v) }
    }

    method expand_tabs is rw is also<expand-tabs> {
      Proxy.new:
        FETCH => -> $     { self.get_expand_tabs    },
        STORE => -> $, \v { self.set_expand_tabs(v) }
    }

    method extra_drag_dest_targets is rw is also<extra-drag-dest-targets> {
      Proxy.new:
        FETCH => -> $     { self.get_extra_drag_dest_targets    },
        STORE => -> $, \v { self.set_extra_drag_dest_targets(v) }
    }

    method inverted is rw {
      Proxy.new:
        FETCH => -> $     { self.get_inverted    },
        STORE => -> $, \v { self.set_inverted(v) }
    }

    method start_action_widget is rw is also<start-action-widget> {
      Proxy.new:
        FETCH => -> $     { self.get_start_action_widget    },
        STORE => -> $, \v { self.set_start_action_widget(v) }
    }

    method view is rw {
      Proxy.new:
        FETCH => -> $     { self.get_view    },
        STORE => -> $, \v { self.set_view(v) }
    }

    method get_autohide is also<get-autohide> {
      so hdy_tab_bar_get_autohide($!htb);
    }

    method get_end_action_widget ( :$raw = False)
      is also<get-end-action-widget>
    {
      propReturnObject(
        hdy_tab_bar_get_end_action_widget($!htb),
        $raw,
        |GTK::Widget.getTypePair
      );
    }

    method get_expand_tabs is also<get-expand-tabs> {
      so hdy_tab_bar_get_expand_tabs($!htb);
    }

    method get_extra_drag_dest_targets ( :$raw = False )
      is also<get-extra-drag-dest-targets>
    {
      propReturnObject(
        hdy_tab_bar_get_extra_drag_dest_targets($!htb),
        $raw,
        |GTK::TargetList.getTypepair
      );
    }

    method get_inverted is also<get-inverted> {
      so hdy_tab_bar_get_inverted($!htb);
    }

    method get_is_overflowing is also<get-is-overflowing> {
      so hdy_tab_bar_get_is_overflowing($!htb);
    }

    method get_start_action_widget ( :$raw = False)
      is also<get-start-action-widget>
    {
      propReturnObject(
        hdy_tab_bar_get_start_action_widget($!htb),
        $raw,
        |GTK::Widget.getTypePair
      );
    }

    method get_tabs_revealed is also<get-tabs-revealed> {
      so hdy_tab_bar_get_tabs_revealed($!htb);
    }

    method get_view ( :$raw = False ) is also<get-view> {
      propReturnObject(
        hdy_tab_bar_get_view($!htb),
        $raw,
        |Handy::TabView.getTypePair
      );
    }

    method set_autohide (Int() $autohide) is also<set-autohide> {
      my gboolean $a = $autohide.so.Int;

      hdy_tab_bar_set_autohide($!htb, $a);
    }

    method set_end_action_widget (GtkWidget() $widget)
      is also<set-end-action-widget>
    {
      hdy_tab_bar_set_end_action_widget($!htb, $widget);
    }

    method set_expand_tabs (Int() $expand_tabs) is also<set-expand-tabs> {
      my gboolean $e = $expand_tabs.so.Int;

      hdy_tab_bar_set_expand_tabs($!htb, $e);
    }

    method set_extra_drag_dest_targets (
      GtkTargetList() $extra_drag_dest_targets
    )
      is also<set-extra-drag-dest-targets>
    {
      hdy_tab_bar_set_extra_drag_dest_targets($!htb, $extra_drag_dest_targets);
    }

    method set_inverted (Int() $inverted) is also<set-inverted> {
      my gboolean $i = $inverted.so.Int;

      hdy_tab_bar_set_inverted($!htb, $i);
    }

    method set_start_action_widget (GtkWidget() $widget)
      is also<set-start-action-widget>
    {
      hdy_tab_bar_set_start_action_widget($!htb, $widget);
    }

    method set_view (HdyTabView() $view) is also<set-view> {
      hdy_tab_bar_set_view($!htb, $view);
    }

  }
