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
            ./config/desktop/host.nix
            pkgs-ext.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = specialArgs;
                users.shudawei = import ./config/desktop/home.nix;
              };
            }
          ];
        };
      };
    };
}
