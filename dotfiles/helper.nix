{
  config,
  lib,
  ...
}:

let
  cfg = config.homeDir;
  mkFilesOption =
    desc:
    lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = { };
      description = desc;
    };
in
{

  options.homeDir = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule (
        { ... }:
        {
          options = {
            files = mkFilesOption "Files to write into $HOME";
            cache = mkFilesOption "Files to write into $XDG_CACHE_DIR";
            config = mkFilesOption "Files to write into $XDG_CONFIG_DIR";
            data = mkFilesOption "Files to write into $XDG_DATA_DIR";
          };
        }
      )
    );
    default = { };
  };

  config = {
    hjem.users = lib.mapAttrs (username: opts: {
      user = username;
      directory = "/home/${username}";
      files = opts.files;
      xdg = {
        cache = opts.cache;
        config = opts.config;
        data = opts.data;
      };
    }) cfg;
  };

}
