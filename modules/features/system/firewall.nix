{
  config,
  lib,
  ...
}:

let
  cfg = config.features.firewall;
in
{

  options.features.firewall = {
    enable =
      lib.mkEnableOption ''
        Whether to enable the firewall or not
      ''
      // {
        default = true;
      };
    allowedTCPPorts = lib.mkOption {
      default = [ ];
      description = ''
        List of ports which accepts incoming TCP connections
      '';
      type = lib.types.listOf lib.types.int;
    };
    allowedUDPPorts = lib.mkOption {
      default = [ ];
      description = ''
        List of ports which accepts incoming UDP connections
      '';
      type = lib.types.listOf lib.types.int;
    };
  };

  config = {
    networking.firewall = {
      enable = cfg.enable;
      allowedTCPPorts = cfg.allowedTCPPorts;
      allowedUDPPorts = cfg.allowedUDPPorts;
    };
  };

}
