{ pkgs }:

pkgs.stdenv.mkDerivation {
    name = "catppuccin-sddm-theme";
    src = pkgs.fetchFromGithub {
        owner = "catppuccin";
        repo = "sddm";
        rev = "7fc67d1027cdb7f4d833c5d23a8c34a0029b0661";
        sha256 = "0spqrdppyzy2c31mv77gvcl52wwqk34y8ix5gahgdizg9g4k0dja";
    };
    installPhase = ''
        mkdir -p $out
        cp -R ./* $out/
    '';
}
