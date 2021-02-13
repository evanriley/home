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
      ];

    in [
      autoconf
      asdf
      cachix
      ccls
      cmake
      gcc
      coreutils-prefixed
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
      python39
      pipenv
      python39Packages.pyflakes
      python39Packages.isort
      python39Packages.nose
      python39Packages.pytest
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
