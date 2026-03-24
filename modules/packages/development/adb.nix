{
  config,
  lib,
  ...
}:

let
  cfg = config.packages.adb;
in
{

  options.packages.adb = {
    enable = lib.mkEnableoption "Whether to enable Android Debugging Bridge";
  };

  config = lib.mkIf cfg.enable {
    programs.adb = {
      enable = true;
    };
  };

}
