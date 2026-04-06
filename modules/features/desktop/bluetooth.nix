{
  config,
  lib,
  ...
}:

let
  cfg = config.features.bluetooth;
in
{

  options.features.bluetooth = {
    enable = lib.mkEnableOption ''
      Whether to enable Bluetooth and services
    '';
    enableOnBoot = lib.mkEnableOption ''
      Whether to enable Bluetooth on boot
    '';
    enableServices =
      lib.mkEnableOption ''
        Whether to enable `blueman` services for handling
      ''
      // {
        default = true;
      };
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
        hardware.bluetooth = {
          enable = true;
          powerOnBoot = cfg.enableOnBoot;
        };
      }
      (lib.mkIf cfg.enableServices {
        services.blueman.enable = true;
      })
    ]
  );

}
