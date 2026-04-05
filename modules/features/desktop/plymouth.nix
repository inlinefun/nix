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
    enable = lib.mkEnableOption ''
      Whether to enable plymouth for boot splash customisation
    '';
    theme = lib.mkOption {
      default = "bgrt";
      description = ''
        Specify a theme for plymouth to be configured to use
      '';
      type = lib.types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    boot.plymouth = {
      enable = true;
      theme = cfg.theme;
    };
  };

}
