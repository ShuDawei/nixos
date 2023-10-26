{
  description = "nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    grub-theme = {
      url = "github:catppuccin/grub";
      flake = false;
    };
    getchoo.url = "/home/shudawei/git/getchoo.nix-exprs";
  };

  outputs =
    { self
    , nixpkgs
    , nixpkgs-stable
    , ...
    } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-stable = import nixpkgs-stable {
        inherit system;
      };
      pkgs-ext = {
        inherit (inputs) home-manager neovim hyprland-contrib;
      };
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem rec {
          inherit system;
          specialArgs = {
            inherit pkgs pkgs-stable inputs pkgs-ext;
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
