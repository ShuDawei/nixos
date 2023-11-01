{
  description = "nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    hyprland-contrib.url = "github:hyprwm/contrib";
  };

  outputs = { ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      build = import ./build {
        inherit (nixpkgs) lib;
        inherit inputs pkgs system;
      };
    in
    {
      nixosConfigurations = {
        desktop = build (import ./hosts/desktop);
        # laptop = build (import ./hosts/laptop.nix);
      };
    };
}
