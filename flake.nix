{
  description = "A niri + dms config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    nixos-hardware.url = "github:Nikitf777/nixos-hardware/16-e0105nw";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
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
      noctalia,
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
