{ inputs, lib, pkgs, system }:

{
  nixosConfiguration = hostName: lib.nixosSystem rec {
    inherit system;
    specialArgs = { inherit inputs pkgs system; };
    modules = [
      ./common/host
      ./common/home
      ./${hostName}/host.nix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = specialArgs;
          users.shudawei = import ./${hostName}/home.nix;
        };
      }
    ];
  };
}
