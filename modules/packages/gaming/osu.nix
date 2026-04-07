{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.osu;
  package = pkgs.osu-lazer-bin.override {
    nativeWayland = cfg.wayland;
  };
in
{

  options.packages.osu = {
    enable = lib.mkEnableOption ''
      Whether to enable osu!, A freeware rhythm game
    '';
    wayland = lib.mkEnableOption ''
      Whether to ask the SDL backend to use wayland
    '';
    package = lib.mkOption {
      default = package;
      description = ''
        Specify which package of osu! to install
        Defaults to osu!lazer's AppImage build for multiplayer and score submission
      '';
      type = lib.types.package;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
