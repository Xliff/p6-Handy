use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GTK::Raw::Definitions;
use Handy::Raw::Definitions;
use Handy::Raw::Enums;

unit package Handy::Raw::HeaderGroup;

### /usr/include/libhandy-1/hdy-header-group.h

sub hdy_header_group_add_gtk_header_bar (
  HdyHeaderGroup $self,
  GtkHeaderBar   $header_bar
)
  is native(handy)
  is export
{ * }

sub hdy_header_group_add_header_bar (
  HdyHeaderGroup $self,
  HdyHeaderBar   $header_bar
)
  is native(handy)
  is export
{ * }

sub hdy_header_group_add_header_group (
  HdyHeaderGroup $self,
  HdyHeaderGroup $header_group
)
  is native(handy)
  is export
{ * }

sub hdy_header_group_child_get_child_type (HdyHeaderGroupChild $self)
  returns HdyHeaderGroupChildType
  is native(handy)
  is export
{ * }

sub hdy_header_group_child_get_gtk_header_bar (HdyHeaderGroupChild $self)
  returns GtkHeaderBar
  is native(handy)
  is export
{ * }

sub hdy_header_group_child_get_header_bar (HdyHeaderGroupChild $self)
  returns HdyHeaderBar
  is native(handy)
  is export
{ * }

sub hdy_header_group_child_get_header_group (HdyHeaderGroupChild $self)
  returns HdyHeaderGroup
  is native(handy)
  is export
{ * }

sub hdy_header_group_get_children (HdyHeaderGroup $self)
  returns GSList
  is native(handy)
  is export
{ * }

sub hdy_header_group_get_decorate_all (HdyHeaderGroup $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_header_group_new ()
  returns HdyHeaderGroup
  is native(handy)
  is export
{ * }

sub hdy_header_group_remove_child (
  HdyHeaderGroup      $self,
  HdyHeaderGroupChild $child
)
  is native(handy)
  is export
{ * }

sub hdy_header_group_remove_gtk_header_bar (
  HdyHeaderGroup $self,
  GtkHeaderBar   $header_bar
)
  is native(handy)
  is export
{ * }

sub hdy_header_group_remove_header_bar (
  HdyHeaderGroup $self,
  HdyHeaderBar   $header_bar
)
  is native(handy)
  is export
{ * }

sub hdy_header_group_remove_header_group (
  HdyHeaderGroup $self,
  HdyHeaderGroup $header_group
)
  is native(handy)
  is export
{ * }

sub hdy_header_group_set_decorate_all (
  HdyHeaderGroup $self,
  gboolean       $decorate_all
)
  is native(handy)
  is export
{ * }
