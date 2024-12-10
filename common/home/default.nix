{
  pkgs,
  ...
}:

{
  imports = [
    ./alacritty
    ./gtk
    ./hyprland
    ./misc
    ./nushell
    ./nvim
    #./pipewire
    #./wireplumber
  ];

  home = {
    username = "shudawei";
    homeDirectory = "/home/shudawei";
    packages = with pkgs; [
      nixd
      nixfmt-rfc-style
      #shudawei.dev
      #shudawei.gpuinf
      #shudawei.vol
      prismlauncher
      #modrinth-app
      ripgrep
      #(import ../shared/scripts/vol.nix pkgs)
      #(callPackage ../shared/drv/xwaylandvideobridge.nix { })

      clang
      rustc
      cargo
      clippy
      rustfmt
      rust-analyzer
      cargo-expand

      nasm

      gradle
      jdk
      jdt-language-server

      discord
      bemenu
      wl-clipboard
      lua-language-server
      socat

      telegram-desktop
    ];
  };

  services.easyeffects = {
    enable = true;
    preset = builtins.readFile ./easyeffects.json;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
