{ config, ... }:

{
  programs.hyprland.enableNvidiaPatches = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    nvidiaSettings = true;
  };
}
