use v6.c;

use NativeCall;

use GLib::Roles::Pointers;

unit package Handy::Raw::Definitions;

constant handy is export = 'handy-1',v0;

# Superclasses
class HdyActionRow              is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyApplicationWindow      is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyComboRow               is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyDeck                   is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyExpanderRow            is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyHeaderBar              is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyKeypad                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyLeaflet                is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyPreferencesGroup       is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyPreferencesPage        is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyPreferencesRow         is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyPreferencesWindow      is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdySearchBar              is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyWindow                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyStyleManager           is repr<CPointer> does GLib::Roles::Pointers is export { }

# Final Types
class HdyAvatar                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyCarousel               is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyCarouselIndicatorDots  is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyCarouselIndicatorLines is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyClamp                  is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyEnumValueObject        is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyFlap                   is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyHeaderGroupChild       is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdySqueezer               is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyStatusPage             is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdySwipeGroup             is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdySwipeTracker           is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyTabBar                 is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyTabPage                is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyTabView                is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyTitleBar               is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyValueObject            is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyViewSwitcher           is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyViewSwitcherBar        is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyViewSwitcherTitle      is repr<CPointer> does GLib::Roles::Pointers is export { }
class HdyWindowHandle           is repr<CPointer> does GLib::Roles::Pointers is export { }

class HdyHeaderGroup            is repr<CPointer> does GLib::Roles::Pointers is export { }

# Roles
class HdySwipeable         is repr<CPointer> does GLib::Roles::Pointers is export { }
