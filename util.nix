{ inputs, lib, pkgs, system }:

{
  nixosConfiguration = hostName: lib.nixosSystem rec {
    inherit system;
    specialArgs = { inherit inputs pkgs system; };
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
