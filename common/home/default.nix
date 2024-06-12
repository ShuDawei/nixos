{
  inputs,
  pkgs,
  system,
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
      nixfmt-rfc-style
      #shudawei.dev
      #shudawei.gpuinf
      #shudawei.vol
      prismlauncher
      #modrinth-app
      ripgrep
      #(import ../shared/scripts/vol.nix pkgs)
      #(callPackage ../shared/drv/xwaylandvideobridge.nix { })

      gcc
      rustc
      cargo
      clippy
      rustfmt
      rust-analyzer
      cargo-expand

      discord
      bemenu
      wl-clipboard
      lua-language-server
      socat
      seamly2d
    ];
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
