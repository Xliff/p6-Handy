use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::ComboRow;

use Handy::ActionRow;

use GIO::Roles::ListModel;

our subset HdyComboRowAncestry is export of Mu
  where HdyComboRow | HdyActionRowAncestry;

class Handy::ComboRow is Handy::ActionRow {
  has HdyComboRow $!hcr is implementor;

  submethod BUILD ( :$handy-combo-row ) {
    self.setHdyComboRow($handy-combo-row) if $handy-combo-row;
  }

  method setHdyComboRow (HdyComboRowAncestry $_) {
    my $to-parent;

    $!hcr = do {
      when HdyComboRow {
        $to-parent = cast(HdyActionRow, $_);
        $_;
      }
      default {
        $to-parent = $_;
        cast(HdyComboRow, $_);
      }

    }
    self.setHdyActionRow($to-parent);
  }

  method Handy::Raw::Definitions::HdyComboRow
    is also<HdyComboRow>
  { $!hcr }

  multi method new (HdyComboRowAncestry $handy-combo-row, :$ref = True) {
    return Nil unless $handy-combo-row;

    my $o = self.bless( :$handy-combo-row );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-combo-row = hdy_combo_row_new();

    $handy-combo-row ?? self.bless( :$handy-combo-row ) !! Nil;
  }

  method selected_index is rw is also<selected-index> {
    Proxy.new:
      FETCH => -> $     { self.get_selected_index    },
      STORE => -> $, \v { self.set_selected_index(v) }
  }

  method use_subtitle is rw is also<use-subtitle> {
    Proxy.new:
      FETCH => -> $     { self.get_use_subtitle    },
      STORE => -> $, \v { self.set_use_subtitle(v) }
  }

  method bind_model (
    GListModel()   $model,
                   &create_list_widget_func,
                   &create_current_widget_func,
    gpointer       $user_data                   = gpointer,
    GDestroyNotify $user_data_free_func         = gpointer
  )
    is also<bind-model>
  {
    hdy_combo_row_bind_model(
      $!hcr,
      $model,
      &create_list_widget_func,
      &create_current_widget_func,
      $user_data,
      $user_data_free_func
    );
  }

  method bind_name_model (
    GListModel()   $model,
                   &get_name_func,
    gpointer       $user_data           = gpointer,
    GDestroyNotify $user_data_free_func = gpointer
  )
    is also<bind-name-model>
  {
    hdy_combo_row_bind_name_model(
      $!hcr,
      $model,
      &get_name_func,
      $user_data,
      $user_data_free_func
    );
  }

  method get_model ( :$raw = False ) is also<get-model> {
    propReturnObject(
      hdy_combo_row_get_model($!hcr),
      $raw,
      |GIO::ListModel.getTypePair
    )
  }

  method get_selected_index is also<get-selected-index> {
    hdy_combo_row_get_selected_index($!hcr);
  }

  method get_use_subtitle is also<get-use-subtitle> {
    so hdy_combo_row_get_use_subtitle($!hcr);
  }

  method enum_value_row_name (
    Handy::ComboRow:U:

    HdyEnumValueObject() $value,
    gpointer             $user_data = gpointer
  )
    is also<enum-value-row-name>
  {
    hdy_enum_value_row_name($value, $user_data);
  }

  method set_for_enum (
    Int()          $enum_type,
                   &get_name_func,
    gpointer       $user_data           = gpointer,
    GDestroyNotify $user_data_free_func = gpointer
  )
    is also<set-for-enum>
  {
    my GType $e = $enum_type;

    hdy_combo_row_set_for_enum(
      $!hcr,
      $e,
      &get_name_func,
      $user_data,
      $user_data_free_func
    );
  }

  method set_get_name_func (
                   &get_name_func,
    gpointer       $user_data,
    GDestroyNotify $user_data_free_func = gpointer
  )
    is also<set-get-name-func>
  {
    hdy_combo_row_set_get_name_func(
      $!hcr,
      &get_name_func,
      $user_data,
      $user_data_free_func
    );
  }

  method set_selected_index (Int() $selected_index) is also<set-selected-index> {
    my gint $s = $selected_index;

    hdy_combo_row_set_selected_index($!hcr, $s);
  }

  method set_use_subtitle (Int() $use_subtitle) is also<set-use-subtitle> {
    my gboolean $u = $use_subtitle.so.Int;

    hdy_combo_row_set_use_subtitle($!hcr, $u);
  }

}
