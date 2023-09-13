{ pkgs, ... }:

{
    gtk = {
        enable = true;
        theme = {
            name = "rose-pine";
            package = pkgs.rose-pine-gtk-theme;
        };
        font.name = "JetBrains Mono NL Nerd Font";
    };
}
