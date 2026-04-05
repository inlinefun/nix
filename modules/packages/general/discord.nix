{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.discord;
in
{

  options.packages.discord = {
    enable = lib.mkEnableOption ''
      Whether to enable the use of a Discord client
    '';
    package = lib.mkOption {
      default = pkgs.discord;
      description = ''
        Specify which package of a discord client to install
      '';
      type = lib.types.package;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
