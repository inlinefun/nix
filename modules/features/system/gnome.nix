{
  config,
  lib,
  ...
}:

let
  cfg = config.features.gnome;
in
{

  options.features.gnome = {
    enable = lib.mkEnableOption "Whether to enable the Gnome Desktop environment" // {
      default = true;
    };
    debug = lib.mkEnableOption "Whether to enable gnome session debug messages";
  };

  config = lib.mkIf cfg.enable {
    services.desktopManager.gnome = {
      enable = true;
      debug = cfg.debug;
    };
  };

}
