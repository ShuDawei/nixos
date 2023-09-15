{ pkgs, pkgs-ext, ... }:

{
    imports = [
        pkgs-ext.hyprland.homeManagerModules.default
        ./cfg/alacritty.nix
        ./cfg/btop.nix
        ./cfg/dunst.nix
        ./cfg/firefox.nix
        ./cfg/fzf.nix
        ./cfg/gh.nix
        ./cfg/git.nix
        ./cfg/gtk.nix
        ./cfg/hyprland.nix
        ./cfg/nushell.nix
        ./cfg/pipewire.nix
        ./cfg/waybar.nix
        ./cfg/wireplumber.nix
    ];

    home = {
        username = "shudawei";
        homeDirectory = "/home/shudawei";
        packages = with pkgs; [
            pkgs-ext.neovim.packages.${pkgs.system}.neovim
            (eww.override { withWayland = true; })
            discord
            bemenu
            hyprpaper
            freshfetch
            wl-clipboard
            zig
            rust-analyzer
            lua-language-server
            pkgs-ext.nixd.packages.${pkgs.system}.nixd

            hyprpicker
            pkgs-ext.hyprland-contrib.packages.${pkgs.system}.grimblast
        ];
    };

    programs.home-manager.enable = true;
    home.stateVersion = "23.11";
}
