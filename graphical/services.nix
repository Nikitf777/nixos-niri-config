{ config, pkgs, ... }:
{
  # Enable sound with pipewire.
  services = {
    upower.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    blueman.enable = true;

    lact.enable = true;
  };
}
