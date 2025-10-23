#!/bin/sh

# Check if WiFi is connected by looking for active connection
WIFI_INFO=$(system_profiler SPAirPortDataType 2>/dev/null)

# Check if we have a current network connection
if echo "$WIFI_INFO" | grep -q "Current Network Information:"; then
  # Check if the SSID line exists and is not empty
  SSID_LINE=$(echo "$WIFI_INFO" | awk '/Current Network Information:/ { getline; print; exit }')
  
  # Extract SSID, handling both redacted and normal cases
  SSID=$(echo "$SSID_LINE" | sed 's/^[[:space:]]*//' | sed 's/:$//')
  
  if [ "$SSID" = "<redacted>" ]; then
    # Connected but SSID is redacted - show connected status
    sketchybar --set $NAME icon="􀙇" label="Connected"
  elif [ -n "$SSID" ] && [ "$SSID" != "" ]; then
    # Show actual SSID
    sketchybar --set $NAME icon="􀙇" label="$SSID"
  else
    # No SSID found
    sketchybar --set $NAME icon="􀙈" label="Disconnected"
  fi
else
  # No WiFi connection
  sketchybar --set $NAME icon="􀙈" label="Disconnected"
fi
