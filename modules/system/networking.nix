{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.cfg.networkmanager;
in
{

  options.cfg.networkmanager = {
    enable = lib.mkEnableOption "Enable networkmanager for networking" // {
      default = true;
    };
    plugins = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        networkmanager-openvpn
      ];
      description = "Additional plugins for networkmanager";
    };
  };

  config = lib.mkIf cfg.enable {
    networking.networkmanager = {
      enable = true;
      plugins = cfg.plugins;
    };
  };

}
