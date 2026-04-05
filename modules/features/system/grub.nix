{
  config,
  lib,
  ...
}:

let
  cfg = config.features.grub;
in
{

  options.features.grub = {
    enable =
      lib.mkEnableOption ''
        Whether to enable GRUB as the bootloader or not.
        Defaults to true
      ''
      // {
        default = true;
      };
    useOSProber = lib.mkEnableOption ''
      Whether to enable OS Prober's use to detect other operating systems.
      windows, but whatever
    '';
  };

  config = lib.mkIf cfg.enable {
    boot.loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = cfg.useOSProber;
      };
      efi.canTouchEfiVariables = true;
    };
  };

}
