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
    enable = lib.mkEnableOption "Whether to enable Android Debugging Bridge";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ android-tools ];
  };

}
