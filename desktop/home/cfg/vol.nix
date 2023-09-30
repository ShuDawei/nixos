{ pkgs, ... }:

(pkgs.writeShellScriptBin "vol" ''
    echo "test"
''.overrideAttrs (old: {
    buildCommand = "${old.buildCommand}\n patchShebangs ${pkgs.nushell}";
    }))
