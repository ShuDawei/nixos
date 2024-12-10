{
  inputs,
  pkgs,
  system,
  username,
  hostname,
  ...
}:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking = {
    hostName = hostname;
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "de";
  };

  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];
  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "mocha";
      font = "JetBrainsMono Nerd Font";
      loginBackground = true;
    })
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # package = inputs.hyprland.packages.${system}.default;
  };

  services.xserver = {
    xkb = {
      layout = "de";
      variant = "";
    };
    enable = true;
    displayManager.lightdm.enable = false;
  };
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha";
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    #wireplumber.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    #jack.enable = true;
    extraConfig.pipewire."quality" = {
      "stream.properties" = {
        "resample.quality" = 10;
      };
    };
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  users.users = {
    ${username} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
    };
  };

  system.stateVersion = "23.11";
}
