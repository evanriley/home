{ config, pkgs, ... }:

with pkgs; {
  imports = [
    <home-manager/nix-darwin>
    ./modules
    #  ./services
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = false;
      allowUnsupportedSystem = true;
    };

    # overlays = let path = ./overlays;
    # in with builtins;
    # map (n: import (path + ("/" + n))) (filter (n:
    #   match ".*\\.nix" n != null
    #   || pathExists (path + ("/" + n + "/default.nix")))
    #   (attrNames (readDir path)));

  };
  environment.systemPackages = [ pkgs.vim bat direnv ];

  environment.darwinConfig = "$HOME/.nixpkgs/home/darwin-configuration.nix";

  nix = {
    package = pkgs.nix;
    trustedUsers = [ "root" "evan" ];
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    zsh.enable = true;
  };

  services = {
    emacs.enable = false;
    nix-daemon.enable = true;
    lorri.enable = true;

  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
