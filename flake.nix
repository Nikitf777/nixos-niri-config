{
  description = "A niri + dms config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:Nikitf777/nixos-hardware/16-e0105nw";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/quickshell/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    freesmlauncher = {
      url = "github:FreesmTeam/FreesmLauncher/develop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-hardware,
      home-manager,
      silentSDDM,
      quickshell,
      nix-flatpak,
      freesmlauncher,
    }@inputs:
    let
      system = "x86_64-linux";
      genericModules = [
        nix-flatpak.nixosModules.nix-flatpak
        ./configuration.nix

        {
          specialisation = {
            desktop.configuration = {
              imports = [
                ./graphical/desktop/configuration.nix
              ];
            };

            gaming.configuration =
              { config, pkgs, ... }:
              {
                imports = [
                  ./graphical/gaming/configuration.nix
                ];
              };

            server.configuration =
              { config, pkgs, ... }:
              {
                imports = [
                  ./headless/server/configuration.nix
                ];
              };
          };
        }
      ];
    in
    {
      nixosConfigurations.generic = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = genericModules;
      };

      nixosConfigurations.hp-victus-16-e0105nw = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = genericModules ++ [ nixos-hardware.nixosModules.hp-victus-16-e0105nw ];
      };

      homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./home.nix ];
      };
    };
}
