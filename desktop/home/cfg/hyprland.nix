{ ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        enableNvidiaPatches = true;
        xwayland.enable = true;
        extraConfig = import ./hyprland.conf.nix;
    };

    home. file.".config/hypr/hyprpaper.conf".text = ''
        preload = ~/Downloads/rose_pine_circle.png
        wallpaper = , ~/Downloads/rose_pine_circle.png
        '';
}
