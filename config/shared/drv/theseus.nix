{ lib
, pkgs
}:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "theseus";
  version = "unstable-2023-10-24";
}
