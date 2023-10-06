{
  pkgs,
  pkgs-ext,
  ...
}: {
  imports = [
    ../shared/home/alacritty
    ../shared/mod/btop
    ../shared/mod/dunst
    ../shared/mod/firefox
    ../shared/mod/fzf
    ../shared/mod/gh
    ../shared/mod/git
    ../shared/mod/gtk
    ../shared/mod/hyprland
    ../shared/mod/nushell
    ./cfg/pipewire.nix
    ./cfg/wireplumber.nix
  ];

  programs.obs-studio.enable = true;

  home = {
    username = "shudawei";
    homeDirectory = "/home/shudawei";
    packages = with pkgs; [
      (import ../shared/scripts/vol.nix pkgs)
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
