{
  inputs,
  system,
  pkgs,
  ...
}:

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

  environment.systemPackages = [ inputs.nixpkgs-stable.legacyPackages.${system}.libva-utils ];
  nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
  };

  hardware.graphics.extraPackages = [
    pkgs.intel-vaapi-driver
    #pkgs.intel-media-driver
  ];
  hardware.graphics.extraPackages32 = [ pkgs.intel-vaapi-driver ];
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "i965";
    #LIBVA_DRIVER_NAME = "iHD";
  };
}
