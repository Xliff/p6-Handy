use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::TabView;

use GTK::Bin;
use GIO::MenuModel;
use Handy::Tab::Page;

use GLib::Roles::Object;
use GIO::Roles::Icon;
use Handy::Roles::Signals::Tab::View;

our subset HdyTabViewAncestry is export of Mu
  where HdyTabView | GtkBinAncestry;

class Handy::Tab::View is GTK::Bin {
  also does Handy::Roles::Signals::Tab::View;

  has HdyTabView $!htv is implementor;

  submethod BUILD( :$handy-tab-view ) {
    self.setHdyTabView($handy-tab-view) if $handy-tab-view;
  }

  method Handy::Raw::Definitions::HdyTabView
    is also<HdyTabView>
  { $!htv }

  method setHdyTabView (HdyTabViewAncestry $_) {
    return unless $_;

    my $to-parent;
    $!htv = do {
      when HdyTabView {
        $to-parent = cast(GtkBin, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyTabView, $_);
      }
    };
    self.setGtkBin($to-parent);
  }

  multi method new (HdyTabViewAncestry $handy-tab-view, :$ref = True) {
    return Nil unless $handy-tab-view;

    my $o = self.bless( :$handy-tab-view );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-tab-view = hdy_tab_view_new();

    $handy-tab-view ?? self.bless( :$handy-tab-view ) !! Nil;
  }

  # Is originally:
  #
  method close-page is also<close_page> {
    self.connect($!htv);
  }

  # Is originally:
  # HdyTabView, gpointer --> HdyTabView
  method create-window is also<create_window> {
    self.connect-create-window($!htv);
  }

  # Is originally:
  # HdyTabView, HdyTabPage, gpointer --> void
  method indicator-activated is also<indicator_activated> {
    self.connect-tab-page($!htv, 'indicator-activated');
  }

  # Is originally:
  # HdyTabView, HdyTabPage, gint, gpointer --> void
  method page-attached is also<page_attached> {
    self.connect-page($!htv, 'page-attached');
  }

  # Is originally:
  # HdyTabView, HdyTabPage, gint, gpointer --> void
  method page-detached is also<page_detached> {
    self.connect-page($!htv, 'page-detached');
  }

  # Is originally:
  # HdyTabView, HdyTabPage, gint, gpointer --> void
  method page-reordered is also<page_reordered> {
    self.connect-page($!htv, 'page-reordered');
  }

  # Is originally:
  # HdyTabView, HdyTabPage, gpointer --> void
  method setup-menu is also<setup_menu> {
    self.connect-tab-page($!htv, 'setup-menu');
  }

  method default_icon is rw is also<default-icon> {
    Proxy.new:
      FETCH => -> $     { self.get_default_icon    },
      STORE => -> $, \v { self.set_default_icon(v) }
  }

  method menu_model is rw is also<menu-model> {
    Proxy.new:
      FETCH => -> $     { self.get_menu_model    },
      STORE => -> $, \v { self.set_menu_model(v) }
  }

  method selected_page is rw is also<selected-page> {
    Proxy.new:
      FETCH => -> $     { self.get_selected_page    },
      STORE => -> $, \v { self.set_selected_page(v) }
  }

  method shortcut_widget is rw is also<shortcut-widget> {
    Proxy.new:
      FETCH => -> $     { self.get_shortcut_widget    },
      STORE => -> $, \v { self.set_shortcut_widget(v) }
  }

  method add_page (GtkWidget() $child, HdyTabPage() $parent, :$raw = False)
    is also<add-page>
  {
    propReturnObject(
      hdy_tab_view_add_page($!htv, $child, $parent),
      $raw,
      |Handy::Tab::Page.getTypePair
    );
  }

  method append (GtkWidget() $child, :$raw = False) {
    propReturnObject(
      hdy_tab_view_append($!htv, $child),
      $raw,
      |Handy::Tab::Page.getTypePair
    );
  }

  method append_pinned (GtkWidget() $child, :$raw = False)
    is also<append-pinned>
  {
    propReturnObject(
      hdy_tab_view_append_pinned($!htv, $child),
      $raw,
      |Handy::Tab::Page.getTypePair
    );
  }

  method close_other_pages (HdyTabPage() $page) is also<close-other-pages> {
    hdy_tab_view_close_other_pages($!htv, $page);
  }

  method emit_close_page (HdyTabPage() $page) is also<emit-close-page> {
    hdy_tab_view_close_page($!htv, $page);
  }

  method close_page_finish (HdyTabPage() $page, Int() $confirm)
    is also<close-page-finish>
  {
    my gboolean $c = $confirm.so.Int;

    hdy_tab_view_close_page_finish($!htv, $page, $c);
  }

  method close_pages_after (HdyTabPage() $page) is also<close-pages-after> {
    hdy_tab_view_close_pages_after($!htv, $page);
  }

  method close_pages_before (HdyTabPage() $page) is also<close-pages-before> {
    hdy_tab_view_close_pages_before($!htv, $page);
  }

  method get_default_icon ( :$raw = False ) is also<get-default-icon> {
    propReturnObject(
      hdy_tab_view_get_default_icon($!htv),
      $raw,
      |GIO::Icon.getTypePair
    );
  }

