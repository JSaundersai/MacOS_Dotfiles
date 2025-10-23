#!/bin/bash

sketchybar --add item front_app left \
  --set front_app \
    background.color=$ACCENT_COLOR \
    label.color=$ITEM_COLOR \
    icon.color=$ITEM_COLOR \
    label.font="SF Pro:Semibold:12.0" \
    icon.font="Hack Nerd Font:Bold:14.0" \
    script="$PLUGIN_DIR/front_app.sh" \
    --subscribe front_app front_app_switched
