{ config, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };
}
