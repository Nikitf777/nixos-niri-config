#!/bin/sh

# Try zenity in GUI environments, fallback to terminal prompt in TTY
if [ -n "$DISPLAY" ] || [ -n "$WAYLAND_DISPLAY" ]; then
    exec /run/current-system/sw/bin/zenity --password --title "Sudo authentication"
else
    stty -echo
    read -r -p "[sudo] password for $USER: " password
    stty echo
    printf '%s\n' "$password"
fi
