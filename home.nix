{ config, pkgs, ... }:
{
  home.username = "nikitf777";
  home.homeDirectory = "/home/nikitf777";
  home.stateVersion = "26.05";

  xdg.configFile."niri/config.kdl".source = ./graphical/desktop/config/niri/home.kdl;
  xdg.configFile."niri/dms-overrides.kdl".source = ./graphical/desktop/config/niri/dms-overrides.kdl;
}
