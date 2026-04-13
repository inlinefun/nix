{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.androidStudio;
in
{

  options.packages.androidStudio = {
    enable = lib.mkEnableOption ''
      Whether to enable Android Studio or not
    '';
    package = lib.mkOption {
      default = pkgs.android-studio;
      description = ''
        Specify which Android Studio package to install
      '';
      type = lib.types.package;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
