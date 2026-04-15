{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.silentSDDM.nixosModules.default
    inputs.dms.nixosModules.dank-material-shell
  ];
  programs = {
    # System
    silentSDDM = {
      enable = true;
      theme = "rei";
    };

    # Desktop
    niri.enable = true;
    dank-material-shell = {
      enable = true;

      systemd = {
        enable = true; # Systemd service for auto-start
        restartIfChanged = true; # Auto-restart dms.service when dms-shell changes
      };

      quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
    };
    gpu-screen-recorder.enable = true;
    obs-studio.enable = true;

    # Gaming
    steam.enable = true;
  };
}
