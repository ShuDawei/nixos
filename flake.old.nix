{
  description = "nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    hyprland-contrib.url = "github:hyprwm/contrib";
    grub-theme = {
      url = "github:catppuccin/grub";
      flake = false;
    };
  };

  outputs =
    { self
    , nixpkgs
    , ...
    } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-ext = {
        inherit (inputs) home-manager hyprland-contrib;
      };
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem rec {
          inherit system;
          specialArgs = {
            inherit pkgs inputs pkgs-ext;
          };
          modules = [
            ./old/config/desktop/host.nix
            pkgs-ext.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = specialArgs;
                users.shudawei = import ./old/config/desktop/home.nix;
              };
            }
          ];
        };
      };
    };
}
