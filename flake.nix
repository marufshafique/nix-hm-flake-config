{
  description = "Home Manager configuration of maruf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    omarchy-nix = {
      url = "github:henrysipp/omarchy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      omarchy-nix,
      home-manager,
      ...
    }:
    let
      linux = "x86_64-linux";
      mac = "aarch64-darwin";
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = linux;

        modules = [
          ./configuration.nix
          omarchy-nix.nixosModules.default
          home-manager.nixosModules.home-manager # Add this import
          {
            # Configure omarchy
            omarchy = {
              full_name = "Maruf Shafique";
              email_address = "imaruf.m@gmail.com";
              theme = "tokyo-night";
            };

            home-manager = {
              users.marufs = {
                nixpkgs.config.allowUnfree = true;

                imports = [
                  omarchy-nix.homeManagerModules.default
                  ./home.nix
                ];
              };
            };
          }
        ];
      };

      # home config for x86 linux
      homeConfigurations."maruf" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${linux};

        modules = [
          ./home.nix
        ];
      };

      # home config for aarch64 nix-darwin
      homeConfigurations."marufs" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${mac};

        modules = [
          ./marufs.nix
        ];
      };
    };
}
