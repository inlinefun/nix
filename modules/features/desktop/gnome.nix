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
    enable = lib.mkEnableOption ''
      Whether to enable the Gnome Desktop Environment
    '';
  };

  config = lib.mkIf cfg.enable {
    services.desktopManager.gnome = {
      enable = true;
    };
  };

}
