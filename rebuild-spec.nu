#!/usr/bin/env nu
# A nixos-rebuild helper
def main [action: string, specialisation: string = ""] {
    sudo -A nixos-rebuild $action --impure --specialisation $specialisation --flake $'.#($env.HARDWARE_NAME)'
}
