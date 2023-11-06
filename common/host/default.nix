{ inputs, pkgs, system, username, hostname, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = hostname;
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "de";
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
  environment.systemPackages = with pkgs; [ libsForQt5.qt5.qtgraphicaleffects ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # package = inputs.hyprland.packages.${system}.default;
  };

  programs.steam.enable = true;

  services.xserver = {
    enable = true;
    layout = "de";
    xkbVariant = "";
    displayManager.lightdm.enable = false;
    displayManager.sddm = {
      enable = true;
      theme = "${inputs.sddm-rose-pine}";
    };
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
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
    ${username} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };

  system.stateVersion = "23.11";
}
