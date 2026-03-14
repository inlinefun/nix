{ config, lib, ... }:

let
  cfg = config.cfg.input;
in
{

  options.cfg.input = {
    enable = lib.mkEnableOption "Enable libinput" // {
      default = true;
    };
    disableMouseAccel = lib.mkEnableOption "Disable libinput mouse acceleration" // {
      default = true;
    };
    disableTouchpadAccel = lib.mkEnableOption "Disable libinput touchpad acceleration";
    allowDragClicking = lib.mkEnableOption "Allow drag clicking by setting the libinput debounce time to 0";
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
        services.libinput.enable = true;
      }
      (lib.mkIf cfg.disableMouseAccel {
        services.libinput.mouse.accelProfile = "flat";
      })
      (lib.mkIf cfg.disableTouchpadAccel {
        services.libinput.touchpad.accelProfile = "flat";
      })
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
