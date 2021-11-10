use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GDK::Raw::Definitions;
use Handy::Raw::Definitions;
use Handy::Raw::Enums;

unit package Handy::Raw::StyleManager;

### /usr/local/include/libhandy-1/hdy-style-manager.h

sub hdy_style_manager_get_color_scheme (HdyStyleManager $self)
  returns HdyColorScheme
  is native(handy)
  is export
{ * }

sub hdy_style_manager_get_dark (HdyStyleManager $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_style_manager_get_default ()
  returns HdyStyleManager
  is native(handy)
  is export
{ * }

sub hdy_style_manager_get_display (HdyStyleManager $self)
  returns GdkDisplay
  is native(handy)
  is export
{ * }

sub hdy_style_manager_get_for_display (GdkDisplay $display)
  returns HdyStyleManager
  is native(handy)
  is export
{ * }

sub hdy_style_manager_get_high_contrast (HdyStyleManager $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_style_manager_get_system_supports_color_schemes (HdyStyleManager $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_style_manager_set_color_scheme (
  HdyStyleManager $self,
  HdyColorScheme  $color_scheme
)
  is native(handy)
  is export
{ * }
