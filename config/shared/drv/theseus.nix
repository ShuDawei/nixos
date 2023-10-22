pkgs:

pkgs.rustPlatform.buildRustPackage rec {
    pname = "theseus_cli";
    version = "0.5.4";
    src = ./theseus;
    #src = pkgs.fetchFromGitHub {
    #    owner = "modrinth";
    #    repo = "theseus";
    #    rev = "afaec4b1bf04a06070d3087baae30ba4673f7f4b";
    #    sha256 = "0blxpa2qhpmjr7xa7vi7wnjk842cj1286pn90gnak98rz06ax76d";
    #};
    cargoLock = {
        lockFile = ./theseus/Cargo.lock;
        #lockFile = "${src}/Cargo.lock";
        outputHashes = {
            "tauri-plugin-single-instance-0.0.0" = "sha256-G4h2OXKPpZMmradutdUWxGG5axL9XMz2ACAe8AQ40eg=";
        };
    };
    buildInputs = [pkgs.openssl];
    nativeBuildInputs = [pkgs.pkg-config];
    buildAndTestSubdir = "theseus_cli";
    buildType = "debug";
}
