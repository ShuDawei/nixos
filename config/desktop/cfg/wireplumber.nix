{...}: {
  home.file.".config/wireplumber" = {
    source = ./wireplumber;
    recursive = true;
  };
}
