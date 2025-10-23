#!/bin/bash

sketchybar --add item battery right \
  --set battery \
    icon.color=$ITEM_COLOR \
    label.color=$ITEM_COLOR \
    update_freq=30 \
    script="$PLUGIN_DIR/battery.sh"
