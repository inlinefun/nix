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
    enable = lib.mkEnableOption ''
      Whether to enable Zed, a minimal code editor
    '';
    package = lib.mkOption {
      default = pkgs.zed-editor;
      description = ''
        Specify which package of zed to install
      '';
      type = lib.types.package;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
