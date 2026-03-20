{
  config,
  lib,
  ...
}:

let
  cfg = config.features.plymouth;
in
{

  options.features.plymouth = {
    enable = lib.mkEnableOption "Whether to enable PlyMouth for boot Splash customisation";
    theme = lib.mkOption {
      type = lib.types.str;
      default = "bgrt";
      description = "Specify the theme for PlyMouth";
    };
  };

  config = lib.mkIf cfg.enable {
    boot.plymouth = {
      enable = true;
      theme = cfg.theme;
    };
  };

}
