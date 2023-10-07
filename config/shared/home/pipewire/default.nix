{pkgs, ...}: {
  home.file.".config/pipewire/pipewire.conf".source = ./pipewire.conf;
  home.file.".config/pipewire/pipewire.conf.d/normalizer.conf".source = ./normalizer.conf.nix pkgs;
}
