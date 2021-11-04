use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GTK::Raw::Definitions;
use GTK::Raw::Enums;
use Handy::Raw::Definitions;
use Handy::Raw::Enums;

### /usr/include/libhandy-1/hdy-flap.h

sub hdy_flap_get_content (HdyFlap $self)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_flap_get_flap (HdyFlap $self)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_flap_get_flap_position (HdyFlap $self)
  returns GtkPackType
  is native(handy)
  is export
{ * }

sub hdy_flap_get_fold_duration (HdyFlap $self)
  returns guint
  is native(handy)
  is export
{ * }

sub hdy_flap_get_fold_policy (HdyFlap $self)
  returns HdyFlapFoldPolicy
  is native(handy)
  is export
{ * }

sub hdy_flap_get_folded (HdyFlap $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_flap_get_locked (HdyFlap $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_flap_get_modal (HdyFlap $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_flap_get_reveal_duration (HdyFlap $self)
  returns guint
  is native(handy)
  is export
{ * }

sub hdy_flap_get_reveal_flap (HdyFlap $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_flap_get_reveal_progress (HdyFlap $self)
  returns gdouble
  is native(handy)
  is export
{ * }

sub hdy_flap_get_separator (HdyFlap $self)
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_flap_get_swipe_to_close (HdyFlap $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_flap_get_swipe_to_open (HdyFlap $self)
  returns uint32
  is native(handy)
  is export
{ * }

sub hdy_flap_get_transition_type (HdyFlap $self)
  returns HdyFlapTransitionType
  is native(handy)
  is export
{ * }

sub hdy_flap_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_flap_set_content (HdyFlap $self, GtkWidget $content)
  is native(handy)
  is export
{ * }

sub hdy_flap_set_flap (HdyFlap $self, GtkWidget $flap)
  is native(handy)
  is export
{ * }

sub hdy_flap_set_flap_position (HdyFlap $self, GtkPackType $position)
  is native(handy)
  is export
{ * }

sub hdy_flap_set_fold_duration (HdyFlap $self, guint $duration)
  is native(handy)
  is export
{ * }

sub hdy_flap_set_fold_policy (HdyFlap $self, HdyFlapFoldPolicy $policy)
  is native(handy)
  is export
{ * }

sub hdy_flap_set_locked (HdyFlap $self, gboolean $locked)
  is native(handy)
  is export
{ * }

sub hdy_flap_set_modal (HdyFlap $self, gboolean $modal)
  is native(handy)
  is export
{ * }

sub hdy_flap_set_reveal_duration (HdyFlap $self, guint $duration)
  is native(handy)
  is export
{ * }

sub hdy_flap_set_reveal_flap (HdyFlap $self, gboolean $reveal_flap)
  is native(handy)
  is export
{ * }

sub hdy_flap_set_separator (HdyFlap $self, GtkWidget $separator)
  is native(handy)
  is export
{ * }

sub hdy_flap_set_swipe_to_close (HdyFlap $self, gboolean $swipe_to_close)
  is native(handy)
  is export
{ * }

sub hdy_flap_set_swipe_to_open (HdyFlap $self, gboolean $swipe_to_open)
  is native(handy)
  is export
{ * }

sub hdy_flap_set_transition_type (
  HdyFlap               $self,
  HdyFlapTransitionType $transition_type
)
  is native(handy)
  is export
{ * }
