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
            mods = "Ctrl";
            chars = "b";
        }
      ];
    };
  };
}
