use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use Handy::Raw::Definitions;


### /usr/src/libhandy-1-1.8.0/src/hdy-keypad.h

sub hdy_keypad_get_column_spacing (HdyKeypad $self)
  returns guint
  is      native(handy)
  is      export
{ * }

sub hdy_keypad_get_end_action (HdyKeypad $self)
  returns GtkWidget
  is      native(handy)
  is      export
{ * }

sub hdy_keypad_get_entry (HdyKeypad $self)
  returns GtkEntry
  is      native(handy)
  is      export
{ * }

sub hdy_keypad_get_letters_visible (HdyKeypad $self)
  returns uint32
  is      native(handy)
  is      export
{ * }

sub hdy_keypad_get_row_spacing (HdyKeypad $self)
  returns guint
  is      native(handy)
  is      export
{ * }

sub hdy_keypad_get_start_action (HdyKeypad $self)
  returns GtkWidget
  is      native(handy)
  is      export
{ * }

sub hdy_keypad_get_symbols_visible (HdyKeypad $self)
  returns uint32
  is      native(handy)
  is      export
{ * }

sub hdy_keypad_new (
  gboolean $symbols_visible,
  gboolean $letters_visible
)
  returns GtkWidget
  is      native(handy)
  is      export
{ * }

sub hdy_keypad_set_column_spacing (
  HdyKeypad $self,
  guint     $spacing
)
  is      native(handy)
  is      export
{ * }

sub hdy_keypad_set_end_action (
  HdyKeypad $self,
  GtkWidget $end_action
)
  is      native(handy)
  is      export
{ * }

sub hdy_keypad_set_entry (
  HdyKeypad $self,
  GtkEntry  $entry
)
  is      native(handy)
  is      export
{ * }

sub hdy_keypad_set_letters_visible (
  HdyKeypad $self,
  gboolean  $letters_visible
)
  is      native(handy)
  is      export
{ * }

sub hdy_keypad_set_row_spacing (
  HdyKeypad $self,
  guint     $spacing
)
  is      native(handy)
  is      export
{ * }

sub hdy_keypad_set_start_action (
  HdyKeypad $self,
  GtkWidget $start_action
)
  is      native(handy)
  is      export
{ * }

sub hdy_keypad_set_symbols_visible (
  HdyKeypad $self,
  gboolean  $symbols_visible
)
  is      native(handy)
  is      export
{ * }
