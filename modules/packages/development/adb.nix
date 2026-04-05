{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.adb;
in
{

  options.packages.adb = {
    enable = lib.mkEnableOption ''
      Whether to enable adb(Android Debug Bridge)
    '';
    package = lib.mkOption {
      default = pkgs.android-tools;
      description = ''
        Specify a package of platform tools to install
      '';
      type = lib.types.package;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
