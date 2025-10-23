#!/bin/bash

if pgrep -f "kitty" > /dev/null; then
  # Kitty is running, focus it
  aerospace focus --app-id net.kovidgoyal.kitty
else
  # Kitty not running, open it
  open -a kitty
fi
