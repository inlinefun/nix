{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.quickshell;
in
{

  options.packages.quickshell = {
    enable = lib.mkEnableOption ''
      Whether to enable `quickshell`, a toolkit for building desktop components from QtQuick
    '';
    package = lib.mkOption {
      default = pkgs.quickshell;
      description = ''
        Specify a package of quickshell to install
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
