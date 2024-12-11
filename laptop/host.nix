{
  config,
  system,
  inputs,
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

  #services.xserver.videoDrivers = [ "nvidia" ];
  #hardware.nvidia = {
  #  package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
  #  modesetting.enable = true;
  #  powerManagement.enable = true;
  #prime = {
  #  sync.enable = true;
  #  intelBusId = "PCI:0:2:0";
  #  nvidiaBusId = "PCI:1:0:0";
  #};
  #};

  environment.systemPackages = [ inputs.nixpkgs-stable.legacyPackages.${system}.libva-utils ];
  hardware.graphics.extraPackages = [
    #pkgs.intel-vaapi-driver
    inputs.nixpkgs-stable.legacyPackages.${system}.intel-vaapi-driver
    pkgs.ibvdpau-va-gl
  ];
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "i965";
  };
}
