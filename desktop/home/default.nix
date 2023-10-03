{
  pkgs,
  pkgs-ext,
  theme,
  ...
}: {
  imports = [
    # pkgs-ext.hyprland.homeManagerModules.default
    # ./cfg/alacritty.nix
    ../../config/mod/alacritty.nix
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
    ./cfg/wireplumber.nix
  ];

  programs.obs-studio.enable = true;

  home = {
    username = "shudawei";
    homeDirectory = "/home/shudawei";
    packages = with pkgs; [
      (import ./scripts/vol.nix pkgs)
      pkgs-ext.neovim.packages.${pkgs.system}.neovim

      rustc
      cargo
      rust-analyzer

      (eww.override {withWayland = true;})
      discord
      bemenu
      hyprpaper
      freshfetch
      wl-clipboard
      lua-language-server
      pkgs-ext.nixd.packages.${pkgs.system}.nixd
      socat
      lm_sensors
      gcc
      alejandra

      hyprpicker
      pkgs-ext.hyprland-contrib.packages.${pkgs.system}.grimblast
    ];
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
