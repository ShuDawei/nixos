{
  pkgs,
  pkgs-ext,
  config,
  ...
}: let
  hyprland-pkg = pkgs-ext.hyprland.packages.${pkgs.system}.default.override {
    enableXWayland = true;
    enableNvidiaPatches = true;
  };
in {
  imports = [
    ./hdw.nix
  ];

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };

  boot.extraModulePackages = [config.boot.kernelPackages.v4l2loopback];
  boot.kernelModules = ["v4l2loopback"];
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "de";
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  #programs.hyprland = {
  #  enable = true;
  #  package = pkgs-ext.hyprland.packages.${pkgs.system}.default;
  #  portalPackage = pkgs-ext.xdg-desktop-portal-hyprland.packages.${pkgs.system}.default;
  #  enableNvidiaPatches = true;
  #  xwayland.enable = true;
  #};
  environment.systemPackages = [
    hyprland-pkg
  ];
  programs.dconf.enable = true;
  programs.xwayland.enable = true;
  security.polkit.enable = true;

  programs.steam.enable = true;

  services.flatpak.enable = true;
  services.xserver = {
    enable = true;
    layout = "de";
    xkbVariant = "";
    videoDrivers = ["nvidia"];
    displayManager.lightdm.enable = false;
    displayManager.sddm.enable = true;
    displayManager.sessionPackages = [hyprland-pkg];
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      nvidiaSettings = true;
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs-ext.xdg-desktop-portal-hyprland.packages.${pkgs.system}.default
    pkgs.xdg-desktop-portal-gtk
  ];

  users.users = {
    shudawei = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager"];
    };
  };

  system.stateVersion = "23.11";
}