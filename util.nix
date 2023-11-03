{ inputs, lib, pkgs, username }:

{
  nixosConfiguration = hostName: lib.nixosSystem {
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
          users.${username} = import ./${hostName}/home.nix;
        };
      }
    ];
  };
}
