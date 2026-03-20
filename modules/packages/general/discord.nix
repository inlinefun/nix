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
    enable = lib.mkEnableOption "Whether to enable discord or not";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.discord;
      description = "Specify a discord client package to use";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
