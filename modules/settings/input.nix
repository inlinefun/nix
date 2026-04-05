{
  config,
  lib,
  ...
}:

let
  cfg = config.settings.input;
in
{

  options.settings.input = {
    enable = lib.mkEnableOption ''
      Whether to enable libinput support
    '';
    # Mouse
    allowDoubleClicking = lib.mkEnableOption ''
      Whether to allow double clicking by decreasing the debounce time
    '';
    disableMouseAccel = lib.mkEnableOption ''
      Whether to disable mouse acceleration
    '';
    mouseSpeed = lib.mkOption {
      default = 0.0;
      description = ''
        Specify mouse pointer speed
      '';
      type = lib.types.float;
    };
    # Touchpad
    disableTouchpadAccel = lib.mkEnableOption ''
      Whether to disable pointer acceleration
    '';
    touchpadSpeed = lib.mkOption {
      default = 0.0;
      description = ''
        Specify touchpad pointer speed
      '';
      type = lib.types.float;
    };
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
        services.libinput = {
          enable = true;
          mouse = {
            accelProfile = if cfg.disableMouseAccel then "flat" else "adaptive";
            accelSpeed = cfg.mouseSpeed;
          };
          touchpad = {
            accelProfile = if cfg.disableTouchpadAccel then "flat" else "adaptive";
            accelSpeed = cfg.touchpadSpeed;
          };
        };
      }
      (lib.mkIf cfg.allowDoubleClicking {
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
