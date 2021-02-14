{ pkgs, ... }:

{

  home.packages = with pkgs;
    let
      myNodePackages = with nodePackages; [
        deno
        prettier
        serverless
        stylelint
        js-beautify
        typescript
        live-server
      ];

    in [
      autoconf
      asdf
      cachix
      ccls
      cmake
      gcc
      coreutils-prefixed
      fzf
      wget
      ruby
      rbenv
      elixir
      erlang
      go
      lorri
      gocode
      gomodifytags
      gotests
      gore
      go-tools
      clojure
      sass
      R
      nim
      niv
      nixfmt
      shellcheck
      black
      pandoc
      ripgrep
      fd
      protobuf
      jq
      exa
      lsd
      xsv
      httpie
      gnupg
      neovim
      gitAndTools.git-hub
      gitAndTools.gh
      starship

      fontconfig
      aspell

      spotifyd
      spotify-tui
      youtube-dl
      mpv

    ] ++ myNodePackages;

}
