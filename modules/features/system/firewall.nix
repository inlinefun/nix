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
    enable = lib.mkEnableOption "Whether to enable the use of a firewall or not" // {
      default = true;
    };
    allowedTCPPorts = lib.mkOption {
      type = lib.types.listOf lib.types.int;
      default = [ ];
      description = "List of ports which accepts incoming TCP connections";
    };
    allowedUDPPorts = lib.mkOption {
      type = lib.types.listOf lib.types.int;
      default = [ ];
      description = "List of ports which accepts incoming UDP connections";
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
