use v6.c;

use NativeCall;a

use GLib::Roles::Pointers;

unit package Handy::Raw::Definitions;

constant handy is export = 'handy-1',v0;

# Objects
class HdyActionRow         is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyApplicationWindow is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyComboRow          is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyDeck              is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyExpanderRow       is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyHeaderBar         is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyKeypad            is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyLeaflet           is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyPreferencesGroup  is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyPreferencesPage   is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyPreferencesRow    is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyPreferencesWindow is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdySearchBar         is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyWindow            is repr<CPointer> does GLib::Roles::Pointers is export { }

# Roles
class HdySwipeable         is repr<CPointer> does GLib::Roles::Pointers is export { }
