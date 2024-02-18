{ ... }:

{
  wayland.windowManager.hyprland = {
    enableNvidiaPatches = true;
    settings = {
      env = [
        "WLR_NO_HARDWARE_CURSORS,1"
        "NIXOS_OZONE_WL,1"
      ];
      monitor = [
        "DP-3,1920x1080@240,0x0,1,bitdepth,10"
      ];
    };
  };
}
