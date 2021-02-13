{ config, lib, pkgs, ... }:

let cfg = config.programs.git;
in {

  home.file.gitignore = {
    target = ".gitignore";
    text = ''
      .zsh/completions
      .zsh/plugins.zsh
      .DS_Store
      .*~
      *.swp
    '';
  };

  programs.git = {
    signing = {
      key = "DB4C76F9E3C9BD59";
      signByDefault = true;
    };
    userName = "Evan Riley";
    userEmail = "evanriley@hey.com";
    extraConfig.github.user = "evanriley";
  };
}
