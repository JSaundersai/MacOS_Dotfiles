#!/bin/bash

# Wallpaper changer script for macOS
# Usage: ./change_wallpaper.sh [wallpaper-name]
# Example: ./change_wallpaper.sh mountain

WALLPAPER_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to display usage
usage() {
    echo "Usage: $0 [wallpaper-name]"
    echo ""
    echo "Available wallpapers:"
    ls -1 "$WALLPAPER_DIR" | grep -E '\.(jpg|jpeg|png|gif)$' | sed 's/\.[^.]*$//' | sed 's/^/  - /'
    echo ""
    echo "Example: $0 mountain"
}

# If no argument provided, show usage
if [ $# -eq 0 ]; then
    usage
    exit 0
fi

# Get wallpaper name from argument
WALLPAPER_NAME="$1"

# Find the wallpaper file (case-insensitive)
WALLPAPER_FILE=$(find "$WALLPAPER_DIR" -maxdepth 1 -iname "${WALLPAPER_NAME}.*" \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | head -1)

# Check if wallpaper exists
if [ -z "$WALLPAPER_FILE" ]; then
    echo "❌ Wallpaper not found: $WALLPAPER_NAME"
    echo ""
    usage
    exit 1
fi

# Set wallpaper using macOS defaults
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$WALLPAPER_FILE\"" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "✅ Wallpaper changed to: $(basename "$WALLPAPER_FILE")"
else
    echo "❌ Failed to change wallpaper"
    exit 1
fi
