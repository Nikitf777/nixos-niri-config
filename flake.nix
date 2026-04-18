{
  description = "A niri + dms config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";


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

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
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
      dms,
      zen-browser,
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = { inherit inputs; };

        modules = [
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
      };

      homeConfigurations.user = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./home.nix ];
      };
    };
}
