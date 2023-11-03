{ inputs, system }:

{
  nixosConfiguration = hostname: username: inputs.nixpkgs.lib.nixosSystem rec {
    inherit system;
    specialArgs = {
      inherit inputs system;
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    };
    modules = [
      ./common/host
      ./${hostname}/host.nix
      ./${hostname}/hrdw.nix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = specialArgs;
          users.${username} = { ... }: { imports = [ ./common/home ./${hostname}/home.nix ]; };
        };
      }
    ];
  };
}
