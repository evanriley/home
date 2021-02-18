{ pkgs, ... }:

{

  home.packages = with pkgs;
    let
      myNodePackages = with nodePackages; [
        deno
        node-gyp
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
      automake
      poppler
      gcc
      pkg-config
      coreutils-prefixed
      fzf
      wget
      tree
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
      leiningen
      clojure-lsp
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
      bundix
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
      postgresql
      sqlite
      dotnet-sdk_5
      heroku
      fontconfig
      aspell
      spotifyd
      spotify-tui
      youtube-dl
      mpv

    ] ++ myNodePackages;

}
