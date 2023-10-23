{ config, lib, ... }:
let
  cfg = config.modules.hyprland;
in
{
  options.modules.hyprland = {
    enable = lib.mkEnableOption "hyprland";
    nvidia-patches.enable = lib.mkEnableOption "enable nvidia patches";
    monitors = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };
    workspaces = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      enableNvidiaPatches = cfg.nvidia-patches.enable;
      xwayland.enable = true;
      settings = {
        monitor = cfg.monitors;
        workspace = cfg.workspaces;
      };
      extraConfig = import ../../config/shared/home/hyprland/conf.nix;
    };
  };
}
