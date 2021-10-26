use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use Handy::Raw::Definitions;

unit package Handy::Raw::ExpanderRow;

### /usr/include/libhandy-1/hdy-expander-row.h

sub hdy_expander_row_add_action (HdyExpanderRow $self, GtkWidget $widget)
  is native(handy)
  is export
{ * }

sub hdy_expander_row_add_prefix (HdyExpanderRow $self, GtkWidget $widget)
  is native(handy)
  is export
{ * }

sub hdy_expander_row_get_enable_expansion (HdyExpanderRow $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_expander_row_get_expanded (HdyExpanderRow $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_expander_row_get_icon_name (HdyExpanderRow $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_expander_row_get_show_enable_switch (HdyExpanderRow $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_expander_row_get_subtitle (HdyExpanderRow $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_expander_row_get_use_underline (HdyExpanderRow $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_expander_row_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_expander_row_set_enable_expansion (
  HdyExpanderRow $self,
  gboolean       $enable_expansion
)
  is native(handy)
  is export
{ * }

sub hdy_expander_row_set_expanded (HdyExpanderRow $self, gboolean $expanded)
  is native(handy)
  is export
{ * }

sub hdy_expander_row_set_icon_name (HdyExpanderRow $self, Str $icon_name)
  is native(handy)
  is export
{ * }

sub hdy_expander_row_set_show_enable_switch (
  HdyExpanderRow $self,
  gboolean       $show_enable_switch
)
  is native(handy)
  is export
{ * }

sub hdy_expander_row_set_subtitle (HdyExpanderRow $self, Str $subtitle)
  is native(handy)
  is export
{ * }

sub hdy_expander_row_set_use_underline (
  HdyExpanderRow $self,
  gboolean       $use_underline
)
  is native(handy)
  is export
{ * }
