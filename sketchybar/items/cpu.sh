#!/bin/bash

sketchybar --add item cpu right \
  --set cpu \
    icon= \
    background.width=50 \
    icon.padding_right=6 \
    label.padding_left=4 \
    label.padding_right=8 \
    update_freq=2 \
    script="$PLUGIN_DIR/cpu.sh"
