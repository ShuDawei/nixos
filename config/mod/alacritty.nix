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
          foreground = "0x${theme.base06}";
        };
        search = {
          matches = {
            foreground = "CellBackground";
            background = "0x${theme.base0A}";
          };
          footer_bar = {
            background = "0x${theme.base01}";
            foreground = "0x${theme.base06}";
          };
          normal = {
            black = "0x${theme.base01}";
            magenta = "0x${theme.base0C}";
            green = "0x${theme.base0D}";
            yellow = "#ffe97b";
            blue = "0x${theme.base0B}";
            red = "0x${theme.base0A}";
            cyan = "0x${theme.base08}";
            white = "0x${theme.base04}";
          };
          bright = {
            black = "0x${theme.base02}";
            magenta = "0x${theme.base0C}";
            green = "0x${theme.base0D}";
            yellow = "#ffe97b";
            blue = "0x${theme.base0B}";
            red = "0x${theme.base0A}";
            cyan = "0x${theme.base08}";
            white = "0x${theme.base06}";
          };
        };
      };
    };
  };
}
