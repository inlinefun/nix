{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.packages.waybar;
in
{

  options.packages.waybar = {
    enable = lib.mkEnableOption "Whether to enable waybar, a lightweight, customizable status bar for Wayland";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.waybar ];
  };

}
