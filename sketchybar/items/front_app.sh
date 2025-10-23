#!/bin/bash

sketchybar --add item front_app left \
  --set front_app \
    background.color=$ACCENT_COLOR \
    background.width=120 \
    label.color=$ITEM_COLOR \
    label.font="SF Pro:Semibold:12.0" \
    label.padding_left=12 \
    label.padding_right=12 \
    icon.drawing=off \
    script="$PLUGIN_DIR/front_app.sh" \
    --subscribe front_app front_app_switched
