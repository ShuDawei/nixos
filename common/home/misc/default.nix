{ pkgs, ... }:

{
  programs.btop = {
    enable = true;
  };
  services.dunst.enable = true;
  programs.firefox.enable = true;
  programs.firefox.package = pkgs.firefox-bin;
  programs.firefox.wrapperConfig.pipewireSupport = true;
  programs.fzf.enable = true;
  programs.gh.enable = true;
  programs.git = {
    enable = true;
    userEmail = "d-zeidler@gmx.de";
    userName = "shudawei";
  };

  programs.eww = {
    enable = true;
    #package = (pkgs.eww.override { withWayland = true; });
    configDir = ./eww;
  };

  programs.zellij = {
    enable = true;
  };
  home.file.".config/zellij" = {
    source = ./zellij;
    recursive = true;
  };
}
