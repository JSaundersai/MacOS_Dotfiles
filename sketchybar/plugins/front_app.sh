#!/bin/bash

# Get the frontmost app using AppleScript
FRONT_APP=$(osascript -e 'tell application "System Events" to name of first application process whose frontmost is true')

# Handle Electron apps - check for common ones by checking the process path
if [ "$FRONT_APP" = "Electron" ]; then
  # Try to get the actual app name from running processes
  if pgrep -f "Windsurf" > /dev/null 2>&1; then
    FRONT_APP="Windsurf"
  elif pgrep -f "Cursor" > /dev/null 2>&1; then
    FRONT_APP="Cursor"
  fi
fi

# Update with just the name, no icon
sketchybar --set front_app icon.drawing=off label="$FRONT_APP"
