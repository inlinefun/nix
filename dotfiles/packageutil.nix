{
  config,
  lib,
  ...
}:

let
  cfg = config.userPackages;
in
{

  options.userPackages = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule (
        { ... }:
        {
          options = {
            install = lib.mkOption {
              default = [ ];
              description = ''
                Specify a list of packages to install for the user
              '';
              type = lib.types.listOf lib.types.package;
            };
          };
        }
      )
    );
    default = { };
  };

  config = {
    hjem.users = lib.mapAttrs (username: opts: {
      user = username;
      packages = opts.install;
    }) cfg;
  };

}
