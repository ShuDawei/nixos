{ config, lib, ... }:
let
  cfg = config.modules.hyprland;
in
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

  config = lib.mkIf cfg.enable {
    home.file."test".text = ''
      ${lib.concatStrings (map (monitor: "${monitor.name} ${monitor.res} ${monitor.xy}") cfg.monitors)}
    '';
  };
}
