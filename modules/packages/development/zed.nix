{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.zed;
in
{

  options.packages.zed = {
    enable = lib.mkEnableOption "Whether to enable Zed, the editor";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.zed-editor;
      description = "Specify a package of zed-editor";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
