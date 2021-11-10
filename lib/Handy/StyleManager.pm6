use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::StyleManager;

use GDK::Display;

use GLib::Roles::Object;

class Handy::StyleManager {
  also does GLib::Roles::Object;

  has HdyStyleManager $!hsm is implementor;

  method color_scheme is rw is also<color-scheme> {
    Proxy.new:
      FETCH => -> $     { self.get_color_scheme    },
      STORE => -> $, \v { self.set_color_scheme(v) }
  }

  method get_color_scheme is also<get-color-scheme> {
    HdyColorSchemeEnum( hdy_style_manager_get_color_scheme($!hsm) );
  }

  method get_dark
    is also<
      get-dark
      dark
    >
  {
    so hdy_style_manager_get_dark($!hsm);
  }

  method get_default ( :$raw = False )
    is also<
      get-default
      default
    >
  {
    propReturnObject(
      hdy_style_manager_get_default(),
      $raw,
      |self.getTypePair
    );
  }

  method get_display ( :$raw  = False )
    is also<
      get-display
      display
    >
  {
    propReturnObject(
      hdy_style_manager_get_display($!hsm),
      $raw,
      |GDK::Display.getTypePair
    );
  }

  method get_for_display (
    Handy::StyleManager:U:

    GdkDisplay() $display,
                 :$raw     = False
  ) is also<get-for-display> {
    propReturnObject(
      hdy_style_manager_get_for_display($display),
      $raw,
      |self.getTypePair
    );
  }

  method get_high_contrast
    is also<
      get-high-contrast
      high-contrast
      high_contrast
    >
  {
    so hdy_style_manager_get_high_contrast($!hsm);
  }

  method get_system_supports_color_schemes
    is also<
      get-system-supports-color-schemes
      system_supports_color_schemes
      system-supports-color-schemes
    >
  {
    so hdy_style_manager_get_system_supports_color_schemes($!hsm);
  }

  method set_color_scheme (Int() $color_scheme) is also<set-color-scheme> {
    my HdyColorScheme $c = $color_scheme;

    hdy_style_manager_set_color_scheme($!hsm, $c);
  }


}
