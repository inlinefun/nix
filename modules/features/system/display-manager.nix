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
    enable = lib.mkEnableOption "Whether to enable the usage of a Display manager" // {
      default = true;
    };
    manager = lib.mkOption {
      type = lib.types.enum [
        "gdm"
        "ly"
        "sddm"
        "none"
      ];
      default = "gdm";
      description = "Specify which DisplayManager to use";
    };
  };

  config = lib.mkIf cfg.enable {
    services.displayManager = {
      gdm = {
        enable = cfg.manager == "gdm";
        wayland = true;
      };
      ly = {
        enable = cfg.manager == "ly";
      };
      sddm = {
        enable = cfg.manager == "sddm";
      };
    };
  };

}
