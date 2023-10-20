{pkgs ? import <nixpkgs> {}}:

pkgs.rustPlatform.buildRustPackage rec {
    pname = "theseus_cli";
    version = "0.5.4";
    src = pkgs.fetchFromGitHub {
        owner = "modrinth";
        repo = "theseus";
        rev = "1e8852b54007f8739d94c4593aa369ac512b30fc";
        sha256 = "1zykw5wnn3ilqxxahrggrxzzrgg1265338kxvhl8s7h7wicp7gll";
    };
    cargoLock = {
        lockFile = "${src}/Cargo.lock";
        outputHashes = {
            "tauri-plugin-single-instance-0.0.0" = "sha256-G4h2OXKPpZMmradutdUWxGG5axL9XMz2ACAe8AQ40eg=";
        };
    };
    buildInputs = [pkgs.openssl];
    nativeBuildInputs = [pkgs.pkg-config];
    buildAndTestSubdir = "theseus_cli";
}
