#!/bin/bash

sketchybar --add item calendar right \
  --set calendar \
    icon= \
    icon.color=$ITEM_COLOR \
    label.color=$ITEM_COLOR \
    update_freq=10 \
    script="$PLUGIN_DIR/calendar.sh"
