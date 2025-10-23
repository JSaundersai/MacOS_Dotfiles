#!/bin/bash

sketchybar --add event aerospace_workspace_change

sketchybar --add item aerospace_dummy left \
  --set aerospace_dummy display=0 \
  script="$PLUGIN_DIR/spaces.sh" \
  --subscribe aerospace_dummy aerospace_workspace_change

# Define the specific workspaces to show
workspaces=("1" "2" "3" "D" "T" "W")

for m in $(aerospace list-monitors | awk '{print $1}'); do
  for sid in "${workspaces[@]}"; do
    # Always create workspace items in the correct order, regardless of existence
    sketchybar --add space space.$sid left \
      --set space.$sid space=$sid \
      icon=$sid \
      background.color=$TRANSPARENT \
      label.color=$ACCENT_COLOR \
      icon.color=$ACCENT_COLOR \
      display=$m \
      label.font="sketchybar-app-font:Regular:12.0" \
      icon.font="SF Pro:Semibold:12.0" \
      label.padding_right=10 \
      label.y_offset=-1 \
      click_script="$PLUGIN_DIR/space_click.sh $sid"

    apps=$(aerospace list-windows --monitor "$m" --workspace "$sid" 2>/dev/null |
      awk -F '|' '{gsub(/^ *| *$/, "", $2); if (!seen[$2]++) print $2}')

    icon_strip=""
    if [ -n "${apps}" ]; then
      while read -r app; do
        icon_strip+=" $($PLUGIN_DIR/icons.sh "$app")"
      done <<<"${apps}"
    else
      icon_strip=""
    fi

    sketchybar --set space.$sid label="$icon_strip"
  done
  
  # Keep empty workspaces visible (no hiding for --empty)
# for empty_space in $(aerospace list-workspaces --monitor $m --empty); do
#   sketchybar --set space.$empty_space display=0
# done
  for focus in $(aerospace list-workspaces --focused); do
    sketchybar --set space.$focus background.drawing=on \
      background.color=$ACCENT_COLOR \
      label.color=$ITEM_COLOR \
      icon.color=$ITEM_COLOR
  done
done
