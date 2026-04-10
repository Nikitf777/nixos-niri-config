This is a NixOS config with three specializations:
* Desktop - graphical/desktop/configuration.nix (niri + DankMaterialShell)
* Gaming - graphical/gaming/configuration.nix (Gamescope + steam)
* Server - healess/server/configuration.nix (Hardened LTS kernel and nothing else for now)

They are defined in flake.nix.

Both `desktop` and `gaming` depend on `graphical/configuration.nix`.
`server` depends on `headless/configuration.nix` (it's empty for now).

To check if the config is building, use the `mise build` command.
