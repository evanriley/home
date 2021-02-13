{ config, pkgs, ... }:

{
  imports = [
    ./asdf.nix
    ./fonts.nix
    ./emacs
    ./git.nix
    ./prettier
    ./nodejs.nix
    ./ruby.nix
    ./rust
    ./vim
    ./zsh
  ];

  programs = {
    emacs = { enable = true; };
    git.enable = true;
    go.enable = true;
    nodejs = {
      enable = true;
      yarn.enable = true;
    };
    ruby = {
      enable = true;
      enableBuildLibs = true;
      provider = "nixpkgs";
      enableSolargraph = true;
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
