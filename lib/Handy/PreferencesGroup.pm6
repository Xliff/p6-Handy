use v6.c;

use Method::Also;

use NativeCall;

use Handy::Raw::Types;

use GTK::Bin;

our subset HdyPreferencesGroupAncestry is export of Mu
  where HdyPreferencesGroup | GtkBinAncestry;

class Handy::PreferencesGroup is GTK::Bin {
  has HdyPreferencesGroup $!hpg;

  submethod BUILD(:$handy-pref-group) {
    self.setHdyPreferenceGroup($handy-pref-group) if $handy-pref-group;
  }

  method Handy::Raw::Definitions::HdyPreferenceGroup
    is also<HdyPreferenceGroup>
  { $!hpg }

  method setHdyPreferenceGroup (HdyPreferencesGroupAncestry $_) {
    return unless $_;

    my $to-parent;
    $!hpg = do {
      when HdyPreferencesGroup {
        $to-parent = cast(GtkBin, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyPreferencesGroup, $_);
      }
    };
    self.setGtkBin($to-parent);
  }

  multi method new (
    HdyPreferencesGroupAncestry $handy-pref-group,
                                :$ref              = True
  ) {
    return Nil unless $handy-pref-group;

    my $o = self.bless( :$handy-pref-group );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-pref-group = hdy_preferences_group_new();

    $handy-pref-group ?? self.bless( :$handy-pref-group ) !! Nil;
  }

  method description is rw {
    Proxy.new:
      FETCH => -> $     { self.get_description    },
      STORE => -> $, \v { self.set_description(v) }
  }

  method title is rw {
    Proxy.new:
      FETCH => -> $     { self.get_title    },
      STORE => -> $, \v { self.set_title(v) }
  }

  method get_description is also<get-description> {
    hdy_preferences_group_get_description($!hpg);
  }

  method get_title is also<get-title> {
    hdy_preferences_group_get_title($!hpg);
  }

  method set_description (Str() $description) is also<set-description> {
    hdy_preferences_group_set_description($!hpg, $description);
  }

  method set_title (Str() $title) is also<set-title> {
    hdy_preferences_group_set_title($!hpg, $title);
  }

}

### /usr/include/libhandy-1/hdy-preferences-group.h

sub hdy_preferences_group_get_description (HdyPreferencesGroup $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_preferences_group_get_title (HdyPreferencesGroup $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_preferences_group_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_preferences_group_set_description (
  HdyPreferencesGroup $self,
  Str                 $description
)
  is native(handy)
  is export
{ * }

sub hdy_preferences_group_set_title (HdyPreferencesGroup $self, Str $title)
  is native(handy)
  is export
{ * }
