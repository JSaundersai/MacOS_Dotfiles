#!/bin/bash

sketchybar --add item memory right \
  --set memory \
    icon= \
    background.width=50 \
    icon.padding_right=6 \
    label.padding_left=4 \
    label.padding_right=8 \
    update_freq=2 \
    script="$PLUGIN_DIR/memory.sh"
