{ pkgs, ... }:

(pkgs.writeScriptBin "vol" "print test").overrideAttrs(old: {

  buildCommand = "${old.buildCommand}\n patchShebangs ${pkgs.nushell}";

})
