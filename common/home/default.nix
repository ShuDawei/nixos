{ pkgs, ... }:

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
  programs.tmux = {
    enable = true;
    prefix = "C-i";
    keyMode = "vi";
    shell = "${pkgs.nushell}/bin/nu";
  };

  home = {
    username = "shudawei";
    homeDirectory = "/home/shudawei";
    packages = with pkgs; [
      shudawei.gpuinf
      rnix-lsp
      prismlauncher
      ripgrep
      ladspaPlugins
      #(import ../shared/scripts/vol.nix pkgs)
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
