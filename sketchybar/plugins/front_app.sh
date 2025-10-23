#!/bin/bash

source "$CONFIG_DIR/plugins/icon_map.sh"

# Get the frontmost app using AppleScript
FRONT_APP=$(osascript -e 'tell application "System Events" to name of first application process whose frontmost is true')

# Handle Electron apps - check for common ones
if [ "$FRONT_APP" = "Electron" ]; then
  # Try to get the actual app name from the window title or bundle identifier
  FRONT_APP=$(osascript -e 'tell application "System Events"
    set frontApp to first application process whose frontmost is true
    set appName to name of frontApp
    if appName is "Electron" then
      try
        set appPath to path of frontApp
        if appPath contains "Windsurf" then
          return "Windsurf"
        else if appPath contains "Cursor" then
          return "Cursor"
        end if
      end try
    end if
    return appName
  end tell')
fi

# Get icon for the app
__icon_map "$FRONT_APP"
APP_ICON="$icon_result"

# Update the item with icon and label
sketchybar --set front_app icon="$APP_ICON" label="$FRONT_APP"
