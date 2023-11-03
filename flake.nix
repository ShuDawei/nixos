{
  description = "nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs =
    { self
    , nixpkgs
    , ...
    } @ inputs:
    let
      util = import ./util.nix rec {
        inherit inputs;
        inherit (nixpkgs) lib;
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        system = "x86_64-linux";
      };
    in
    {
      nixosConfigurations = {
        desktop = util.nixosConfiguration "desktop";
      };
    };
}
