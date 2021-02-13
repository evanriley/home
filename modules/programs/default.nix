{ config, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./emacs
    ./git.nix
    ./prettier
    ./nodejs.nix
    ./rust
    ./vim
    ./zsh
  ];

  programs = {
    emacs = { enable = true; };
    git.enable = true;
    nodejs = {
      enable = true;
      yarn.enable = true;
    };
  };

  home.file.".local/bin" = {
    source = ./bin;
    recursive = true;
  };

  programs.zsh = {
    envExtra = ''
      export PATH="$HOME/.local/bin:$PATH"
    '';
  };
}
