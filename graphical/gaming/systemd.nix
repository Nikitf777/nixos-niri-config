{ config, pkgs, ... }:
let
  gamescope = pkgs.callPackage ../scripts/gamescope-steam-session.nix { };
in
{
  systemd.user.services.gamescope-steam-session = {
    description = "Gamescope Steam Session";
    after = [ "graphical-session.target" ];
    wantedBy = [ "default.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${gamescope}/bin/gamescope-steam-session";
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };
}
