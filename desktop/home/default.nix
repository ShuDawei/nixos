{
    pkgs,
    pkgs-ext,
    ...
}: {
    imports = [
        pkgs-ext.hyprland.homeManagerModules.default
            ./cfg/alacritty.nix
            ./cfg/btop.nix
            ./cfg/dunst.nix
            ./cfg/firefox.nix
            ./cfg/fzf.nix
            ./cfg/gh.nix
            ./cfg/git.nix
            ./cfg/gtk.nix
            ./cfg/hyprland.nix
            ./cfg/nushell.nix
            ./cfg/pipewire.nix
            ./cfg/waybar.nix
            ./cfg/wireplumber.nix
    ];

    home = {
        username = "shudawei";
        homeDirectory = "/home/shudawei";
        packages = with pkgs; [
            pkgs-ext.neovim.packages.${pkgs.system}.neovim
                rustc
                cargo
                rust-analyzer

                (pkgs-ext.getchoo.packages.${pkgs.system}.modrinth-app.overrideDerivation (old: {
                                                                                           pnpm-deps = stdenvNoCC.mkDerivation {
                                                                                           pname = "${pname}-pnpm-deps";
                                                                                           inherit src version;

                                                                                           nativeBuildInputs = [
                                                                                           jq
                                                                                           moreutils
                                                                                           pnpm
                                                                                           ];

# https://github.com/NixOS/nixpkgs/blob/763e59ffedb5c25774387bf99bc725df5df82d10/pkgs/applications/misc/pot/default.nix#L56
                                                                                           installPhase = ''
                                                                                           export HOME=$(mktemp -d)

                                                                                           cd theseus_gui
                                                                                           pnpm config set store-dir $out
                                                                                           pnpm install --frozen-lockfile --no-optional --ignore-script

                                                                                           rm -rf $out/v3/tmp
                                                                                           for f in $(find $out -name "*.json"); do
                                                                                               sed -i -E -e 's/"checkedAt":[0-9]+,//g' $f
                                                                                                   jq --sort-keys . $f | sponge $f
                                                                                                       done
                                                                                                       '';

                                                                                           dontFixup = true;
                                                                                           outputHashMode = "recursive";
                                                                                           outputHash = "sha256-8Qk2eqMws5kJ0Yn9JSwaiw1KFNpUaJ1wR9B+DE/fnFw=";
                                                                                           };
                }))

                (eww.override {withWayland = true;})
                discord
                bemenu
                hyprpaper
                freshfetch
                wl-clipboard
                lua-language-server
                pkgs-ext.nixd.packages.${pkgs.system}.nixd
                socat
                lm_sensors
                gcc
                alejandra

                hyprpicker
                pkgs-ext.hyprland-contrib.packages.${pkgs.system}.grimblast
        ];
    };

    programs.home-manager.enable = true;
    home.stateVersion = "23.11";
}
