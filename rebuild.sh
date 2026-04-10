#!/bin/sh
# A nixos-rebuild helper
sudo -A nixos-rebuild $1 --specialisation $2 --flake .#nixos
