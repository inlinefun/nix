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
    connectivityChecking = lib.mkEnableOption ''
      Whether to configure `networkmanager` to check connectivity status
    '';
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

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
        networking.networkmanager = {
          enable = true;
          plugins = cfg.plugins;
        };
      }
      (lib.mkIf cfg.connectivityChecking {
        networking.networkmanager.settings.connectivity.uri =
          "http://nmcheck.gnome.org/check_network_status.txt";
      })
    ]
  );

}
