use v6.c;

use Method::Also;

use NativeCall;

use Handy::Raw::Types;

use GTK::DrawingArea;
use Handy::Carousel;

our subset HdyCarouselIndicatorLinesAncestry is export of Mu
  where HdyCarouselIndicatorLines | GtkDrawingAreaAncestry;

class Handy::Carousel::IndicatorLines is GTK::DrawingArea {
  has HdyCarouselIndicatorLines $!hcid;

  submethod BUILD( :$handy-carousel-lines ) {
    self.setHandyCarouselIndicatorLines($handy-carousel-lines)
      if $handy-carousel-lines;
  }

  method setHandyCarouselIndicatorLines (HdyCarouselIndicatorLinesAncestry $_)
    is also<setDrawingArea>
  {
    my $to-parent;

    $!hcid = do {
      when HdyCarouselIndicatorLines {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyCarouselIndicatorLines, $_);
      }
    }
    self.setWidget($to-parent);
  }

  method Handy::Raw::Definitions::HdyCarouselIndicatorLines
    is also<HdyCarouselIndicatorLines>
  { $!hcid }

  multi method new (
    HdyCarouselIndicatorLinesAncestry $handy-carousel-lines,
                                     :$ref                 = True
  ) {
    return Nil unless $handy-carousel-lines;

    my $o = self.bless( :$handy-carousel-lines );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-carousel-lines = hdy_carousel_indicator_lines_new();

    $handy-carousel-lines ?? self.bless( :$handy-carousel-lines ) !! Nil;
  }

  method carousel is rw {
    Proxy.new:
      FETCH => -> $     { self.get_carousel    },
      STORE => -> $, \v { self.set_carousel(v) }
  }

  method get_carousel ( :$raw = False ) is also<get-carousel> {
    propReturnObject(
      hdy_carousel_indicator_lines_get_carousel($!hcid),
      $raw,
      |Handy::Carousel.getTypePair
    );
  }

  method set_carousel (HdyCarousel() $carousel) is also<set-carousel> {
    hdy_carousel_indicator_lines_set_carousel($!hcid, $carousel);
  }
}


### /usr/local/include/libhandy-1/hdy-carousel-indicator-lines.h

sub hdy_carousel_indicator_lines_get_carousel (HdyCarouselIndicatorLines $self)
  returns HdyCarousel
  is native(handy)
  is export
{ * }

sub hdy_carousel_indicator_lines_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_carousel_indicator_lines_set_carousel (
  HdyCarouselIndicatorLines $self,
  HdyCarousel              $carousel
)
  is native(handy)
  is export
{ * }
