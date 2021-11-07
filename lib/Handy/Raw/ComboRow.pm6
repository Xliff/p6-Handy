use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GIO::Raw::Definitions;
use GTK::Raw::Definitions;
use Handy::Raw::Definitions;

unit package Handy::Raw::ComboRow;

### /usr/include/libhandy-1/hdy-combo-row.h

sub hdy_combo_row_bind_model (
  HdyComboRow    $self,
  GListModel     $model,
                 &create_list_widget_func (gpointer, gpointer --> GtkWidget),
                 &create_current_widget_func (gpointer, gpointer --> GtkWidget),
  gpointer       $user_data,
  GDestroyNotify $user_data_free_func
)
  is native(handy)
  is export
{ * }

sub hdy_combo_row_bind_name_model (
  HdyComboRow    $self,
  GListModel     $model,
                 &get-name-func (gpointer, gpointer --> Str),
  gpointer       $user_data,
  GDestroyNotify $user_data_free_func
)
  is native(handy)
  is export
{ * }

sub hdy_combo_row_get_model (HdyComboRow $self)
  returns GListModel
  is native(handy)
  is export
{ * }

sub hdy_combo_row_get_selected_index (HdyComboRow $self)
  returns gint
  is native(handy)
  is export
{ * }

sub hdy_combo_row_get_use_subtitle (HdyComboRow $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_enum_value_row_name (HdyEnumValueObject $value, gpointer $user_data)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_combo_row_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_combo_row_set_for_enum
  (HdyComboRow   $self,
  GType          $enum_type,
                 &get-enum-name (HdyEnumValueObject, gpointer --> Str),
  gpointer       $user_data,
  GDestroyNotify $user_data_free_func
)
  is native(handy)
  is export
{ * }

sub hdy_combo_row_set_get_name_func (
  HdyComboRow    $self,
                 &get-name-func (gpointer, gpointer --> Str),
  gpointer       $user_data,
  GDestroyNotify $user_data_free_func
)
  is native(handy)
  is export
{ * }

sub hdy_combo_row_set_selected_index (
  HdyComboRow $self,
  gint        $selected_index
)
  is native(handy)
  is export
{ * }

sub hdy_combo_row_set_use_subtitle (
  HdyComboRow $self,
  gboolean    $use_subtitle
)
  is native(handy)
  is export
{ * }
