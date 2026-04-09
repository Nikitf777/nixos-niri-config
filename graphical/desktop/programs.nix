{ config, pkgs, inputs, ... }:
{
  programs = {
    # System
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };

    # Desktop
    niri.enable = true;
    dms-shell = {
      enable = true;

      systemd = {
        enable = true;             # Systemd service for auto-start
        restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
      };

      quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
    };

    # Gaming
    steam.enable = true;

    # Terminal
    zsh.enable = true;
    fish.enable = true;
  };
}
