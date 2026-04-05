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
    enable = lib.mkEnableOption ''
      Whether to enable osu!, A freeware rhythm game
    '';
    package = lib.mkOption {
      default = pkgs.osu-lazer-bin;
      description = ''
        Specify which package of osu! to install
        Defaults to osu!lazer's AppImage build for multiplayer and score submission
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
