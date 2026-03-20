{
  config,
  lib,
  ...
}:

let
  cfg = config.features.libinput;
in
{

  options.features.libinput = {
    enable = lib.mkEnableOption "Whether to enable libinput" // {
      default = true;
    };
    disableMouseAccel = lib.mkEnableOption "Whether to disable mouse acceleration" // {
      default = true;
    };
    disableTouchpadAccel = lib.mkEnableOption "Whether to disable touchpad acceleration";
    allowDragClicking = lib.mkEnableOption "Whether to allow drag clicking";
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
        services.libinput = {
          enable = true;
          mouse = {
            accelProfile = if cfg.disableMouseAccel then "flat" else "adaptive";
          };
          touchpad = {
            accelProfile = if cfg.disableTouchpadAccel then "flat" else "adaptive";
          };
        };
      }
      (lib.mkIf cfg.allowDragClicking {
        environment.etc = {
          "libinput/local-overrides.quirks".text = ''
            [Never Debounce]
            MatchUdevType=mouse
            ModelBouncingKeys=1
          '';
        };
      })
    ]
  );

}
