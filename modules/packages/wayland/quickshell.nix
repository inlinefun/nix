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
    enable = lib.mkEnableOption "Whether to enable quickshell, a toolkit for building desktop widgets.";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.quickshell;
      description = "Specify a package of quickshell to use";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
