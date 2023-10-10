{
  pkgs,
  pkgs-ext,
  ...
}: {
  imports = [
    ../shared/home/alacritty
    ../shared/home/btop
    ../shared/home/dunst
    ../shared/home/firefox
    ../shared/home/fzf
    ../shared/home/gh
    ../shared/home/git
    ../shared/home/gtk
    ../shared/home/hyprland
    ../shared/home/nushell
    ../shared/home/nvim
    ../shared/home/pipewire
    ../shared/home/wireplumber
    #./cfg/pipewire.nix
    #./cfg/wireplumber.nix
  ];

  programs.obs-studio.enable = true;

  home = {
    username = "shudawei";
    homeDirectory = "/home/shudawei";
    packages = with pkgs; [
      ladspaPlugins
      (import ../shared/scripts/vol.nix pkgs)
      #pkgs-ext.neovim.packages.${pkgs.system}.neovim
      (callPackage ../shared/drv/xwaylandvideobridge.nix { })

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
