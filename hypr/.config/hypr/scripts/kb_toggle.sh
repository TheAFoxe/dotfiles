#!/bin/bash
# ~/.config/hypr/scripts/kb_toggle.sh

DEVICE="telink-endorfy-celeris-1800-cz"
# Get the current active keymap for the specific keyboard
CURRENT=$(hyprctl devices -j | jq -r ".keyboards[] | select(.name==\"$DEVICE\") | .active_keymap")

# Logic: If Russian (1), switch to US (0). Otherwise (US or CZ), switch to Russian (1).
if [[ "$CURRENT" == *"Russian"* ]]; then
    hyprctl switchxkblayout "$DEVICE" 0
else
    hyprctl switchxkblayout "$DEVICE" 1
fi
