use v6.c;

use Method::Also;

use NativeCall;

use Handy::Raw::Types;

use GTK::Bin;

our subset HdyPreferencesGroupAncestry is export of Mu
  where HdyPreferencesGroup | GtkBinAncestry;

class Handy::PreferencesPage is GTK::Bin {
  has HdyPreferencesPage $!hpp;

  submethod BUILD(:$handy-pref-group) {
    self.setHdyPreferenceGroup($handy-pref-group) if $handy-pref-group;
  }

  method Handy::Raw::Definitions::HdyPreferenceGroup
    is also<HdyPreferenceGroup>
  { $!hpp }

  method setHdyPreferenceGroup (HdyPreferencesGroupAncestry $_) {
    return unless $_;

    my $to-parent;
    $!hpp = do {
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
    my $handy-pref-page = hdy_preferences_page_new();

    $handy-pref-page ?? self.bless( :$handy-pref-page ) !! Nil;
  }

  method icon_name is rw is also<icon-name> {
    Proxy.new:
      FETCH => -> $     { self.get_icon_name    },
      STORE => -> $, \v { self.set_icon_name(v) }
  }

  method title is rw {
    Proxy.new:
      FETCH => -> $     { self.get_title    },
      STORE => -> $, \v { self.set_title(v) }
  }

  method get_icon_name is also<get-icon-name> {
    hdy_preferences_page_get_icon_name($!hpp);
  }

  method get_title is also<get-title> {
    hdy_preferences_page_get_title($!hpp);
  }

  method set_icon_name (Str $icon_name) is also<set-icon-name> {
    hdy_preferences_page_set_icon_name($!hpp, $icon_name);
  }

  method set_title (Str $title) is also<set-title> {
    hdy_preferences_page_set_title($!hpp, $title);
  }

}


### /usr/include/libhandy-1/hdy-preferences-page.h

sub hdy_preferences_page_get_icon_name (HdyPreferencesPage $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_preferences_page_get_title (HdyPreferencesPage $self)
  returns Str
  is native(handy)
  is export
{ * }

sub hdy_preferences_page_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_preferences_page_set_icon_name (HdyPreferencesPage $self, Str $icon_name)
  is native(handy)
  is export
{ * }

sub hdy_preferences_page_set_title (HdyPreferencesPage $self, Str $title)
  is native(handy)
  is export
{ * }
