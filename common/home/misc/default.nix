{ pkgs, ... }:

{
  programs.btop = {
    enable = true;
  };
  services.dunst.enable = true;
  programs.firefox.enable = true;
  programs.fzf.enable = true;
  programs.gh.enable = true;
  programs.git = {
    enable = true;
    userEmail = "d-zeidler@gmx.de";
    userName = "shudawei";
  };

  programs.eww = {
    enable = true;
    package = (pkgs.eww.override { withWayland = true; });
    configDir = ./eww;
  };
}
