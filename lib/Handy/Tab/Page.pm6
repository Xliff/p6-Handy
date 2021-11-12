use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::TabView;

use GTK::Widget;

use GIO::Roles::Icon;

our subset HdyTabPageAncestry is export of Mu
  where HdyTabPage | GObject;

class Handy::Tab::Page {
  also does GLib::Roles::Object;

  has HdyTabPage $!htp is implementor;

  submethod BUILD ( :$handy-tab-page ) {
    self.setHdyTabPage($handy-tab-page) if $handy-tab-page;
  }

  method setHdyTabPage (HdyTabPageAncestry $_) {
    my $to-parent;

    $!htp = do {
      when HdyTabPage {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyTabPage, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Handy::Raw::HdyTabPage
    is also<HdyTabPage>
  { $!htp }

  multi method new (HdyTabPageAncestry $handy-tab-page, :$ref = True) {
    return Nil unless $handy-tab-page;

    my $o = self.bless( :$handy-tab-page );
    $o.ref if $ref;
    $o;
  }

  method icon is rw {
    Proxy.new:
      FETCH => -> $     { self.get_icon    },
      STORE => -> $, \v { self.set_icon(v) }
  }

  method indicator_activatable is rw is also<indicator-activatable> {
    Proxy.new:
      FETCH => -> $     { self.get_indicator_activatable    },
      STORE => -> $, \v { self.set_indicator_activatable(v) }
  }

  method indicator_icon is rw is also<indicator-icon> {
    Proxy.new:
      FETCH => -> $     { self.get_indicator_icon    },
      STORE => -> $, \v { self.set_indicator_icon(v) }
  }

  method loading is rw {
    Proxy.new:
      FETCH => -> $     { self.get_loading    },
      STORE => -> $, \v { self.set_loading(v) }
  }

  method needs_attention is rw is also<needs-attention> {
    Proxy.new:
      FETCH => -> $     { self.get_needs_attention    },
      STORE => -> $, \v { self.set_needs_attention(v) }
  }

  method title is rw {
    Proxy.new:
      FETCH => -> $     { self.get_title    },
      STORE => -> $, \v { self.set_title(v) }
  }

  method tooltip is rw {
    Proxy.new:
      FETCH => -> $     { self.get_tooltip    },
      STORE => -> $, \v { self.set_tooltip(v) }
  }

  method get_child ( :$raw = False ) is also<get-child> {
    propReturnObject(
      hdy_tab_page_get_child($!htp),
      $raw,
      |GTK::Widget.getTypePair
    );
  }

  method get_icon ( :$raw = False ) is also<get-icon> {
    propReturnObject(
      hdy_tab_page_get_icon($!htp),
      $raw,
      |GIO::Icon.getTypePair
    );
  }

  method get_indicator_activatable is also<get-indicator-activatable> {
    so hdy_tab_page_get_indicator_activatable($!htp);
  }

  method get_indicator_icon ( :$raw = False ) is also<get-indicator-icon> {
    propReturnObject(
      hdy_tab_page_get_indicator_icon($!htp),
      $raw,
      |GIO::Icon.getTypePair
    );
  }

  method get_loading is also<get-loading> {
    so hdy_tab_page_get_loading($!htp);
  }

  method get_needs_attention is also<get-needs-attention> {
    so hdy_tab_page_get_needs_attention($!htp);
  }

  method get_parent ( :$raw = False ) is also<get-parent> {
    propReturnObject(
      hdy_tab_page_get_parent($!htp),
      $raw,
      |Handy::Tab::Page.getTypePair
    );
  }

  method get_pinned is also<get-pinned> {
    so hdy_tab_page_get_pinned($!htp);
  }

  method get_selected is also<get-selected> {
    so hdy_tab_page_get_selected($!htp);
  }

  method get_title is also<get-title> {
    hdy_tab_page_get_title($!htp);
  }

  method get_tooltip is also<get-tooltip> {
    hdy_tab_page_get_tooltip($!htp);
  }

  method set_icon (GIcon() $icon) is also<set-icon> {
    hdy_tab_page_set_icon($!htp, $icon);
  }

  method set_indicator_activatable (Int() $activatable) is also<set-indicator-activatable> {
    my gboolean $a = $activatable.so.Int;

    hdy_tab_page_set_indicator_activatable($!htp, $a);
  }

  method set_indicator_icon (GIcon() $indicator_icon) is also<set-indicator-icon> {
    hdy_tab_page_set_indicator_icon($!htp, $indicator_icon);
  }

  method set_loading (Int() $loading) is also<set-loading> {
    my gboolean $l = $loading.so.Int;

    hdy_tab_page_set_loading($!htp, $l);
  }

  method set_needs_attention (Int() $needs_attention) is also<set-needs-attention> {
    my gboolean $n = $needs_attention.so.int;

    hdy_tab_page_set_needs_attention($!htp, $n);
  }

  method set_title (Str() $title) is also<set-title> {
    hdy_tab_page_set_title($!htp, $title);
  }

  method set_tooltip (Str() $tooltip) is also<set-tooltip> {
    hdy_tab_page_set_tooltip($!htp, $tooltip);
  }

}
