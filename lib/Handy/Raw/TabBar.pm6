use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use Handy::Raw::Definitions;

unit package Handy::Raw::TabBar;


### /usr/local/include/libhandy-1/hdy-tab-bar.h

sub hdy_tab_bar_get_autohide (HdyTabBar $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_bar_get_end_action_widget (HdyTabBar $self)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_tab_bar_get_expand_tabs (HdyTabBar $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_bar_get_extra_drag_dest_targets (HdyTabBar $self)
  returns GtkTargetList
  is native(handy)
  is export
{ * }

sub hdy_tab_bar_get_inverted (HdyTabBar $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_bar_get_is_overflowing (HdyTabBar $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_bar_get_start_action_widget (HdyTabBar $self)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_tab_bar_get_tabs_revealed (HdyTabBar $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_tab_bar_get_view (HdyTabBar $self)
  returns HdyTabView
  is native(handy)
  is export
{ * }

sub hdy_tab_bar_new ()
  returns HdyTabBar
  is native(handy)
  is export
{ * }

sub hdy_tab_bar_set_autohide (HdyTabBar $self, gboolean $autohide)
  is native(handy)
  is export
{ * }

sub hdy_tab_bar_set_end_action_widget (HdyTabBar $self, GtkWidget $widget)
  is native(handy)
  is export
{ * }

sub hdy_tab_bar_set_expand_tabs (HdyTabBar $self, gboolean $expand_tabs)
  is native(handy)
  is export
{ * }

sub hdy_tab_bar_set_extra_drag_dest_targets (
  HdyTabBar     $self, 
  GtkTargetList $extra_drag_dest_targets
)
  is native(handy)
  is export
{ * }

sub hdy_tab_bar_set_inverted (HdyTabBar $self, gboolean $inverted)
  is native(handy)
  is export
{ * }

sub hdy_tab_bar_set_start_action_widget (HdyTabBar $self, GtkWidget $widget)
  is native(handy)
  is export
{ * }

sub hdy_tab_bar_set_view (HdyTabBar $self, HdyTabView $view)
  is native(handy)
  is export
{ * }
