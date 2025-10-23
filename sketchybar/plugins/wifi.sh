#!/bin/bash

# Check if WiFi is connected
STATUS=$(system_profiler SPAirPortDataType 2>/dev/null | grep -i "status: connected")

if [ -n "$STATUS" ]; then
  # Get signal strength
  SIGNAL=$(system_profiler SPAirPortDataType 2>/dev/null | grep "Signal / Noise" | head -1 | awk '{print $3, $4, $5}')
  
  if [ -n "$SIGNAL" ]; then
    sketchybar --set wifi icon=󰤨 label="$SIGNAL"
  else
    sketchybar --set wifi icon=󰤨 label="Connected"
  fi
else
  sketchybar --set wifi icon=󰤮 label="No WiFi"
fi
