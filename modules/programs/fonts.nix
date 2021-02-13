{ config, lib, pkgs, ...}:


{
  home.packages = with pkgs; [ jetbrains-mono overpass ibm-plex];
}
