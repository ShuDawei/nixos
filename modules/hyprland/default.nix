{ config, lib, ... }:
let
  cfg = config.modules.hyprland;
in
{
  options.modules.hyprland = {
    enable = lib.mkEnableOption "hyprland";
    enable-nvidia-patches = lib.mkEnableOption "enable nvidia patches";
    monitors = lib.mkOption {
      type = lib.types.listOf (lib.types.submodule {
        options = {
          name = lib.mkOption {
            type = lib.types.str;
          };
          res = lib.mkOption {
            type = lib.types.str;
          };
          pos = lib.mkOption {
            type = lib.types.str;
          };
          ext = lib.mkOption {
            type = lib.types.str;
          };
        };
      });
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      enableNvidiaPatches = cfg.enable-nvidia-patches;
      xwayland.enable = true;
      settings = {
        monitor = map (monitor: "${monitor.name},${monitor.res},${monitor.pos},1,${monitor.ext}");
      };
      extraConfig = import ../../config/shared/home/hyprland/conf.nix;
    };
  };
}
