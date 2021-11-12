use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GIO::Raw::Definitions;
use GTK::Raw::Definitions;
use Handy::Raw::Definitions;

unit package Handy::Raw::TabView;


### /usr/local/include/libhandy-1/hdy-tab-view.h

sub hdy_tab_view_add_page (
  HdyTabView $self,
  GtkWidget  $child,
  HdyTabPage $parent
)
  returns HdyTabPage
  is native(handy)
  is export
{ * }

sub hdy_tab_view_append (HdyTabView $self, GtkWidget $child)
  returns HdyTabPage
  is native(handy)
  is export
{ * }

sub hdy_tab_view_append_pinned (HdyTabView $self, GtkWidget $child)
  returns HdyTabPage
  is native(handy)
  is export
{ * }

sub hdy_tab_view_close_other_pages (HdyTabView $self, HdyTabPage $page)
  is native(handy)
  is export
{ * }

sub hdy_tab_view_close_page (HdyTabView $self, HdyTabPage $page)
  is native(handy)
  is export
{ * }

sub hdy_tab_view_close_page_finish (
  HdyTabView $self,
  HdyTabPage $page,
  gboolean   $confirm
)
  is native(handy)
  is export
{ * }

sub hdy_tab_view_close_pages_after (HdyTabView $self, HdyTabPage $page)
  is native(handy)
  is export
{ * }

sub hdy_tab_view_close_pages_before (HdyTabView $self, HdyTabPage $page)
  is native(handy)
  is export
{ * }

sub hdy_tab_view_get_default_icon (HdyTabView $self)
  returns GIcon
  is native(handy)
  is export
{ * }

sub hdy_tab_view_get_is_transferring_page (HdyTabView $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_view_get_menu_model (HdyTabView $self)
  returns GMenuModel
  is native(handy)
  is export
{ * }

sub hdy_tab_view_get_n_pages (HdyTabView $self)
  returns gint
  is native(handy)
  is export
{ * }

sub hdy_tab_view_get_n_pinned_pages (HdyTabView $self)
  returns gint
  is native(handy)
  is export
{ * }

sub hdy_tab_view_get_nth_page (HdyTabView $self, gint $position)
  returns HdyTabPage
  is native(handy)
  is export
{ * }

sub hdy_tab_view_get_page (HdyTabView $self, GtkWidget $child)
  returns HdyTabPage
  is native(handy)
  is export
{ * }

sub hdy_tab_view_get_page_position (HdyTabView $self, HdyTabPage $page)
  returns gint
  is native(handy)
  is export
{ * }

sub hdy_tab_view_get_pages (HdyTabView $self)
  returns GListModel
  is native(handy)
  is export
{ * }

sub hdy_tab_view_get_selected_page (HdyTabView $self)
  returns HdyTabPage
  is native(handy)
  is export
{ * }

sub hdy_tab_view_get_shortcut_widget (HdyTabView $self)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_tab_page_get_child (HdyTabPage $self)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_tab_page_get_icon (HdyTabPage $self)
  returns GIcon
  is native(handy)
  is export
{ * }

sub hdy_tab_page_get_indicator_activatable (HdyTabPage $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_page_get_indicator_icon (HdyTabPage $self)
  returns GIcon
  is native(handy)
  is export
{ * }

sub hdy_tab_page_get_loading (HdyTabPage $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_page_get_needs_attention (HdyTabPage $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_page_get_parent (HdyTabPage $self)
  returns HdyTabPage
  is native(handy)
  is export
{ * }

sub hdy_tab_page_get_pinned (HdyTabPage $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_page_get_selected (HdyTabPage $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_page_get_title (HdyTabPage $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_tab_page_get_tooltip (HdyTabPage $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_tab_page_set_icon (HdyTabPage $self, GIcon $icon)
  is native(handy)
  is export
{ * }

sub hdy_tab_page_set_indicator_activatable (
  HdyTabPage $self,
  gboolean   $activatable
)
  is native(handy)
  is export
{ * }

sub hdy_tab_page_set_indicator_icon (HdyTabPage $self, GIcon $indicator_icon)
  is native(handy)
  is export
{ * }

sub hdy_tab_page_set_loading (HdyTabPage $self, gboolean $loading)
  is native(handy)
  is export
{ * }

sub hdy_tab_page_set_needs_attention (
  HdyTabPage $self,
  gboolean   $needs_attention
)
  is native(handy)
  is export
{ * }

sub hdy_tab_page_set_title (HdyTabPage $self, Str $title)
  is native(handy)
  is export
{ * }

sub hdy_tab_page_set_tooltip (HdyTabPage $self, Str $tooltip)
  is native(handy)
  is export
{ * }

sub hdy_tab_view_insert (HdyTabView $self, GtkWidget $child, gint $position)
  returns HdyTabPage
  is native(handy)
  is export
{ * }

sub hdy_tab_view_insert_pinned (
  HdyTabView $self,
  GtkWidget  $child,
  gint       $position
)
  returns HdyTabPage
  is native(handy)
  is export
{ * }

sub hdy_tab_view_new ()
  returns HdyTabView
  is native(handy)
  is export
{ * }

sub hdy_tab_view_prepend (HdyTabView $self, GtkWidget $child)
  returns HdyTabPage
  is native(handy)
  is export
{ * }

sub hdy_tab_view_prepend_pinned (HdyTabView $self, GtkWidget $child)
  returns HdyTabPage
  is native(handy)
  is export
{ * }

sub hdy_tab_view_reorder_backward (HdyTabView $self, HdyTabPage $page)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_view_reorder_first (HdyTabView $self, HdyTabPage $page)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_view_reorder_forward (HdyTabView $self, HdyTabPage $page)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_view_reorder_last (HdyTabView $self, HdyTabPage $page)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_view_reorder_page (
  HdyTabView $self,
  HdyTabPage $page,
  gint       $position
)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_view_select_next_page (HdyTabView $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_view_select_previous_page (HdyTabView $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_view_set_default_icon (HdyTabView $self, GIcon $default_icon)
  is native(handy)
  is export
{ * }

sub hdy_tab_view_set_menu_model (HdyTabView $self, GMenuModel $menu_model)
  is native(handy)
  is export
{ * }

sub hdy_tab_view_set_page_pinned (
  HdyTabView $self,
  HdyTabPage $page,
  gboolean   $pinned
)
  is native(handy)
  is export
{ * }

sub hdy_tab_view_set_selected_page (
  HdyTabView $self,
  HdyTabPage $selected_page
)
  is native(handy)
  is export
{ * }

sub hdy_tab_view_set_shortcut_widget (HdyTabView $self, GtkWidget $widget)
  is native(handy)
  is export
{ * }

sub hdy_tab_view_transfer_page (
  HdyTabView $self,
  HdyTabPage $page,
  HdyTabView $other_view,
  gint       $position
)
  is native(handy)
  is export
{ * }
