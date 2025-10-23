#!/bin/bash
source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icon_map.sh"

destroy_spaces() {
  # Query all items in the bar and remove those prefixed with "space."
  local spaces_to_destroy
  spaces_to_destroy=$(sketchybar --query bar | jq -r '.items[] | select(startswith("space."))')

  for space in $spaces_to_destroy; do
    sketchybar --remove "$space"
  done
}

# Create space items for each workspace on the focused monitor
create_spaces() {
  local last_space=""
  local focused_monitor_workspaces
  # Define the specific workspaces to show
  workspaces=("1" "2" "3" "D" "T" "W")
  
  for sid in "${workspaces[@]}"; do
    # Build icon strip based on apps present in workspace
    local apps icon_strip=""
    apps=$(aerospace list-windows --workspace "$sid" 2>/dev/null | awk -F'|' '{print $2}' | sort -u)

    if [ -n "$apps" ]; then
      while read -r app; do
        icon_strip+=" $($PLUGIN_DIR/icons.sh "$app")"
      done <<< "$apps"
    else
      icon_strip="—"
    fi

    # Determine focus state (default to not focused)
    local is_focused=1
    if aerospace list-workspaces --focused 2>/dev/null | grep -q "^${sid}$"; then
      is_focused=0
    fi

    local bg_color label_color icon_color
    if [ "$is_focused" -eq 0 ]; then
      bg_color=$ACCENT_COLOR
      label_color=$ITEM_COLOR
      icon_color=$ITEM_COLOR
    else
      bg_color=$TRANSPARENT
      label_color=$ACCENT_COLOR
      icon_color=$ACCENT_COLOR
    fi

    # Only add the space item if it doesn't already exist
    if ! sketchybar --query space.$sid >/dev/null 2>&1; then
      sketchybar --add space space.$sid left
    fi
    
    sketchybar --set space.$sid space=$sid \
                                icon=$sid \
                                label="$icon_strip" \
                                background.color=$bg_color \
                                label.color=$label_color \
                                icon.color=$icon_color \
                                label.font="sketchybar-app-font:Regular:12.0" \
                                icon.font="SF Pro:Semibold:12.0" \
                                label.padding_right=10 \
                                label.y_offset=-1 \
                                click_script="aerospace workspace $sid"

    last_space="space.$sid"
  done

  # Move front_app to the right of the last workspace item
  if sketchybar --query front_app >/dev/null 2>&1 && [ -n "$last_space" ]; then
    sketchybar --move front_app after "$last_space"
  fi
}

# Main flow - create spaces on first run, then only update on changes
if [ ! -f /tmp/sketchybar_spaces_created ]; then
  create_spaces
  touch /tmp/sketchybar_spaces_created
fi

source "$CONFIG_DIR/colors.sh"

update_workspace_appearance() {
  local sid=$1
  local is_focused=$2
  
  if [ "$is_focused" = "true" ]; then
    sketchybar --set space.$sid background.drawing=on \
      background.color=$ACCENT_COLOR \
      label.color=$ITEM_COLOR \
      icon.color=$ITEM_COLOR
  else
    sketchybar --set space.$sid background.drawing=off \
      label.color=$ACCENT_COLOR \
      icon.color=$ACCENT_COLOR
  fi
}

update_icons() {
  m=$1
  sid=$2

  apps=$(aerospace list-windows --monitor "$m" --workspace "$sid" \
  | awk -F '|' '{gsub(/^ *| *$/, "", $2); if (!seen[$2]++) print $2}' \
  | sort)

  icon_strip=""
  if [ "${apps}" != "" ]; then
    while read -r app; do
      icon_strip+=" $($CONFIG_DIR/plugins/icons.sh "$app")"
    done <<<"${apps}"
  else 
    icon_strip=" —"
  fi

  sketchybar --animate sin 10 --set space.$sid label="$icon_strip"
}

# Only update appearance and icons on workspace change, don't recreate
if [ -n "$FOCUSED_WORKSPACE" ]; then
  update_workspace_appearance "$PREV_WORKSPACE" "false"
  update_workspace_appearance "$FOCUSED_WORKSPACE" "true"
  
  # Update icons for current workspace
  for m in $(aerospace list-monitors | awk '{print $1}'); do
    update_icons "$m" "$FOCUSED_WORKSPACE"
    if [ -n "$PREV_WORKSPACE" ]; then
      update_icons "$m" "$PREV_WORKSPACE"
    fi
  done
fi
