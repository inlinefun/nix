{
  config,
  lib,
  ...
}:

let
  cfg = config.cfg.desktop;
in
{

  options.cfg.desktop = {
    enable = lib.mkEnableOption "Enable configuring a desktop session" // {
      default = true;
    };
    desktopEnvironment = lib.mkOption {
      default = "gnome";
      description = "Choose a desktop environment to use";
      type = lib.types.enum [
        "gnome"
        "none"
      ];
    };
    loginManager = lib.mkOption {
      default = "gdm";
      description = "Choose a login manager to use";
      type = lib.types.enum [
        "gdm"
        "ly"
        "none"
      ];
    };
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      (lib.mkIf (cfg.desktopEnvironment == "gnome") {
        services.desktopManager.gnome.enable = true;
      })
      (lib.mkIf (cfg.loginManager == "gdm") {
        services.displayManager.gdm.enable = true;
      })
      (lib.mkIf (cfg.loginManager == "ly") {
        services.displayManager.ly.enable = true;
      })
    ]
  );

}
