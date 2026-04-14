{ config, pkgs, ... }:
{
  systemd.user.services.prepare-niri-config = {
    description = "";
    before = [ "graphical-session.target" ];
    wantedBy = [ "default.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = pkgs.writeShellScript "prepare-niri-config" "touch ~/.config/niri/input.kdl";
    };
  };
}
