use v6.c;

use NativeCall;

use Handy::Raw::Definitions;

use GLib::Roles::StaticClass;

class Handy::Main {
  also does GLib::Roles::StaticClass;

  method init {
    hdy_init();
  }
}

### /usr/local/include/libhandy-1/hdy-main.h

sub hdy_init ()
  is native(handy)
  is export
{ * }
