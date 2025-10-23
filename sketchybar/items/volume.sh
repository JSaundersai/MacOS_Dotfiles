#!/bin/bash

sketchybar --add item volume right \
  --set volume \
    icon.color=$ITEM_COLOR \
    label.color=$ITEM_COLOR \
    update_freq=1 \
    script="$PLUGIN_DIR/volume.sh" \
    --subscribe volume volume_change
