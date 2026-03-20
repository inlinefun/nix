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
    enable = lib.mkEnableOption "Enable the use of Grub BootLoader";
    osProber = lib.mkEnableOption "Whether to use OSProber to detect windows partitions and add an entry for those detected in grub";
  };

  config = lib.mkIf cfg.enable {
    boot.loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = cfg.osProber;
      };
      efi.canTouchEfiVariables = true;
    };
  };

}
