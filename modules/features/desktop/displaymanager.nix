{
  config,
  lib,
  ...
}:

let
  cfg = config.features.displayManager;

in
{

  options.features.displayManager = {
    enable = lib.mkEnableOption ''
      Whether to enable the usage of a Display Manager for user logins
    '';
    manager = lib.mkOption {
      default = "gdm";
      description = ''
        Specify a Display Manager to use.
        Valid options are: `gdm`, `sddm`, `ly`
      '';
      type = lib.types.enum [
        "gdm"
        "ly"
        "sddm"
      ];
    };
  };

  config = lib.mkIf cfg.enable {
    services.displayManager = {
      gdm = {
        enable = cfg.manager == "gdm";
        wayland = true;
      };
      sddm = {
        enable = cfg.manager == "sddm";
      };
      ly = {
        enable = cfg.manager == "ly";
      };
    };
  };

}
