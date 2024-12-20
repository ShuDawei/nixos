{ ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      env = [ "NIXOS_OZONE_WL,1" ];
      monitor = [
        "DP-3,1920x1080@240,0x0,1,bitdepth,8"
        "Unknown-1,disable"
      ];
    };
  };
}
