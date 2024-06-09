{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      shell.program = "${pkgs.nushell}/bin/nu";
      font = import ./font.nix;
      colors = import ./colors.nix;
      keyboard.bindings = [
        {
            key = "Tab";
            mods = "Control";
            chars = "\uE000";
        }
        {
            key = "Tab";
            mods = "Control|Shift";
            chars = "\uE001";
        }
      ];
    };
  };
}
