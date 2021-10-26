use v6.c;

use NativeCall;

use GLib::Raw::Definitions;

unit packager Handy::Raw::Class;

class HdyApplicationWindowClass is repr<CStruct> is export {
        has GtkApplicationWindowClass $!parent_class;
        has gpointer                  $!padding     ;
}

class HdyComboRowClass is repr<CStruct> is export {
        has HdyActionRowClass $!parent_class;
        has gpointer          $!padding     ;
}

class HdyDeckClass is repr<CStruct> is export {
        has GtkContainerClass $!parent_class;
        has gpointer          $!padding     ;
}

class HdyExpanderRowClass is repr<CStruct> is export {
        has HdyPreferencesRowClass $!parent_class;
        has gpointer               $!padding     ;
}

class HdyHeaderBarClass is repr<CStruct> is export {
        has GtkContainerClass $!parent_class;
        has gpointer          $!padding     ;
}

class HdyKeypadClass is repr<CStruct> is export {
        has GtkBinClass $!parent_class;
        has gpointer    $!padding     ;
}

class HdyLeafletClass is repr<CStruct> is export {
        has GtkContainerClass $!parent_class;
        has gpointer          $!padding     ;
}

class HdyPreferencesGroupClass is repr<CStruct> is export {
        has GtkBinClass $!parent_class;
        has gpointer    $!padding     ;
}

class HdyPreferencesPageClass is repr<CStruct> is export {
        has GtkBinClass $!parent_class;
        has gpointer    $!padding     ;
}

class HdyPreferencesRowClass is repr<CStruct> is export {
        has GtkListBoxRowClass $!parent_class;
        has gpointer           $!padding     ;
}

class HdyPreferencesWindowClass is repr<CStruct> is export {
        has HdyWindowClass $!parent_class;
        has gpointer       $!padding     ;
}

class HdySearchBarClass is repr<CStruct> is export {
        has GtkBinClass $!parent_class;
        has gpointer    $!padding     ;
}

class HdyWindowClass is repr<CStruct> is export {
        has GtkWindowClass $!parent_class;
        has gpointer       $!padding     ;
}
