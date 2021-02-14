{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.python;
  python = pkgs.python3;
  pythonPackages = pkgs.Python3Packages;
  myPythonPackages = pythonPackages:
    with pythonPackages; [
      pip
      setuptools
      ipdb
      ipykernel
      matplotlib
      numpy
      pandas
      seaborn
      scipy
      scikitlearn
      pygobject3

    ];
  pythonWithMyPackages = python.withPackages myPythonPackages;
in {
  imports = [ ./pipx ];

  options.programs.python = {
    enable = mkEnableOption "Python language support";
    extraPackages = mkOption {
      default = with pythonPackages; [ ];
      type = with types; listOf package;
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pythonWithMyPackages ] ++ cfg.extraPackages;

    programs.zsh = {
      envExtra = ''
        export PYTHONBREAKPOINT=ipdb.set_trace
      '';
    };

  };

}
