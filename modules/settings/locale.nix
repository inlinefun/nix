{
  config,
  lib,
  ...
}:

let
  cfg = config.settings.locale;
in
{

  options.settings.locale = {
    default = lib.mkOption {
      default = "en_US.UTF-8";
      description = ''
        Specify a locale for the system to be configured to use
      '';
      type = lib.types.str;
    };
    extras = lib.mkOption {
      default = [ ];
      description = ''
        Specify extra locales for the system to be configured to use
      '';
      type = lib.types.listOf lib.types.str or lib.types.str;
    };
  };

  config = {
    i18n = {
      defaultLocale = cfg.default;
      extraLocales = cfg.extras;
    };
  };

}
