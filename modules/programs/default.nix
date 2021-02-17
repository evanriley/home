{ config, pkgs, ... }:

{
  imports = [
    ./asdf.nix
    ./direnv
    ./fonts.nix
    ./elixir
    ./emacs
    ./git.nix
    ./prettier
    ./python
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
    python = {
      enable = true;
      extraPackages = with pkgs.python3Packages; [ codecov grip jedi poetry ];
      pipx.enable = true;
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
