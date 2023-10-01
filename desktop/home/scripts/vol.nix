pkgs:
pkgs.writeScriptBin "vol" ''
  #! ${pkgs.nushell}/bin/nu
  ${(builtins.readFile ./vol.nu)}
''
