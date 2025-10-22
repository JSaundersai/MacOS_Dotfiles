#!/bin/bash

# Theme switcher for kitty
# Usage: ./switch-theme.sh [theme-name]

KITTY_DIR="$HOME/dotfiles_new/kitty"
CURRENT_THEME_FILE="$KITTY_DIR/current-theme.conf"

# Available themes
THEMES=("catppuccin-theme" "cyberdream" "oxocarbon" "tokyonight_day" "tokyonight_moon" "tokyonight_night" "tokyonight_storm")

if [ -z "$1" ]; then
    echo "Available themes:"
    for i in "${!THEMES[@]}"; do
        echo "  $((i+1)). ${THEMES[$i]}"
    done
    echo ""
    echo "Usage: $0 <theme-name or number>"
    exit 0
fi

THEME="$1"

# Check if input is a number
if [[ "$THEME" =~ ^[0-9]+$ ]]; then
    if [ "$THEME" -ge 1 ] && [ "$THEME" -le ${#THEMES[@]} ]; then
        THEME="${THEMES[$((THEME-1))]}"
    else
        echo "Invalid theme number. Choose between 1 and ${#THEMES[@]}"
        exit 1
    fi
fi

# Check if theme file exists
if [ ! -f "$KITTY_DIR/$THEME.conf" ]; then
    echo "Theme file not found: $KITTY_DIR/$THEME.conf"
    exit 1
fi

# Update current-theme.conf
echo "include $THEME.conf" > "$CURRENT_THEME_FILE"
echo "✓ Theme switched to: $THEME"
echo "Reload kitty config with: Cmd+Shift+Ctrl+F"
