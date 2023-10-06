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
          background = "0x${theme.bg}";
          foreground = "0x${theme.fg}";
        };
        normal = {
          black = "0x${theme.bg-d}";
          magenta = "0x${theme.purple}";
          green = "0x${theme.green}";
          yellow = "0x${theme.yellow}";
          blue = "0x${theme.blue}";
          red = "0x${theme.red}";
          cyan = "0x${theme.cyan}";
          white = "0x${theme.fg-d}";
        };
        bright = {
          black = "0x${theme.bg-l}";
          magenta = "0x${theme.purple}";
          green = "0x${theme.green}";
          yellow = "0x${theme.yellow}";
          blue = "0x${theme.blue}";
          red = "0x${theme.red}";
          cyan = "0x${theme.cyan}";
          white = "0x${theme.fg-l}";
        };
      };
    };
  };
}
