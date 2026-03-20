{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.osu;
in
{

  options.packages.osu = {
    enable = lib.mkEnableOption "Whether to enable osu! lazer";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.osu-lazer-bin;
      description = "Specify which package of osu lazer to use";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
