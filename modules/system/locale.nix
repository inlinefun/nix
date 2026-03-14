{
  config,
  lib,
  ...
}:

let
  cfg = config.cfg.locale;
in
{
  options.cfg.locale = {
    default = lib.mkOption {
      type = lib.types.str;
      default = "en_US.UTF-8";
      description = "Set a default locale for the system";
    };
    extraLocales = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Add additional locales for the system";
    };
  };

  config = {
    i18n = {
      defaultLocale = cfg.default;
      extraLocales = cfg.extraLocales;
    };
  };

}
