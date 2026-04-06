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
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = cfg.enableOnBoot;
    };
  };

}
