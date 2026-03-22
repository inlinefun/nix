{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.hyprpaper;
in
{

  options.packages.hyprpaper = {
    enable = lib.mkEnableOption "Whether to enable `hyprpaper`, a wallpaper utility";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.hyprpaper;
      description = "Specify a package of hyprpaper to use";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
