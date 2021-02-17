{ config, pkgs, ... }: {

  home.file.".elixir-ls/release" = {
    source = ./.elixir-ls/release;
    recursive = true;
  };

  programs.zsh = {
    envExtra = ''
      export PATH="$HOME/.elixir-ls/release:$PATH"
    '';
  };

}
