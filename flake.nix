{
  description = "nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    sddm-rose-pine = {
      url = "github:lwndhrst/sddm-rose-pine";
      flake = false;
    };
  };

  outputs = { ... } @ inputs:
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
