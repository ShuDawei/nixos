{ inputs, lib, pkgs, system, ... }: { ... } @ build: lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit build inputs pkgs system;
    modules = [
      ./boot
      ./core
      ./hyprland
      ./sound
      ./user
    ];
  };
}
