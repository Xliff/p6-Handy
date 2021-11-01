use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::Avatar;

use GDK::Pixbuf;
use GTK::DrawingArea;

use GIO::Roles::LoadableIcon;

our subset HdyAvatarAncestry is export of Mu
  where HdyAvatar | GtkDrawingAreaAncestry;

class Handy::Avatar is GTK::DrawingArea {
  has HdyAvatar $!ha;

  submethod BUILD( :$avatar ) {
    self.setHandyAvatar($avatar) if $avatar;
  }

  method setHandyAvatar (HdyAvatarAncestry $_)
    is also<setDrawingArea>
  {
    my $to-parent;

    $!ha = do {
      when HdyAvatar {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyAvatar, $_);
      }
    }
    self.setWidget($to-parent);
  }

  multi method new (HdyAvatarAncestry $avatar, :$ref = True) {
    return Nil unless $avatar;

    my $o = self.bless( :$avatar );
    $o.ref if $ref;
    $o;
  }
  multi method new (Str() $text, Int() $show_initials) {
    my gboolean $s      = $show_initials.so.Int;
    my          $avatar = hdy_avatar_new($!ha, $text, $show_initials);

    $avatar ?? self.bless( :$avatar ) !! Nil;
  }

  method icon_name is rw is also<icon-name> {
    Proxy.new:
      FETCH => -> $     { self.get_icon_name    },
      STORE => -> $, \v { self.set_icon_name(v) }
  }

  method loadable_icon is rw is also<loadable-icon> {
    Proxy.new:
      FETCH => -> $     { self.get_loadable_icon    },
      STORE => -> $, \v { self.set_loadable_icon(v) }
  }

  method show_initials is rw is also<show-initials> {
    Proxy.new:
      FETCH => -> $     { self.get_show_initials    },
      STORE => -> $, \v { self.set_show_initials(v) }
  }

  method size is rw {
    Proxy.new:
      FETCH => -> $     { self.get_size    },
      STORE => -> $, \v { self.set_size(v) }
  }

  method text is rw {
    Proxy.new:
      FETCH => -> $     { self.get_text    },
      STORE => -> $, \v { self.set_text(v) }
  }

  method draw_to_pixbuf (Int() $size, Int() $scale-factor)
    is also<draw-to-pixbuf>
  {
    my gint ($s, $sf) = ($size, $scale-factor);

    hdy_avatar_draw_to_pixbuf($!ha, $s, $sf);
  }

  proto method draw_to_pixbuf_async (|)
    is also<draw-to-pixbuf-async>
  { * }

  multi method draw_to_pixbuf_async (
    Int()          $size,
    Int()          $scale-factor,
                   &callback,
    gpointer       $user_data     = gpointer,
    GCancellable() :$cancellable  = GCancellable
  ) {
    samewith(
      $size,
      $scale-factor,
      $cancellable,
      &callback,
      $user_data
    );
  }
  multi method draw_to_pixbuf_async (
    Int()          $size,
    Int()          $scale-factor,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data     = gpointer,
                   :$raw          = False
  ) {
    my gint ($s, $sf) = ($size, $scale-factor);

    propReturnObject(
      hdy_avatar_draw_to_pixbuf_async(
        $!ha,
        $s,
        $sf,
        $cancellable,
        &callback,
        $user_data
      ),
      $raw,
      GdkPixbuf,
      GDK::Pixbuf
    );
  }

  method draw_to_pixbuf_finish (&async_result, :$raw = False)
    is also<draw-to-pixbuf-finish>
  {
    propReturnObject(
      hdy_avatar_draw_to_pixbuf_finish($!ha, &async_result),
      $raw,
      GdkPixbuf,
      GDK::Pixbuf
    );
  }

  method get_icon_name is also<get-icon-name> {
    hdy_avatar_get_icon_name($!ha);
  }

  method get_loadable_icon ( :$raw = False ) is also<get-loadable-icon> {
    propReturnObject(
      hdy_avatar_get_loadable_icon($!ha),
      $raw,
      GLoadableIcon,
      GIO::LoadableIcon,
    );
  }

  method get_show_initials is also<get-show-initials> {
    so hdy_avatar_get_show_initials($!ha);
  }

  method get_size is also<get-size> {
    hdy_avatar_get_size($!ha);
  }

  method get_text is also<get-text> {
    hdy_avatar_get_text($!ha);
  }

  method set_icon_name (Str() $icon_name) is also<set-icon-name> {
    hdy_avatar_set_icon_name($!ha, $icon_name);
  }

  method set_image_load_func (
                   &load_image,
    gpointer       $user_data   = gpointer,
                   $destroy     = Callable
  )
    is also<set-image-load-func>
  {
    hdy_avatar_set_image_load_func($!ha, &load_image, $user_data, $destroy);
  }

  method set_loadable_icon (GLoadableIcon() $icon)
    is also<set-loadable-icon>
  {
    hdy_avatar_set_loadable_icon($!ha, $icon);
  }

  method set_show_initials (Int() $show_initials)
    is also<set-show-initials>
  {
    my gboolean $s = $show_initials;

    hdy_avatar_set_show_initials($!ha, $show_initials);
  }

  method set_size (Int() $size) is also<set-size> {
    my gint $s = $size;

    hdy_avatar_set_size($!ha, $size);
  }

  method set_text (Str() $text) is also<set-text> {
    hdy_avatar_set_text($!ha, $text);
  }

}
