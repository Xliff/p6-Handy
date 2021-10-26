use v6.c;

use GLib::Raw::Definitions;

unit package Handy::Raw::Enums;

constant HdyCenteringPolicy is export := guint32;
our enum HdyCenteringPolicyEnum is export <
  HDY_CENTERING_POLICY_LOOSE
  HDY_CENTERING_POLICY_STRICT
>;

constant HdyDeckTransitionType is export := guint32;
our enum HdyDeckTransitionTypeEnum is export <
  HDY_DECK_TRANSITION_TYPE_OVER
  HDY_DECK_TRANSITION_TYPE_UNDER
  HDY_DECK_TRANSITION_TYPE_SLIDE
>;

constant HdyFlapFoldPolicy is export := guint32;
our enum HdyFlapFoldPolicyEnum is export <
  HDY_FLAP_FOLD_POLICY_NEVER
  HDY_FLAP_FOLD_POLICY_ALWAYS
  HDY_FLAP_FOLD_POLICY_AUTO
>;

constant HdyFlapTransitionType is export := guint32;
our enum HdyFlapTransitionTypeEnum is export <
  HDY_FLAP_TRANSITION_TYPE_OVER
  HDY_FLAP_TRANSITION_TYPE_UNDER
  HDY_FLAP_TRANSITION_TYPE_SLIDE
>;

constant HdyHeaderGroupChildType is export := guint32;
our enum HdyHeaderGroupChildTypeEnum is export <
  HDY_HEADER_GROUP_CHILD_TYPE_HEADER_BAR
  HDY_HEADER_GROUP_CHILD_TYPE_GTK_HEADER_BAR
  HDY_HEADER_GROUP_CHILD_TYPE_HEADER_GROUP
>;

constant HdyLeafletTransitionType is export := guint32;
our enum HdyLeafletTransitionTypeEnum is export <
  HDY_LEAFLET_TRANSITION_TYPE_OVER
  HDY_LEAFLET_TRANSITION_TYPE_UNDER
  HDY_LEAFLET_TRANSITION_TYPE_SLIDE
>;

constant HdyNavigationDirection is export := guint32;
our enum HdyNavigationDirectionEnum is export <
  HDY_NAVIGATION_DIRECTION_BACK
  HDY_NAVIGATION_DIRECTION_FORWARD
>;

constant HdySqueezerTransitionType is export := guint32;
our enum HdySqueezerTransitionTypeEnum is export <
  HDY_SQUEEZER_TRANSITION_TYPE_NONE
  HDY_SQUEEZER_TRANSITION_TYPE_CROSSFADE
>;

constant HdyViewSwitcherPolicy is export := guint32;
our enum HdyViewSwitcherPolicyEnum is export <
  HDY_VIEW_SWITCHER_POLICY_AUTO
  HDY_VIEW_SWITCHER_POLICY_NARROW
  HDY_VIEW_SWITCHER_POLICY_WIDE
>;
