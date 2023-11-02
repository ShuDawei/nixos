{ config, inputs, lib, pkgs, system, ... }:
let
  cfg = config.cfg.hyprland;
in
{
  options.cfg.hyprland = {
    nvidia-patches.enable = lib.mkEnableOption "enable nvidia patches";
    monitors = lib.mkOption { type = lib.types.listOf lib.types.str; };
    workspaces = lib.mkOption { type = lib.types.listOf lib.types.str; };
  };

  config = {
    home.packages = [
      pkgs.hyprpaper
    ];
    home.file.".config/hypr/hyprpaper.conf".text = ''
      splash = true;
      preload = ~/Downloads/rose_pine_noiseline.png
      wallpaper = , ~/Downloads/rose_pine_noiseline.png
    '';
    wayland.windowManager.hyprland = {
      enable = true;
      enableNvidiaPatches = cfg.nvidia-patches.enable;
      xwayland.enable = true;
      settings = {
        env = [
          "EDITOR,nvim"
          "WLR_NO_HARDWARE_CURSORS,1"
          "NIXOS_OZONE_WL,1"
        ];
        monitor = cfg.monitors;
        workspace = cfg.workspaces;
        input = {
          kb_layout = "de";
          follow_mouse = 1;
          sensitivity = -0.25;
        };
        general = {
          gaps_out = 16;
          gaps_in = 8;
          border_size = 2;
          "col.active_border" = "0xffebbcba 0xff31748f 45deg";
          "col.inactive_border" = "0xff6e6a86";
          layout = "dwindle";
        };
        decoration = {
          rounding = 4;
          drop_shadow = false;
        };
        animations.enabled = false;
        bindr = [ "SUPER,SUPER_L,exec,bemenu-run -l 7" ];
        bind = [
          "SUPER,RETURN,exec,alacritty"
          "SUPER,C,killactive,"
          "SUPER SHIFT,C,exit,"
          "SUPER,W,togglefloating,"
          "SUPER,1,workspace,1"
          "SUPER,2,workspace,2"
          "SUPER,3,workspace,3"
          "SUPER,4,workspace,4"
          "SUPER,5,workspace,5"
          "SUPER,6,workspace,6"
          "SUPER,7,workspace,7"
          "SUPER,8,workspace,8"
          "SUPER,9,workspace,9"
          "SUPER,0,workspace,10"
          "SUPER SHIFT,1,movetoworkspace,1"
          "SUPER SHIFT,2,movetoworkspace,2"
          "SUPER SHIFT,3,movetoworkspace,3"
          "SUPER SHIFT,4,movetoworkspace,4"
          "SUPER SHIFT,5,movetoworkspace,5"
          "SUPER SHIFT,6,movetoworkspace,6"
          "SUPER SHIFT,7,movetoworkspace,7"
          "SUPER SHIFT,8,movetoworkspace,8"
          "SUPER SHIFT,9,movetoworkspace,9"
          "SUPER SHIFT,0,movetoworkspace,10"
          ",PRINT,exec,grimblast --freeze copy area"
          ",KP_ADD,exec,vol mic"
          ",KP_SUBTRACT,pass,^(com.obsproject.Studio)$"
        ];
        bindm = [
          "SUPER,mouse:272,movewindow"
          "SUPER,mouse:273,resizewindow"
        ];
        binde = [
          ",XF86AudioRaiseVolume,exec,vol inc"
          ",XF86AudioLowerVolume,exec,vol dec"
        ];
        exec-once = [ "hyprpaper" "eww open-many bar mid" ];
        windowrulev2 = [
          "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
          "noanim,class:^(xwaylandvideobridge)$"
          "nofocus,class:^(xwaylandvideobridge)$"
          "noinitialfocus,class:^(xwaylandvideobridge)$"
        ];
      };
    };
  };
}