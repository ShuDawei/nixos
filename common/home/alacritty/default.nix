{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell.program = "${pkgs.nushell}/bin/nu";
      font = import ./font.nix;
      colors = import ./colors.nix;
      keyboard.bindings = [
        {
            key = "Tab";
            mods = "Control";
            chars = "";
        }
        {
            key = "Tab";
            mods = "Control|Shift";
            chars = "";
        }
      ];
    };
  };
}
