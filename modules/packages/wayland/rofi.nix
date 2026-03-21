{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.rofi;
in
{

  options.packages.rofi = {
    enable = lib.mkEnableOption "Whether to enable rofi, A window switcher, application launcher and dmenu replacement";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.rofi;
      description = "Specify a package of rofi to use";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
