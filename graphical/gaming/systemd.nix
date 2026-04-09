{ config, pkgs, ... }:
{
  systemd.user.services.gamescope-session = {
    description = "Gamescope Steam Session";
    after = [ "graphical-session.target" ];
    wantedBy = [ "default.target" ];

    serviceConfig = {
      Type = "simple";
      Environment = [
        "MANGOHUD=1"
        "MANGOHUD_CONFIG=cpu_temp,gpu_temp,ram,vram"
      ];
      ExecStart = pkgs.writeShellScript "gamescope-session" ''
        exec ${pkgs.gamescope}/bin/gamescope \
          --adaptive-sync \
          --hdr-enabled \
          --mangoapp \
          --rt \
          --steam \
          -- ${pkgs.steam}/bin/steam \
            -pipewire-dmabuf \
            -tenfoot
      '';
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };
}
