{...}: {
  home.file.".config/pipewire" = {
    source = ./pipewire;
    recursive = true;
  };
}
