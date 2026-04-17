{ config, pkgs, ... }:
let
  gamescope = pkgs.callPackage ./scripts/gamescope-steam-session.nix { };
in
{
  environment = {
    systemPackages =
      with pkgs;
      [
        mangohud
      ]
      ++ [
        gamescope
      ];
  };
}
