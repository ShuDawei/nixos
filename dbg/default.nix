{pkgs}:

pkgs.rustPlatform.buildRustPackage rec {
    pname = "dbg";
    version = "0.5.4";
    src = ./.;
    cargoLock.lockFile = "${src}/Cargo.lock";
    testAndBuildSubDir = "sub";
}
