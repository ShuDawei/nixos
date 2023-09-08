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
        ./cfg/hyprland.nix
        ./cfg/neovim.nix
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
        ];
    };
}
