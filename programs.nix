{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.silentSDDM.nixosModules.default ];
  programs = {
    # System
    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };

    # Terminal
    zsh.enable = true;
    fish.enable = true;
  };
}
