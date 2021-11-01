use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GIO::Raw::Definitions;
use GDK::Raw::Definitions;
use GTK::Raw::Definitions;
use Handy::Raw::Definitions;

unit package Handy::Raw::Avatar;

### /usr/include/libhandy-1/hdy-avatar.h

sub hdy_avatar_draw_to_pixbuf (HdyAvatar $self, gint $size, gint $scale_factor)
  returns GdkPixbuf
  is native(handy)
  is export
{ * }

sub hdy_avatar_draw_to_pixbuf_async (
  HdyAvatar     $self,
  gint          $size,
  gint          $scale_factor,
  GCancellable  $cancellable,
  Pointer       $callback,
  gpointer      $user_data
)
  is native(handy)
  is export
{ * }

sub hdy_avatar_draw_to_pixbuf_finish (
  HdyAvatar $self,
  &result (HdyAvatar, GAsyncResult, gpointer),
)
  returns GdkPixbuf
  is native(handy)
  is export
{ * }

sub hdy_avatar_get_icon_name (HdyAvatar $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_avatar_get_loadable_icon (HdyAvatar $self)
  returns GLoadableIcon
  is native(handy)
  is export
{ * }

sub hdy_avatar_get_show_initials (HdyAvatar $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_avatar_get_size (HdyAvatar $self)
  returns gint
  is native(handy)
  is export
{ * }

sub hdy_avatar_get_text (HdyAvatar $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_avatar_new (gint $size, Str $text, gboolean $show_initials)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_avatar_set_icon_name (HdyAvatar $self, Str $icon_name)
  is native(handy)
  is export
{ * }

sub hdy_avatar_set_image_load_func (
  HdyAvatar      $self,
                 &load_image (gint, gpointer --> GdkPixbuf),
  gpointer       $user_data,
                 &destroy
)
  is native(handy)
  is export
{ * }

sub hdy_avatar_set_loadable_icon (HdyAvatar $self, GLoadableIcon $icon)
  is native(handy)
  is export
{ * }

sub hdy_avatar_set_show_initials (HdyAvatar $self, gboolean $show_initials)
  is native(handy)
  is export
{ * }

sub hdy_avatar_set_size (HdyAvatar $self, gint $size)
  is native(handy)
  is export
{ * }

sub hdy_avatar_set_text (HdyAvatar $self, Str $text)
  is native(handy)
  is export
{ * }
