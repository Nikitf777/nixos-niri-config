#!/usr/bin/env nu

# Try zenity in GUI environments, fallback to terminal prompt in TTY
if DISPLAY in $env or WAYLAND_DISPLAY in $env {
    exec /run/current-system/sw/bin/zenity --password --title "Sudo authentication"
} else {
    print -e -n $"[sudo] password for ($env.USER | default 'user'): "
    stty -echo
    let password = (head -n 1 /dev/tty | str trim)
    stty echo
    print $password
}
