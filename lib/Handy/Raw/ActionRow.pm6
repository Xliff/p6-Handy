use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use Handy::Raw::Definitions;

unit package Handy::Raw::ActionRow;

### /usr/include/libhandy-1/hdy-action-row.h

sub hdy_action_row_activate (HdyActionRow $self)
  is native(handy)
  is export
{ * }

sub hdy_action_row_add_prefix (HdyActionRow $self, GtkWidget $widget)
  is native(handy)
  is export
{ * }

sub hdy_action_row_get_activatable_widget (HdyActionRow $self)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_action_row_get_icon_name (HdyActionRow $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_action_row_get_subtitle (HdyActionRow $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_action_row_get_subtitle_lines (HdyActionRow $self)
  returns gint
  is native(handy)
  is export
{ * }

sub hdy_action_row_get_title_lines (HdyActionRow $self)
  returns gint
  is native(handy)
  is export
{ * }

sub hdy_action_row_get_use_underline (HdyActionRow $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_action_row_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_action_row_set_activatable_widget (
  HdyActionRow $self,
  GtkWidget    $widget
)
  is native(handy)
  is export
{ * }

sub hdy_action_row_set_icon_name (
  HdyActionRow $self,
  Str          $icon_name
)
  is native(handy)
  is export
{ * }

sub hdy_action_row_set_subtitle (HdyActionRow $self, Str $subtitle)
  is native(handy)
  is export
{ * }

sub hdy_action_row_set_subtitle_lines (
  HdyActionRow $self,
  gint         $subtitle_lines
)
  is native(handy)
  is export
{ * }

sub hdy_action_row_set_title_lines (HdyActionRow $self, gint $title_lines)
  is native(handy)
  is export
{ * }

sub hdy_action_row_set_use_underline (
  HdyActionRow $self,
  gboolean     $use_underline
)
  is native(handy)
  is export
{ * }
