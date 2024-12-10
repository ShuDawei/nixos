{
  description = "nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
  };

  outputs =
    { ... }@inputs:
    let
      util = import ./util.nix {
        inherit inputs;
        system = "x86_64-linux";
      };
    in
    {
      nixosConfigurations = {
        desktop = util.nixosConfiguration "shudawei" "desktop";
        laptop = util.nixosConfiguration "shudawei" "laptop";
      };
    };
}
