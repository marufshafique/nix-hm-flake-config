{
  description = "Home Manager configuration of maruf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		neovim.url = "github:nixos/nixpkgs?rev=e9f00bd893984bc8ce46c895c3bf7cac95331127";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
        # to have it up-to-date or simply don't specify the nixpkgs input
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };
  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      zen-browser,
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
                  zen-browser.homeModules.beta
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

				extraSpecialArgs = {
					neovimPkgs = import inputs.neovim {
						system = mac;
						config.allowUnfree = true;
					};
				};

        modules = [
          ./marufs.nix
        ];
      };
    };
}
