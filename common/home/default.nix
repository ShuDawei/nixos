{ inputs, pkgs, system, ... }:

{
  imports = [
    ./alacritty
    ./gtk
    ./hyprland
    ./misc
    ./nushell
    ./nvim
    ./pipewire
    ./wireplumber
  ];

  programs.zellij = {
    enable = true;
  };

  home = {
    username = "shudawei";
    homeDirectory = "/home/shudawei";
    packages = with pkgs; [
      shudawei.gpuinf
      shudawei.vol
      rnix-lsp
      prismlauncher
      ripgrep
      ladspaPlugins
      #(import ../shared/scripts/vol.nix pkgs)
      #(callPackage ../shared/drv/xwaylandvideobridge.nix { })

      rustup
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
