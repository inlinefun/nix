{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.kitty;
in
{

  options.packages.kitty = {
    enable = lib.mkEnableOption "Whether to enable kitty, the fast, feature-rich, cross-platform, GPU based terminal.";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.kitty;
      description = "Specify a package of kitty to use";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };

}
