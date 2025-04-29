{
  description = "Home Manager configuration of maruf";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      linux = "x86_64-linux";
      mac = "aarch64-darwin";
      # pkgs = nixpkgs.legacyPackages.${linux};
    in {
      # home config for x86 linux
      homeConfigurations."maruf" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${linux};

        modules = [ 
          ./home.nix 
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
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
