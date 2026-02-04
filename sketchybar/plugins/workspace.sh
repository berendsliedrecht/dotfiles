#!/bin/bash

# workspace.sh - Plugin to display active workspace number
# Place this in ~/.config/sketchybar/plugins/workspace.sh
# Make it executable: chmod +x ~/.config/sketchybar/plugins/workspace.sh

# Get the current workspace/space number
# This works with yabai or native macOS spaces
if command -v yabai &> /dev/null; then
    # If yabai is installed, use it for better space detection
    SPACE=$(yabai -m query --spaces --space | jq -r '.index')
else
    # Fallback to aerospace or native detection
    if command -v aerospace &> /dev/null; then
        SPACE=$(aerospace list-workspaces --focused)
    else
        # Native macOS space detection (requires accessibility permissions)
        SPACE=$(yabai -m query --spaces --space 2>/dev/null | jq -r '.index' || echo "1")
    fi
fi

# Update the sketchybar item
sketchybar --set workspace label="$SPACE"
