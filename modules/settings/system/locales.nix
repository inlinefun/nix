{

  config,
  lib,
  ...
}:

let
  cfg = config.settings.locales;
in
{
  options.settings.locales = {
    default = lib.mkOption {
      type = lib.types.str;
      description = "Specify the default locale for the system to use";
      default = "en_US.UTF-8";
    };
    extraLocales = lib.mkOption {
      type = lib.types.listOf lib.type.str or lib.types.str;
      description = ''
        List of extra locales for the system to be configured to support
        Use "all" to support all locales made available by glibc
      '';
      default = [ ];
    };
  };

  config = lib.mkDefault {
    i18n = {
      defaultLocale = cfg.default;
      extraLocales = cfg.extraLocales;
    };
  };

}
