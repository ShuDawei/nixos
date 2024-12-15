{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };
    font.name = "JetBrains Mono NL Nerd Font";
    cursorTheme = {
      name = "BreezeX-RosePine-Linux";
      size = 8;
    };
    #cursorTheme = {
    #  package = pkgs.bibata-cursors;
    #  name = "Bibata-Modern-Classic";
    #  size = 8;
    #};
  };
}
