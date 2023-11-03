{ inputs, system }:

{
  nixosConfiguration = hostName: inputs.nixpkgs.lib.nixosSystem rec {
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
      ./${hostName}/host.nix
      ./${hostName}/hrdw.nix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = specialArgs;
          users.shudawei = { ... }: { imports = [ ./common/home ./${hostName}/home.nix ]; };
        };
      }
    ];
  };
}
