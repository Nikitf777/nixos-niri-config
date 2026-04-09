{ config, pkgs, ... }:
{
  # Desktop
  services.displayManager.gdm.enable = true;
  services.displayManager.sessionPackages = with pkgs; [ niri ];
  services.desktopManager.gnome.enable = true;
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us,ru";
      variant = "";
    };
  };
  # Workaround for niri not supporting using the Super key as a standalone bind (and doesn't seem to support the F keys above F12 unfortunately)
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            meta = "overload(meta, f12)";
          };
        };
      };
    };
  };

  services.flatpak.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
