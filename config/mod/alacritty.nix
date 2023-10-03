{pkgs, ...}: {
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
        cursor = {
          text = "0x${theme.base00}";
          cursor = "0x${theme.base05}";
        };
        normal = {
          black = "0x${theme.base00}";
          red = "0x${theme.base08}";
          green = "0x${theme.base0B}";
          yellow = "0x${theme.base0A}";
          blue = "0x${theme.base0D}";
          magenta = "0x${theme.base0E}";
          cyan = "0x${theme.base0C}";
          white = "0x${theme.base05}";
        };
        bright = {
          black = "0x${theme.base03}";
          red = "0x${theme.base09}";
          green = "0x${theme.base01}";
          yellow = "0x${theme.base02}";
          blue = "0x${theme.base04}";
          magenta = "0x${theme.base06}";
          cyan = "0x${theme.base0F}";
          white = "0x${theme.base07}";
        };
      };
    };
  };
}
