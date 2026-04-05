{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.features.networkManager;
in
{

  options.features.networkManager = {
    enable =
      lib.mkEnableOption ''
        Whether to enable networking with `networkmanager`
      ''
      // {
        default = true;
      };
    plugins = lib.mkOption {
      default = with pkgs; [
        networkmanager-openvpn
      ];
      description = ''
        A List of plugins to configure and use `networkmanager` with
      '';
      type = lib.types.listOf lib.types.package;
    };
  };

  config = lib.mkIf cfg.enable {
    networking.networkmanager = {
      enable = true;
      plugins = cfg.plugins;
    };
  };

}
