use v6.c;

use Method::Also;

use Handy::Raw::Types;
use Handy::Raw::StatusPage;

use GTK::Bin;

our subset HdyStatusPageAncestry is export of Mu
  where HdyStatusPage | GtkBinAncestry;

class Handy::StatusPage is GTK::Bin {
  has HdyStatusPage $!hsp;

  submethod BUILD(:$handy-status-page) {
    self.setHdyStatusPage($handy-status-page) if $handy-status-page;
  }

  method Handy::Raw::Definitions::HdyStatusPage
    is also<HdyStatusPage>
  { $!hsp }

  method setHdyStatusPage (HdyStatusPageAncestry $_) {
    return unless $_;

    my $to-parent;
    $!hsp = do {
      when HdyStatusPage {
        $to-parent = cast(GtkBin, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyStatusPage, $_);
      }
    };
    self.setGtkBin($to-parent);
  }

  multi method new (HdyStatusPageAncestry $handy-status-page, :$ref = True) {
    return Nil unless $handy-status-page;

    my $o = self.bless( :$handy-status-page );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-status-page = hdy_status_page_new();

    $handy-status-page ?? self.bless( :$handy-status-page ) !! Nil;
  }

  method description is rw {
    Proxy.new:
      FETCH => -> $     { self.get_description    },
      STORE => -> $, \v { self.set_description(v) }
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

  method get_description is also<get-description> {
    hdy_status_page_get_description($!hsp);
  }

  method get_icon_name is also<get-icon-name> {
    hdy_status_page_get_icon_name($!hsp);
  }

  method get_title is also<get-title> {
    hdy_status_page_get_title($!hsp);
  }

  method set_description (Str() $description) is also<set-description> {
    hdy_status_page_set_description($!hsp, $description);
  }

  method set_icon_name (Str() $icon_name) is also<set-icon-name> {
    hdy_status_page_set_icon_name($!hsp, $icon_name);
  }

  method set_title (Str() $title) is also<set-title> {
    hdy_status_page_set_title($!hsp, $title);
  }

}
