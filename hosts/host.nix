{ pkgs
, pkgs-ext
, inputs
, config
, ...
}:
{
  imports = [
    ./hdw.nix
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  boot.supportedFilesystems = [ "ntfs" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
  boot.kernelModules = [ "v4l2loopback" ];
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      theme = inputs.grub-theme + "/src/catppuccin-mocha-grub-theme";
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
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
  };
  programs.dconf.enable = true;
  programs.xwayland.enable = true;
  security.polkit.enable = true;

  programs.steam.enable = true;

  services.flatpak.enable = true;
  services.xserver = {
    enable = true;
    layout = "de";
    xkbVariant = "";
    videoDrivers = [ "nvidia" ];
    #displayManager.job.execCmd = "exec ${pkgs.ly}/bin/ly";
    displayManager.lightdm.enable = false;
    displayManager.sddm = {
      enable = true;
      theme = "${import ../shared/drv/catppuccin-sddm-theme.nix { inherit pkgs; }}/src/catppuccin-mocha";
    };
    #displayManager.sessionPackages = [hyprland-pkg];
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
    pkgs.xdg-desktop-portal-gtk
  ];

  users.users = {
    shudawei = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };

  system.stateVersion = "23.11";
}