  method get_is_transferring_page is also<get-is-transferring-page> {
    so hdy_tab_view_get_is_transferring_page($!htv);
  }

  method get_menu_model ( :$raw = False ) is also<get-menu-model> {
    propReturnObject(
      hdy_tab_view_get_menu_model($!htv),
      $raw,
      |GIO::MenuModel.getTypePair
    );
  }

  method get_n_pages is also<get-n-pages> {
    hdy_tab_view_get_n_pages($!htv);
  }

  method get_n_pinned_pages is also<get-n-pinned-pages> {
    hdy_tab_view_get_n_pinned_pages($!htv);
  }

  method get_nth_page (Int() $position, :$raw = False) is also<get-nth-page> {
    my gint $p = $position;

    propReturnObject(
      hdy_tab_view_get_nth_page($!htv, $position),
      $raw,
      |Handy::Tab::Page.getTypePair
    );
  }

  method get_page (GtkWidget() $child, :$raw = False) is also<get-page> {
    propReturnObject(
      hdy_tab_view_get_page($!htv, $child),
      $raw,
      |Handy::Tab::Page.getTypePair
    );
  }

  method get_page_position (HdyTabPage() $page) is also<get-page-position> {
    hdy_tab_view_get_page_position($!htv, $page);
  }

  method get_pages ( :$raw = False ) is also<get-pages> {
    propReturnObject(
      hdy_tab_view_get_pages($!htv),
      $raw,
      |GIO::ListModel.getTypePair
    )
  }

  method get_selected_page ( :$raw = False ) is also<get-selected-page> {
    propReturnObject(
      hdy_tab_view_get_selected_page($!htv),
      $raw,
      |Handy::Tab::Page.getTypePair
    );
  }

  method get_shortcut_widget is also<get-shortcut-widget> {
    hdy_tab_view_get_shortcut_widget($!htv);
  }

  method insert (GtkWidget() $child, Int() $position, :$raw = False) {
    my gint $p = $position;

    propReturnObject(
      hdy_tab_view_insert($!htv, $child, $position),
      $raw,
      |Handy::Tab::Page.getTypePair
    );
  }

  method insert_pinned (GtkWidget() $child, Int() $position, :$raw = False)
    is also<insert-pinned>
  {
    my gint $p = $position;

    propReturnObject(
      hdy_tab_view_insert_pinned($!htv, $child, $position),
      $raw,
      |Handy::Tab::Page.getTypePair
    );
  }

  method prepend (GtkWidget() $child, :$raw = False) {
    propReturnObject(
      hdy_tab_view_prepend($!htv, $child),
      $raw,
      |Handy::Tab::Page.getTypePair
    );
  }

  method prepend_pinned (GtkWidget() $child, :$raw = False)
    is also<prepend-pinned>
  {
    propReturnObject(
      hdy_tab_view_prepend_pinned($!htv, $child),
      $raw,
      |Handy::Tab::Page.getTypePair
    );
  }

  method reorder_backward (HdyTabPage() $page) is also<reorder-backward> {
    so hdy_tab_view_reorder_backward($!htv, $page);
  }

  method reorder_first (HdyTabPage() $page) is also<reorder-first> {
    so hdy_tab_view_reorder_first($!htv, $page);
  }

  method reorder_forward (HdyTabPage() $page) is also<reorder-forward> {
    so hdy_tab_view_reorder_forward($!htv, $page);
  }

  method reorder_last (HdyTabPage() $page) is also<reorder-last> {
    so hdy_tab_view_reorder_last($!htv, $page);
  }

  method reorder_page (HdyTabPage() $page, Int() $position)
    is also<reorder-page>
  {
    my gint $p = $position;

    so hdy_tab_view_reorder_page($!htv, $page, $position);
  }

  method select_next_page is also<select-next-page> {
    so hdy_tab_view_select_next_page($!htv);
  }

  method select_previous_page is also<select-previous-page> {
    so hdy_tab_view_select_previous_page($!htv);
  }

  method set_default_icon (GIcon() $default_icon) is also<set-default-icon> {
    hdy_tab_view_set_default_icon($!htv, $default_icon);
  }

  method set_menu_model (GMenuModel() $menu_model) is also<set-menu-model> {
    hdy_tab_view_set_menu_model($!htv, $menu_model);
  }

  method set_page_pinned (HdyTabPage() $page, Int() $pinned)
    is also<set-page-pinned>
  {
    my gboolean $p = $pinned.so.Int;

    hdy_tab_view_set_page_pinned($!htv, $page, $p);
  }

  method set_selected_page (HdyTabPage() $selected_page)
    is also<set-selected-page>
  {
    hdy_tab_view_set_selected_page($!htv, $selected_page);
  }

  method set_shortcut_widget (GtkWidget() $widget)
    is also<set-shortcut-widget>
  {
    hdy_tab_view_set_shortcut_widget($!htv, $widget);
  }

  method transfer_page (
    HdyTabPage() $page,
    HdyTabView() $other_view,
    Int()        $position
  )
    is also<transfer-page>
  {
    my gint $p = $position;

    hdy_tab_view_transfer_page($!htv, $page, $other_view, $position);
  }

}
