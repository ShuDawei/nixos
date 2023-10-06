{
  pkgs,
  theme,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      shell.program = "${pkgs.nushell}/bin/nu";
      font = {
        normal = {
          family = "JetBrains Mono NL Nerd Font";
          style = "Bold";
        };
        bold = {
          family = "JetBrains Mono NL Nerd Font";
          style = "ExtraBold";
        };
        italic = {
          family = "JetBrains Mono NL Nerd Font";
          style = "BoldItalic";
        };
      };
      colors = {
        primary = {
          background = "0x${theme.base00}";
          foreground = "0x${theme.base05}";
        };
        normal = {
          black = "0x${theme.base01}";
          magenta = "0x${theme.base0E}";
          green = "0x${theme.base0B}";
          yellow = "0x${theme.base09}";
          blue = "0x${theme.base0D}";
          red = "0x${theme.base08}";
          cyan = "0x${theme.base0C}";
          white = "0x${theme.base06}";
        };
        bright = {
          black = "0x${theme.base02}";
          magenta = "0x${theme.base0E}";
          green = "0x${theme.base0B}";
          yellow = "0x${theme.base09}";
          blue = "0x${theme.base0D}";
          red = "0x${theme.base08}";
          cyan = "0x${theme.base0C}";
          white = "0x${theme.base07}";
        };
      };
    };
  };
}
