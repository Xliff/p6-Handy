use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::HeaderGroup;

use GLib::GList;
use GTK::HeaderBar;
use Handy::HeaderBar;

use GLib::Roles::Object;
use GLib::Roles::Signals::Generic;

class Handy::HeaderGroup::Child { ... }

our subset HdyHeaderGroupAncestry is export of Mu
  where HdyHeaderGroup | GObject;

class Handy::HeaderGroup {
  also does GLib::Roles::Object;
  also does GLib::Roles::Signals::Generic;

  has HdyHeaderGroup $!hhg;

  submethod BUILD ( :$handy-header-group ) {
    self.setHdyHeaderGroup($handy-header-group) if $handy-header-group;
  }

  method setHdyHeaderGroup (HdyHeaderGroupAncestry $_) {
    my $to-parent;

    $!hhg = do {
      when HdyHeaderGroup {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyHeaderGroup, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Handy::Raw::HdyHeaderGroup
    is also<HdyHeaderGroup>
  { $!hhg }

  multi method new (HdyHeaderGroupAncestry $handy-header-group, :$ref = True) {
    return Nil unless $handy-header-group;

    my $o = self.bless( :$handy-header-group );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $header-group = hdy_header_group_new();

    $header-group ?? self.bless( :$header-group ) !! Nil;
  }

  method decorate_all is rw is also<decorate-all> {
    Proxy.new:
      FETCH => -> $     { self.get_decorate_all    },
      STORE => -> $, \v { self.set_decorate_all(v) }
  }

  # Is originally:
  # HdyHeaderGroup, gpointer --> void
  method update-decoration-layouts {
    self.connect($!hhg, 'update-decoration-layouts');
  }

  method add_gtk_header_bar (GtkHeaderBar() $header_bar)
    is also<add-gtk-header-bar>
  {
    hdy_header_group_add_gtk_header_bar($!hhg, $header_bar);
  }

  method add_header_bar (HdyHeaderBar() $header_bar)
    is also<add-header-bar>
  {
    hdy_header_group_add_header_bar($!hhg, $header_bar);
  }

  method add_header_group (HdyHeaderGroup() $header_group)
    is also<add-header-group>
  {
    hdy_header_group_add_header_group($!hhg, $header_group);
  }

  method get_children ( :$raw = False, :$glist = False )
    is also<get-children>
  {
    returnGList(
      hdy_header_group_get_children($!hhg),
      $raw,
      $glist,
      |Handy::HeaderGroup::Child.getTypePair
    );
  }

  method get_decorate_all is also<get-decorate-all> {
    so hdy_header_group_get_decorate_all($!hhg);
  }

  method remove_child (HdyHeaderGroupChild() $child)
    is also<remove-child>
  {
    hdy_header_group_remove_child($!hhg, $child);
  }

  method remove_gtk_header_bar (GtkHeaderBar() $header_bar)
    is also<remove-gtk-header-bar>
  {
    hdy_header_group_remove_gtk_header_bar($!hhg, $header_bar);
  }

  method remove_header_bar (HdyHeaderBar() $header_bar)
    is also<remove-header-bar>
  {
    hdy_header_group_remove_header_bar($!hhg, $header_bar);
  }

  method remove_header_group (HdyHeaderGroup() $header_group)
    is also<remove-header-group>
  {
    hdy_header_group_remove_header_group($!hhg, $header_group);
  }

  method set_decorate_all (Int() $decorate_all) is also<set-decorate-all> {
    my gboolean $d = $decorate_all.so.Int;

    hdy_header_group_set_decorate_all($!hhg, $d);
  }

}

our subset HdyHeaderGroupChildAncestry is export of Mu
  where HdyHeaderGroupChild | GObject;

class Handy::HeaderGroup::Child {
  also does GLib::Roles::Object;

  has HdyHeaderGroupChild $!hhgc;

  submethod BUILD ( :$handy-header-group ) {
    self.setHdyHeaderGroupChild($handy-header-group) if $handy-header-group;
  }

  method setHdyHeaderGroupChild (HdyHeaderGroupChildAncestry $_) {
    my $to-parent;

    $!hhgc = do {
      when HdyHeaderGroupChild {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyHeaderGroupChild, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Handy::Raw::HdyHeaderGroupChild
    is also<HdyHeaderGroupChild>
  { $!hhgc }

  multi method new (
    HdyHeaderGroupChildAncestry $handy-header-group,
                                :$ref                = True
  ) {
    return Nil unless $handy-header-group;

    my $o = self.bless( :$handy-header-group );
    $o.ref if $ref;
    $o;
  }

  method get_child_type is also<get-child-type> {
    HdyHeaderGroupChildTypeEnum(
      hdy_header_group_child_get_child_type($!hhgc)
    );
  }

  method get ( :$raw = False ) {
    given self.get_child_type {
      when HDY_HEADER_GROUP_CHILD_TYPE_HEADER_BAR {
        self.get_header_bar( :$raw );
      }

      when HDY_HEADER_GROUP_CHILD_TYPE_GTK_HEADER_BAR {
        self.get_gtk_header_bar( :$raw );
      }

      when HDY_HEADER_GROUP_CHILD_TYPE_HEADER_GROUP {
        self.get_heaedr_group( :$raw )
      }
    }
  }

  method get_gtk_header_bar ( :$raw = False ) is also<get-gtk-header-bar> {
    propReturnObject(
      hdy_header_group_child_get_gtk_header_bar($!hhgc),
      $raw,
      |GTK::HeaderBar.getTypePair
    )
  }

  method get_header_bar ( :$raw = False ) is also<get-header-bar> {
    propReturnObject(
      hdy_header_group_child_get_header_bar($!hhgc),
      $raw,
      |Handy::HeaderBar.getTypePair
    )
  }

  method get_header_group ( :$raw = False ) is also<get-header-group> {
    propReturnObject(
      hdy_header_group_child_get_header_group($!hhgc),
      $raw,
      |Handy::HeaderGroup.getTypePair
    )
  }

}
