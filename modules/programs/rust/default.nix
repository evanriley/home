{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cargo-asm
    cargo-audit
    cargo-deb
    cargo-deps
    cargo-expand
    cargo-flamegraph
    cargo-graph
    cargo-license
    cargo-make
    cargo-release
    cargo-watch
    cargo-web
    rustup
    sccache
    wasm-pack
    rust-analyzer
  ];

  programs.zsh.envExtra = ''
    export RUSTC_WRAPPER=sccache
    export PATH="$HOME/.cargo/bin:$PATH"
  '';
}
