{
  pkgs,
  pkgs-ext,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs-ext.hyprland.packages.${pkgs.system}.default;
    enableNvidiaPatches = true;
    xwayland.enable = true;
    extraConfig = import ./hyprland.conf.nix;
  };

  home.file.".config/hypr/hyprpaper.conf".text = ''
    splash = true;
    preload = ~/Downloads/rose_pine_contourline.png
    wallpaper = , ~/Downloads/rose_pine_contourline.png
  '';
}
