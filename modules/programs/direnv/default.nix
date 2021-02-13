{ config, lib, pkgs, ... }:

with lib;
let cfg = config.programs.direnv;
in {
  programs.direnv = {
    enable = true;
    config = {
      whitelist = {
        prefix = [ "${config.home.homeDirectory}/Code" ];
        exact = [ "/etc/nixos" ];
      };
    };
  };
}
