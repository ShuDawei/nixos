{ ... }:

{
  imports = [ ../common/home ];

  wayland.windowManager.hyprland = {
    enableNvidiaPatches = true;
    settings = {
      env = [
        "WLR_NO_HARDWARE_CURSORS,1"
        "NIXOS_OZONE_WL,1"
      ];
      monitor = [
        "DP-1,1920x1080@240,0x0,1,bitdepth,10"
        "HDMI-A-1,1920x1080@60,1920x0,1,bitdepth,10"
      ];
      workspace = [
        "0,monitor:DP-1"
        "1,monitor:DP-1"
        "2,monitor:DP-1"
        "3,monitor:DP-1"
        "4,monitor:DP-1"
        "5,monitor:DP-1"
        "6,monitor:DP-1"
        "7,monitor:DP-1"
        "8,monitor:HDMI-A-1"
        "9,monitor:HDMI-A-1"
        "10,monitor:HDMI-A-1"
      ];
    };
  };
}
