{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.ruby;
  ruby = pkgs.ruby_2_7;
  rubyPackages = pkgs.rubyPackages_2_7;
  rubyVersion = ruby.version.majMinTiny;
  rbenv = pkgs.rbenv;
in {
  options.programs.ruby = {
    enable = mkEnableOption "Ruby language support";
    extraPackages = mkOption {
      default = with rubyPackages; [ rubocop rspec-core ];
      type = with types; listOf package;
    };
    enableBuildLibs = mkEnableOption "build libraries for Ruby";
    provider = mkOption {
      default = "nixpkgs";
      type = types.enum [ "asdf" "nixpkgs" "rbenv" ];
      example = "asdf";
    };
    enableSolargraph = mkEnableOption "solargraph language server";
  };

  config = mkIf cfg.enable {
    programs.ruby.extraPackages = mkIf cfg.enableBuildLibs
      (with pkgs; [ libmysqlclient libxml2 openssl sqlite zlib ]);

    home.packages = with pkgs;
      (optional (cfg.provider == "nixpkgs") ruby) ++ cfg.extraPackages
      ++ (optional cfg.enableSolargraph solargraph);

    programs.asdf.toolVersions.ruby = mkIf (cfg.provider == "asdf") rubyVersion;

    # add rbenv to zsh
    programs.zsh = mkIf (cfg.provider == "rbenv") {
      envExtra = ''
        export PATH="${rbenv}/bin:$PATH"
      '';
      initExtra = ''
        eval "$(rbenv init -)"
      '';
    };
  };
}
