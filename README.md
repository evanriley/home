# home

My nix-darwin & home-manager dotfiles

# Using

After installing nix, nix-darwin, and home-manager

```sh
$ git clone git@github.com:evanriley/home.git ~/.nixpkgs/home
$ darwin-rebuild -I darwin-config=$HOME/.nixpkgs/home/darwin-configuration.nix
```
