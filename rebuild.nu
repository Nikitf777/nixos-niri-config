#!/usr/bin/env nu
# A nixos-rebuild helper
def main [action: string, specialisation: string] {
    sudo -A nixos-rebuild $action --specialisation $specialisation --flake .#nixos
}
