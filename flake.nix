{
  description = "nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    hyprwm-contrib.url = "github:hyprwm/contrib";
    sddm-catppuccin = {
      url = "github:catppuccin/sddm";
      flake = false;
    };
  };

  outputs =
    { ... }@inputs:
    let
      util = import ./util.nix rec {
        inherit inputs;
        system = "x86_64-linux";
      };
    in
    {
      nixosConfigurations = {
        desktop = util.nixosConfiguration "shudawei" "desktop";
      };
    };
}
