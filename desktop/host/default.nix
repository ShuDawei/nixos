{ pkgs, pkgs-ext, ... }:

{
    imports = [ 
        pkgs-ext.hyprland.nixosModules.default
        ./hdw.nix 
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    # programs.hyprland = {
    #     enable = true;
    #     package = pkgs-ext.hyprland.packages.${pkgs.system}.default;
    #     enableNvidiaPatches = true;
    #     xwayland.enable = true;
    # };

    programs.steam.enable = true;

    services.flatpak.enable = true;
    services.xserver = {
        enable = true;
        layout = "de";
        xkbVariant = "";
        videoDrivers = [ "nvidia" ];
        displayManager.lightdm.enable = false;
        displayManager.sddm.enable = true;
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
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    users.users = {
        shudawei = {
            isNormalUser = true;
            extraGroups = [ "wheel" "networkmanager" ];
        };
    };

    system.stateVersion = "23.11";
}
