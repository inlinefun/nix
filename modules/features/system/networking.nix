{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.features.networking;
in
{

  options.features.networking = {
    enable = lib.mkEnableOption "Enable networking management with `networkmanager`";
    plugins = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        networkmanager-openvpn
      ];
      description = "Plugins to configure and use `networkmanager` with";
    };
  };

  config = lib.mkIf cfg.enable {
    networking.networkmanager = {
      enable = true;
      plugins = cfg.plugins;
    };
  };

}
