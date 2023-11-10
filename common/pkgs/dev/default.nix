pkgs:

pkgs.writeScriptBin "dev" ''
  #! ${pkgs.nushell}/bin/nu

  def main [path] {
      let path = $path | path expand
      let name = $path | path basename
      enter $path
      try { nix develop --command zellij --session $name } catch { zellij --session $name }
      dexit
  }
''
