{
  description = "Home Manager configuration of maruf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
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
          home-manager.nixosModules.home-manager # Add this import
          {
            home-manager = {
              users.marufs = {
                nixpkgs.config.allowUnfree = true;

                imports = [
                  ./home.nix
                ];
              };
            };
          }
        ];
      };

      # home config for aarch64 nix-darwin
      homeConfigurations."marufs" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = mac;
          config.allowUnfree = true;
        };

        modules = [
          ./marufs.nix
        ];
      };
    };
}
