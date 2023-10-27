{ pkgs
, pkgs-ext
, pkgs-stable
, inputs
, ...
}: {
  imports = [
    ../../modules/hyprland
    ../shared/home/alacritty
    ../shared/home/btop
    ../shared/home/dunst
    ../shared/home/firefox
    ../shared/home/fzf
    ../shared/home/gh
    ../shared/home/git
    ../shared/home/gtk
    #../shared/home/hyprland
    ../shared/home/nushell
    ../shared/home/nvim
    ../shared/home/pipewire
    ../shared/home/wireplumber
    #./cfg/pipewire.nix
    #./cfg/wireplumber.nix
  ];

  cfg.hyprland = {
    nvidia-patches.enable = true;
    monitors = [
      "DP-1,1920x1080@240,0x0,1,bitdepth,10"
      "HDMI-A-1,1920x1080@60,1920x0,1,bitdepth,10"
    ];
    workspaces = [
      "0,monitor:DP-1"
      "1,monitor:DP-1"
      "2,monitor:DP-1"
      "3,monitor:DP-1"
      "4,monitor:DP-1"
      "5,monitor:DP-1"
      "6,monitor:DP-1"
      "7,monitor:DP-1"
      "8,monitor:HDMI-A-1"
      "9,monitor:HDMI-A-1"
      "10,monitor:HDMI-A-1"
    ];
  };

  home.file.".local/java/jdk8".source = pkgs.jdk8;
  home.file.".local/java/jdk17".source = pkgs.jdk17;

  home = {
    username = "shudawei";
    homeDirectory = "/home/shudawei";
    packages = with pkgs; [
      inputs.getchoo-fork.packages.${pkgs.system}.modrinth-app
      rnix-lsp
      prismlauncher
      ripgrep
      ladspaPlugins
      (import ../shared/scripts/vol.nix pkgs)
      #(callPackage ../shared/drv/xwaylandvideobridge.nix { })

      rustc
      cargo
      rustfmt
      rust-analyzer
      nodePackages.typescript-language-server
      nodePackages.prettier

      (eww.override { withWayland = true; })
      discord
      bemenu
      freshfetch
      wl-clipboard
      lua-language-server
      socat
    ];
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
