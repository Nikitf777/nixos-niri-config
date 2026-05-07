{ config, pkgs, ... }:
let
  gamescope = pkgs.callPackage ./scripts/gamescope-steam-session.nix { };
in
{
  environment = {

    sessionVariables = {
      PROTON_USE_WAYLAND = "1";
    };

    systemPackages =
      with pkgs;
      [
        mangohud
        mangojuice
        gpu-screen-recorder-gtk
        gpu-viewer
        proton-vpn
      ]
      ++ [
        gamescope
      ];
  };
}
