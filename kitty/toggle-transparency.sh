#!/bin/bash

KITTY_CONF="$HOME/dotfiles_new/kitty/kitty.conf"

if grep -q 'background_opacity 0.8' "$KITTY_CONF"; then
	sed -i '' 's/background_opacity 0.8/background_opacity 1/g' "$KITTY_CONF"
	echo "Opacity set to 100%. Reload kitty config!"
elif grep -q 'background_opacity 1' "$KITTY_CONF"; then
	sed -i '' 's/background_opacity 1/background_opacity 0.8/g' "$KITTY_CONF"
	echo "Opacity set to 80%. Reload kitty config!"
else
	echo "No background_opacity found in kitty config"
fi
