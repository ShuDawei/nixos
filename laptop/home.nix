{ ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      env = [ "NIXOS_OZONE_WL,1" ];
      monitor = [
        "LVDS-1,1920x1080@60,0x0,1"
      ];
    };
  };
}
