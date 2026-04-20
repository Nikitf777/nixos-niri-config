{ config, pkgs, ... }:
{
  # Desktop
  services.displayManager.sddm.enable = true;
  services.displayManager.sessionPackages = with pkgs; [ niri ];
  # Workaround for niri not supporting using the Super key as a standalone bind (and doesn't seem to support the F keys above F12 unfortunately)
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            meta = "overload(meta, scrolllock)";
          };
        };
      };
    };
  };

  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
      {
        name = "flathub-beta";
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }
      {
        name = "gnome-nightly";
        location = "https://nightly.gnome.org/gnome-nightly.flatpakrepo";
      }
    ];
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
