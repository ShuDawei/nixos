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

  hardware.graphics.extraPackages = [
    #pkgs.intel-vaapi-driver
    pkgs.intel-media-driver
  ];
  environment.sessionVariables = {
    #LIBVA_DRIVER_NAME = "i965";
    LIBVA_DRIVER_NAME = "iHD";
  };
}
