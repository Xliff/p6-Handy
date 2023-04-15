use v6.c;

use Method::Also;

use NativeCall;

use Handy::Raw::Types;

use GLib::GSList;

use GLib::Roles::Implementor;
use GLib::Roles::Object;
use Handy::Roles::Swipeable;

our subset HdySwipeGroupAncestry is export of Mu
  where HdySwipeGroup | GObject;

class Handy::Swipe::Group {
  also does GLib::Roles::Object;

  has HdySwipeGroup $!hdy-sg is implementor;

  submethod BUILD ( :$hdy-swipe-group ) {
    self.setHdySwipeGroup($hdy-swipe-group) if $hdy-swipe-group
  }

  method setHdySwipeGroup (HdySwipeGroupAncestry $_) {
    my $to-parent;

    $!hdy-sg = do {
      when HdySwipeGroup {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdySwipeGroup, $_);
      }
    }
    self!setObject($to-parent);
  }

  method Handy::Raw::Definitions::HdySwipeGroup
    is also<HdySwipeGroup>
  { $!hdy-sg }

  multi method new (
    $hdy-swipe-group where * ~~ HdySwipeGroupAncestry,

    :$ref = True
  ) {
    return unless $hdy-swipe-group;

    my $o = self.bless( :$hdy-swipe-group );
    $o.ref if $ref;
    $o;
  }

  multi method new {
    my $handy-swipe-group = hdy_swipe_group_new();

    $handy-swipe-group ?? self.bless( :$handy-swipe-group ) !! Nil;
  }

  method add_swipeable (HdySwipeable()  $swipeable) is also<add-swipeable> {
    hdy_swipe_group_add_swipeable($!hdy-sg, $swipeable);
  }

  method get_swipeables ( :$raw = False, :glist(:$gslist) = False )
    is also<get-swipeables>
  {
    returnGSList(
      hdy_swipe_group_get_swipeables($!hdy-sg),
      $raw,
      $gslist,
      |Handy::Swipeable.getTypePair
    );
  }

  method remove_swipeable (HdySwipeable() $swipeable)
    is also<remove-swipeable>
  {
    hdy_swipe_group_remove_swipeable($!hdy-sg, $swipeable);
  }

}

### /usr/src/libhandy-1-1.8.0/src/hdy-swipe-group.h

sub hdy_swipe_group_add_swipeable (
  HdySwipeGroup $self,
  HdySwipeable  $swipeable
)
  is      native(handy)
  is      export
{ * }

sub hdy_swipe_group_get_swipeables (HdySwipeGroup $self)
  returns GSList
  is      native(handy)
  is      export
{ * }

sub hdy_swipe_group_new
  returns HdySwipeGroup
  is      native(handy)
  is      export
{ * }

sub hdy_swipe_group_remove_swipeable (
  HdySwipeGroup $self,
  HdySwipeable  $swipeable
)
  is      native(handy)
  is      export
{ * }
