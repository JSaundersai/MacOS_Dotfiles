#!/bin/bash

MEMORY=$(vm_stat | grep "Pages active:" | awk '{print $3}' | sed 's/\.//')
TOTAL=$(sysctl -n hw.memsize | awk '{print int($1 / 1024 / 1024 / 1024)}')

MEMORY_GB=$(echo "scale=2; $MEMORY * 4 / 1024 / 1024" | bc)
PERCENT=$(echo "scale=0; $MEMORY_GB * 100 / $TOTAL" | bc)

if [ -z "$PERCENT" ] || [ "$PERCENT" -lt 0 ]; then
  PERCENT=0
fi

sketchybar --set memory icon="󰍛" label="${PERCENT}%"
