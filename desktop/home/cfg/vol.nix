{ pkgs, ... }:

pkgs.writeShellScriptBin "vol" ''
    echo "test"
''
