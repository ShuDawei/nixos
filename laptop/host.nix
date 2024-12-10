{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  powerManagement.enable = true;
  services.thermald.enable = true;

  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };

  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = [
    pkgs.intel-media-driver
    pkgs.libva-vdpau-driver
    pkgs.libvdpau-va-gl
  ];
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
