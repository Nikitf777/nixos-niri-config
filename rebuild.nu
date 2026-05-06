#!/usr/bin/env nu
# A nixos-rebuild helper
def main [action: string] {
    nixos-rebuild $action --impure --flake $'.#($env.HARDWARE_NAME)'
}
