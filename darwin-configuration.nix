{ config, pkgs, ... }:

with pkgs; {
  imports = [ <home-manager/nix-darwin> ./modules ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = false;
      allowUnsupportedSystem = true;
    };
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
