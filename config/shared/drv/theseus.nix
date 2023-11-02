{ lib
, pkgs
}:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "theseus";
  version = "unstable";
}
