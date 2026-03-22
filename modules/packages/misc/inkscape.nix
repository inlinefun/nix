{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.inkscape;
in
{

  options.packages.inkscape = {
    enable = lib.mkEnableOption "Whether to enable `inkscape`, a professional vector graphics editor";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.inkscape;
      description = "Specify a package of inkscape to use";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
