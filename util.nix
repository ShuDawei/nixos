{ inputs, system }:

{
  nixosConfiguration =
    username: hostname:
    inputs.nixpkgs.lib.nixosSystem rec {
      inherit system;
      specialArgs = {
        inherit
          inputs
          system
          username
          hostname
          ;
        pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
          #overlays = [
          #  (final: prev: {
          #    shudawei = {
          #      dev = import ./common/pkgs/dev prev;
          #      gpuinf = import ./common/pkgs/gpuinf prev;
          #      vol = import ./common/pkgs/vol prev;
          #    };
          #  })
          #];
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
            users.${username} =
              { ... }:
              {
                imports = [
                  ./common/home
                  ./${hostname}/home.nix
                ];
              };
          };
        }
      ];
    };
}
