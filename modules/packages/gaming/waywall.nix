{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.waywall;
in
{

  options.packages.waywall = {
    enable = lib.mkEnableOption ''
      Whether to enable `waywall`, a wayland compositor for Minecraft speedrunning
    '';
    package = lib.mkOption {
      default = pkgs.waywall;
      description = ''
        Specify which package of waywall to install
      '';
      type = lib.types.package;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
