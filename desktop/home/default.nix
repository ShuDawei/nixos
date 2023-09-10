{ pkgs, pkgs-ext, ... }:

{
    imports = [
        pkgs-ext.hyprland.homeManagerModules.default
        ./cfg/alacritty.nix
        ./cfg/dunst.nix
        ./cfg/easyeffects.nix
        ./cfg/firefox.nix
        ./cfg/gh.nix
        ./cfg/git.nix
        ./cfg/gtk.nix
        ./cfg/hyprland.nix
        ./cfg/neovim.nix
        ./cfg/nushell.nix
        ./cfg/waybar.nix
    ];

    home = {
        username = "shudawei";
        homeDirectory = "/home/shudawei";
        packages = with pkgs; [
            discord
            bemenu
            pamixer
            hyprpaper
            neofetch
            wl-clipboard
            zig
            lm_sensors
            rust-analyzer
            lua-language-server
            libstdcxx5

            hyprpicker
            pkgs-ext.hyprland-contrib.packages.${pkgs.system}.grimblast
        ];
    };

    programs.home-manager.enable = true;
    home.stateVersion = "23.11";
}
