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

  environment.systemPackages = [ inputs.nixpkgs-stable.legacyPackages.${system}.pkgs.libva-utils ];
  hardware.graphics.extraPackages = [
    inputs.nixpkgs-stable.legacyPackages.${system}.intel-media-driver
  ];
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
