use v6.c;

use Method::Also;

use NativeCall;

use Handy::Raw::Types;

use GTK::DrawingArea;
use Handy::Carousel;

our subset HdyCarouselIndicatorDotsAncestry is export of Mu
  where HdyCarouselIndicatorDots | GtkDrawingAreaAncestry;

class Handy::Carousel::IndicatorDots is GTK::DrawingArea {
  has HdyCarouselIndicatorDots $!hcid;

  submethod BUILD( :$handy-carousel-dots ) {
    self.setHandyCarouselIndicatorDots($handy-carousel-dots)
      if $handy-carousel-dots;
  }

  method setHandyCarouselIndicatorDots (HdyCarouselIndicatorDotsAncestry $_)
    is also<setDrawingArea>
  {
    my $to-parent;

    $!hcid = do {
      when HdyCarouselIndicatorDots {
        $to-parent = cast(GtkWidget, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(HdyCarouselIndicatorDots, $_);
      }
    }
    self.setWidget($to-parent);
  }

  method Handy::Raw::Definitions::HdyCarouselIndicatorDots
    is also<HdyCarouselIndicatorDots>
  { $!hcid }

  multi method new (
    HdyCarouselIndicatorDotsAncestry $handy-carousel-dots,
                                     :$ref                 = True
  ) {
    return Nil unless $handy-carousel-dots;

    my $o = self.bless( :$handy-carousel-dots );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $handy-carousel-dots = hdy_carousel_indicator_dots_new();

    $handy-carousel-dots ?? self.bless( :$handy-carousel-dots ) !! Nil;
  }

  method carousel is rw {
    Proxy.new:
      FETCH => -> $     { self.get_carousel    },
      STORE => -> $, \v { self.set_carousel(v) }
  }

  method get_carousel ( :$raw = False ) is also<get-carousel> {
    propReturnObject(
      hdy_carousel_indicator_dots_get_carousel($!hcid),
      $raw,
      |Handy::Carousel.getTypePair
    );
  }

  method set_carousel (HdyCarousel() $carousel) is also<set-carousel> {
    hdy_carousel_indicator_dots_set_carousel($!hcid, $carousel);
  }
}


### /usr/local/include/libhandy-1/hdy-carousel-indicator-dots.h

sub hdy_carousel_indicator_dots_get_carousel (HdyCarouselIndicatorDots $self)
  returns HdyCarousel
  is native(handy)
  is export
{ * }

sub hdy_carousel_indicator_dots_new ()
  returns GtkWidget
  is native(handy)
  is export
{ * }

sub hdy_carousel_indicator_dots_set_carousel (
  HdyCarouselIndicatorDots $self,
  HdyCarousel              $carousel
)
  is native(handy)
  is export
{ * }
