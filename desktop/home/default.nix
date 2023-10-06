{
  pkgs,
  pkgs-ext,
  ...
}: {
  imports = [
    ../../config/mod/alacritty
    ../../config/mod/btop
    ../../config/mod/dunst
    ../../config/mod/firefox
    ../../config/mod/fzf
    ../../config/mod/gh
    ../../config/mod/git
    ../../config/mod/gtk
    ../../config/mod/hyprland
    ../../config/mod/nushell
    ../../config/mod/pipewire
    ../../config/mod/wireplumber
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
