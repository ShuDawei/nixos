{ lib, ... }:

{
  options.modules.hyprland = {
    enable = lib.mkEnableOption "hyprland";
    monitors = lib.mkOption {
      type = lib.types.listOf (lib.types.submodule {
        options = {
          name = lib.mkOption {
            type = lib.types.str;
          };
          res = lib.mkOption {
            type = lib.types.str;
          };
          xy = lib.mkOption {
            type = lib.type.str;
          };
        };
      });
      default = [ ];
    };
  };
}
