{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.silentSDDM.nixosModules.default
    inputs.noctalia.nixosModules.default
  ];

  programs = {
    # System
    silentSDDM = {
      enable = true;
      theme = "default";
    };

    # Desktop
    niri = {
      enable = true;
      useNautilus = true;
    };

    noctalia = {
      enable = true;
      systemd.enable = true;
    };

    nautilus-open-any-terminal = {
      enable = true;
      terminal = "ghostty";
    };

    kdeconnect.enable = true;

    thunderbird.enable = true;

    obs-studio.enable = true;
  };
}
