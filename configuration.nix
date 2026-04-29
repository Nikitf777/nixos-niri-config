{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./programs.nix
    ./environment.nix
  ];

  boot = {
    # Bootloader.
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Minsk";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  users.defaultUserShell = pkgs.nushell;

  users.groups.steam-games = { };

  systemd.tmpfiles.rules = [
    "d /home/SteamLibrary 0775 root steam-games -"
  ];

  systemd.services.set-steam-library-group = {
    description = "";
    before = [ "graphical-session.target" ];
    wantedBy = [ "default.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = pkgs.writeShellScript "set-steam-library-group" ''
        chown -R :steam-games /home/SteamLibrary
        chmod -R g+rwX /home/SteamLibrary
      '';
    };
  };

  users.users.steamuser = {
    isNormalUser = true;
    description = "";
    extraGroups = [
      "networkmanager"
      "steam-games"
    ];
  };

  users.users.nikitf777 = {
    isNormalUser = true;
    description = "Nikita Samusev";
    extraGroups = [
      "networkmanager"
      "wheel"
      "steam-games"
    ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
