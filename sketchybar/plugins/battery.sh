#!/bin/bash

BATTERY=$(pmset -g batt | grep -Eo '\d+%' | cut -d% -f1)
STATUS=$(pmset -g batt | grep "AC Power" | awk '{print $NF}')

if [ "$STATUS" = "connected" ]; then
  ICON="󰂄"
else
  if [ "$BATTERY" -gt 80 ]; then
    ICON="󰁹"
  elif [ "$BATTERY" -gt 60 ]; then
    ICON="󰂂"
  elif [ "$BATTERY" -gt 40 ]; then
    ICON="󰂁"
  elif [ "$BATTERY" -gt 20 ]; then
    ICON="󰂀"
  else
    ICON="󰂃"
  fi
fi

sketchybar --set battery icon="$ICON" label="${BATTERY}%"
