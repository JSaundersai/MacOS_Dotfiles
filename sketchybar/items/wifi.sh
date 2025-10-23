#!/bin/bash

sketchybar --add item wifi right \
  --set wifi \
    icon= \
    background.width=100 \
    icon.padding_right=6 \
    label.padding_left=4 \
    label.padding_right=8 \
    update_freq=5 \
    script="$PLUGIN_DIR/wifi.sh"
