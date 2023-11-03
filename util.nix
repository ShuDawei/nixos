{ inputs, system }:

{
  nixosConfiguration = username: hostname: inputs.nixpkgs.lib.nixosSystem rec {
    inherit system;
    specialArgs = {
      inherit inputs system username hostname;
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (final: prev: {
            shudawei = {
              gpuinf = callPackage ./common/pkgs/gpuinf;
            };
          })
        ];
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