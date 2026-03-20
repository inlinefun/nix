{ config, lib, ... }:

let
  cfg = config.dotfiles;
in
{

  options.dotfiles = lib.mkOption {
    type = lib.types.attrsOf (lib.types.attrsOf lib.types.anything);
    default = { };
    description = "dotfiles wrapper mapped to hjem.users.<username>.files";
  };

  config = {
    hjem.users = lib.mapAttrs (username: files: {
      user = username;
      directory = "/home/${username}";
      inherit files;
    }) cfg;
  };

}
