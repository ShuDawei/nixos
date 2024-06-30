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

        environment.sessionVariables.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (with pkgs; [
          udev
          alsa-lib
          vulkan-loader
          libxkbcommon
          wayland
        ];)
;

  home = {
    username = "shudawei";
    homeDirectory = "/home/shudawei";
    packages = with pkgs; [
        pkg-config 

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

      gradle
      jdk
      jdt-language-server

      discord
      bemenu
      wl-clipboard
      lua-language-server
      socat
    ];
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
